package com.laoer.bbscs.web.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.laoer.bbscs.service.config.SysConfig;
import com.laoer.bbscs.web.servlet.UserCookie;
import com.laoer.bbscs.web.servlet.UserSession;
import com.laoer.bbscs.service.*;
import com.laoer.bbscs.bean.*;
import com.laoer.bbscs.exception.*;
import com.laoer.bbscs.comm.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import org.apache.commons.logging.*;
import java.util.*;

public class UserLoginInterceptor extends AbstractInterceptor {

	private static final Log logger = LogFactory.getLog(UserLoginInterceptor.class);

	/**
	 *
	 */
	private static final long serialVersionUID = 6748629623401983281L;

	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ac = invocation.getInvocationContext();
		/*
		 * System.out.println(ac.getName()); Map map = ac.getParameters();
		 * System.out.println(map); Set ms = map.entrySet(); Iterator it =
		 * ms.iterator(); while (it.hasNext()) { Map.Entry e = (Map.Entry)
		 * it.next(); System.out.println(e.getKey());
		 * System.out.println(e.getValue()); }
		 */
		// ac.getValueStack().set("mytest", "Laoer");
		// ac.getValueStack().set("interceptError", "error");
		// if (true) {
		// return "intercepthtml";
		// }
		HttpServletRequest request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse) ac.get(ServletActionContext.HTTP_RESPONSE);
		// logger.debug("request:"+request+" response:" + response);
		// HttpServletResponse response = ServletActionContext.getResponse();

		ServletContext servletContext = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
		WebApplicationContext wc = WebApplicationContextUtils.getWebApplicationContext(servletContext);

		if (wc == null) {
			logger.error("ApplicationContext could not be found.");
		} else {
			SysConfig sysConfig = (SysConfig) wc.getBean("sysConfig");
			// Cache userSessionCache = (Cache) wc.getBean("userSessionCache");

			UserSession us = (UserSession) ac.getSession().get(Constant.USER_SESSION_KEY);
			UserCookie uc = new UserCookie(request, response, sysConfig);

			if (sysConfig.isUsePass()) {
				if (uc.isLoginPass()) {// 通行证已登录
					boolean isNewUser = false;
					UserService userService = (UserService) wc.getBean("userService");
					UserOnlineService userOnlineService = (UserOnlineService) wc.getBean("userOnlineService");
					if (us == null) {// 用户没有在社区登录
						UserInfo ui = userService.findUserInfoByUserName(uc.getPusername());
						if (ui != null) {// 用户存在，做登录

							ui.setLastLoginIP(ui.getLoginIP());
							ui.setLastLoginTime(ui.getLoginTime());

							ui.setLoginIP(request.getRemoteAddr());
							ui.setLoginTime(new Date());
							ui.setUserLocale(request.getLocale().toString());

							long nowTime = System.currentTimeMillis();
							UserOnline uo = new UserOnline();
							uo.setAtPlace("");
							uo.setBoardID(0);
							uo.setNickName(ui.getNickName());
							uo.setOnlineTime(nowTime);
							uo.setUserGroupID(ui.getGroupID());
							uo.setUserID(ui.getId());
							uo.setUserName(ui.getUserName());
							uo.setValidateCode(ui.getId() + "_" + nowTime);
							if (ui.getHiddenLogin() == 1) { // 用户隐身登录
								uo.setHiddenUser(1);
							}

							try {
								ui = userService.saveAtLogin(ui); // 用户登录处理
								uo = userOnlineService.createUserOnline(uo); // 加入在线用户表

								us = userService.getUserSession(ui);
								us.setLastActiveTime(nowTime);
								us.setValidateCode(uo.getValidateCode());

								ac.getSession().put(Constant.USER_SESSION_KEY, us);

								// UserSession us =
								// userService.getUserSession(ui);
								// userSessionCache.add(ui.getUserName(), us);
								uc.addCookies(ui);
							} catch (BbscsException ex) {
								logger.error(ex);
							}

						} else { // 用户不存在，是新用户
							isNewUser = true;
						}
					} else {// 用户已经在社区登录
						if (!us.getUserName().equals(uc.getPusername())) {// 用户在社区中的登录名和通行证中的用户名不一致
							// if (!uc.getUserName().equals(uc.getPusername()))
							// {// 用户在社区中的登录名和通行证中的用户名不一致
							UserInfo ui = userService.findUserInfoByUserName(uc.getPusername());
							if (ui != null) { // 用户存在，重新登录
								uc.removeAllCookies();
								ui.setLastLoginIP(ui.getLoginIP());
								ui.setLastLoginTime(ui.getLoginTime());

								ui.setLoginIP(request.getRemoteAddr());
								ui.setLoginTime(new Date());
								ui.setUserLocale(request.getLocale().toString());

								long nowTime = System.currentTimeMillis();
								UserOnline uo = new UserOnline();
								uo.setAtPlace("");
								uo.setBoardID(0);
								uo.setNickName(ui.getNickName());
								uo.setOnlineTime(nowTime);
								uo.setUserGroupID(ui.getGroupID());
								uo.setUserID(ui.getId());
								uo.setUserName(ui.getUserName());
								uo.setValidateCode(ui.getId() + "_" + nowTime);
								if (ui.getHiddenLogin() == 1) { // 用户隐身登录
									uo.setHiddenUser(1);
								}

								try {
									ui = userService.saveAtLogin(ui); // 用户登录处理

									uo = userOnlineService.createUserOnline(uo); // 加入在线用户表

									us = userService.getUserSession(ui);
									us.setLastActiveTime(nowTime);
									us.setValidateCode(uo.getValidateCode());

									ac.getSession().put(Constant.USER_SESSION_KEY, us);

									// UserSession us =
									// userService.getUserSession(ui);
									// userSessionCache.add(ui.getUserName(),
									// us);
									uc.addCookies(ui);
								} catch (BbscsException ex) {
									logger.error(ex);
								}

							} else { // 用户不存在，是新用户
								isNewUser = true;
							}
						}
					}

					if (isNewUser) { // 创建社区用户
						Locale locale = request.getLocale();
						IPSeeker ipSeeker = (IPSeeker) wc.getBean("ipSeeker");
						UserInfo ui = new UserInfo();
						ui.setAcceptFriend(1);
						ui.setAnswer("Answer");
						ui.setArticleEliteNum(0);
						ui.setArticleNum(0);
						ui.setBirthDay(1);
						ui.setBirthMonth(1);
						ui.setBirthYear(1980);
						ui.setEmail(uc.getPusername() + "@");
						ui.setExperience(0);
						ui.setForumPerNum(0);
						ui.setForumViewMode(0);
						ui.setHavePic(0);
						ui.setLastLoginIP("");
						ui.setLastLoginTime(new Date());
						ui.setLifeForce(0);
						ui.setLiterary(0);
						ui.setLoginIP("");
						ui.setLoginTime(new Date());
						ui.setLoginTimes(1);
						ui.setNickName(sysConfig.bestrowScreenNickName(uc.getPusername()));
						ui.setPasswd("1234");
						ui.setPicFileName("");
						ui.setPostPerNum(0);
						ui.setQuestion("Question");
						ui.setReceiveNote(1);
						ui.setRegTime(new Date());
						ui.setRePasswd(Util.hash("1234"));
						ui.setSignDetail0("");
						ui.setSignDetail1("");
						ui.setSignDetail2("");
						ui.setSignName0("A");
						ui.setSignName1("B");
						ui.setSignName2("C");
						ui.setStayTime(0);
						ui.setTimeZone("GMT+08:00");
						ui.setUserFrom(ipSeeker.getCountry(request.getRemoteAddr()));
						ui.setUserKnow(0);
						ui.setUserName(uc.getPusername());
						ui.setUserTitle(0);
						if (sysConfig.isCheckRegUser()) {
							ui.setValidated(0);
							ui.setGroupID(Constant.USER_GROUP_UNVUSER);
						} else {
							ui.setValidated(1);
							ui.setGroupID(Constant.USER_GROUP_REGUSER);
						}
						ui.setEditType(-1);
						ui.setUserLocale(locale.toString());
						ui.setCoin(100);

						UserDetail ud = new UserDetail();
						ud.setBrief("");
						ud.setDreamJob("");
						ud.setDreamLover("");
						ud.setFavourArt("");
						ud.setFavourBook("");
						ud.setFavourChat("");
						ud.setFavourMovie("");
						ud.setFavourMusic("");
						ud.setFavourPeople("");
						ud.setFavourTeam("");
						ud.setGraduate("");
						ud.setHeight("");
						ud.setHomePage("");
						ud.setIcqNo("");
						ud.setInterest("");
						ud.setMsn("");
						ud.setOicqNo("");
						ud.setSex((short) 0);
						ud.setWeight("");
						ud.setYahoo("");

						ui.setUserDetail(ud);
						ud.setUserInfo(ui);

						try {
							ui = userService.saveUserInfo(ui); // 创建用户

							SysStatService sysStatService = (SysStatService) wc.getBean("sysStatService");
							sysStatService.saveAllUserNum(userService.getAllUserNum(), ui.getUserName());

							// 用户登录过程
							ui.setLastLoginIP(ui.getLoginIP());
							ui.setLastLoginTime(ui.getLoginTime());

							ui.setLoginIP(request.getRemoteAddr());
							ui.setLoginTime(new Date());

							long nowTime = System.currentTimeMillis();
							UserOnline uo = new UserOnline();
							uo.setAtPlace("");
							uo.setBoardID(0);
							uo.setNickName(ui.getNickName());
							uo.setOnlineTime(nowTime);
							uo.setUserGroupID(ui.getGroupID());
							uo.setUserID(ui.getId());
							uo.setUserName(ui.getUserName());
							uo.setValidateCode(ui.getId() + "_" + nowTime);
							if (ui.getHiddenLogin() == 1) { // 用户隐身登录
								uo.setHiddenUser(1);
							}

							ui = userService.saveAtLogin(ui); // 用户登录处理

							uo = userOnlineService.createUserOnline(uo); // 加入在线用户表

							us = userService.getUserSession(ui);
							us.setLastActiveTime(nowTime);
							us.setValidateCode(uo.getValidateCode());

							ac.getSession().put(Constant.USER_SESSION_KEY, us);

							// UserSession us = userService.getUserSession(ui);
							// userSessionCache.add(ui.getUserName(), us);
							uc.addCookies(ui);

							// 用户登录过程结束

						} catch (BbscsException ex) {
							logger.error(ex);
						}
					}
				} else {// 通行证未登录，做游客登录
					UserService userService = (UserService) wc.getBean("userService");
					UserOnlineService userOnlineService = (UserOnlineService) wc.getBean("userOnlineService");
					if (us == null) {// 用户没有登录过，直接做游客登录
						// if (!uc.isLoginUser()) {// 用户没有登录过，直接做游客登录

						long nowTime = System.currentTimeMillis();
						UserOnline uo = new UserOnline();
						uo.setAtPlace("");
						uo.setBoardID(0);
						uo.setNickName("Guest");
						uo.setOnlineTime(nowTime);
						uo.setUserGroupID(Constant.USER_GROUP_GUEST);
						uo.setUserID(Constant.GUEST_USERID + nowTime);
						uo.setUserName(Constant.GUEST_USERNAME + nowTime);
						uo.setValidateCode(Constant.GUEST_USERID + "_" + nowTime);
						try {
							uo = userOnlineService.createUserOnline(uo);

							us = this.createGuestUserSession(uo.getUserID(), uo.getUserName(), userService);
							us.setLastActiveTime(System.currentTimeMillis());
							us.setValidateCode(uo.getValidateCode());// ???
							ac.getSession().put(Constant.USER_SESSION_KEY, us);

							uc.addGuestCookies();

							// UserSession us =
							// this.createGuestUserSession(uo.getUserID(),
							// uo.getUserName(), userService);
							// userSessionCache.add(uo.getUserName(), us);
							// uc.addGuestCookies(uo.getUserName());

						} catch (BbscsException ex) {
							logger.error(ex);
						}

					} else {// 用户在社区是登录状态，需要强制做游客登录
						/*
						 * UserSession us = (UserSession)
						 * userSessionCache.get(uc.getUserName());// 取用户Session
						 * if (us == null) { us =
						 * userService.getUserSession(uc.getUserName());
						 * userSessionCache.add(uc.getUserName(), us); }
						 */
						if (us.getGroupID() != Constant.USER_GROUP_GUEST) {// //如果原来用户不是游客，先清除原Session，做游客登录
							// userSessionCache.remove(uc.getUserName());
							ac.getSession().remove(Constant.USER_SESSION_KEY);
							uc.removeAllCookies();

							long nowTime = System.currentTimeMillis();
							UserOnline uo = new UserOnline();
							uo.setAtPlace("");
							uo.setBoardID(0);
							uo.setNickName("Guest");
							uo.setOnlineTime(nowTime);
							uo.setUserGroupID(Constant.USER_GROUP_GUEST);
							uo.setUserID(Constant.GUEST_USERID + nowTime);
							uo.setUserName(Constant.GUEST_USERNAME + nowTime);
							uo.setValidateCode(Constant.GUEST_USERID + "_" + nowTime);
							try {
								uo = userOnlineService.createUserOnline(uo);
								us = this.createGuestUserSession(uo.getUserID(), uo.getUserName(), userService);

								us.setLastActiveTime(System.currentTimeMillis());
								us.setValidateCode(uo.getValidateCode());// ???
								ac.getSession().put(Constant.USER_SESSION_KEY, us);

								uc.addGuestCookies();

								// userSessionCache.add(uo.getUserName(), us);
								// uc.addGuestCookies(uo.getUserName());

							} catch (BbscsException ex) {
								logger.error(ex);
							}

						}

					}
				}
			} else {// 不使用通行证
				if (us == null) {// 用户未登录，做游客登录

					UserService userService = (UserService) wc.getBean("userService");
					UserOnlineService userOnlineService = (UserOnlineService) wc.getBean("userOnlineService");

					if (uc.isSaveLoginCookie()) {
						UserInfo ui = userService.findUserInfoByUserName(uc.getUserName());
						ui.setLastLoginIP(ui.getLoginIP());
						ui.setLastLoginTime(ui.getLoginTime());

						ui.setLoginIP(request.getRemoteAddr());
						ui.setLoginTime(new Date());
						ui.setUserLocale(request.getLocale().toString());

						long nowTime = System.currentTimeMillis();
						UserOnline uo = new UserOnline();
						uo.setAtPlace("");
						uo.setBoardID(0);
						uo.setNickName(ui.getNickName());
						uo.setOnlineTime(nowTime);
						uo.setUserGroupID(ui.getGroupID());
						uo.setUserID(ui.getId());
						uo.setUserName(ui.getUserName());
						uo.setValidateCode(ui.getId() + "_" + nowTime);
						uo.setHiddenUser(0);

						ui = userService.saveAtLogin(ui); // 用户登录处理
						uo = userOnlineService.createUserOnline(uo); // 加入在线用户表

						us = userService.getUserSession(ui);
						us.setValidateCode(uo.getValidateCode());
						ac.getSession().put(Constant.USER_SESSION_KEY, us);

						uc.removeAuthCode();
						uc.addCookies(ui);
					} else {

						long nowTime = System.currentTimeMillis();
						UserOnline uo = new UserOnline();
						uo.setAtPlace("");
						uo.setBoardID(0);
						uo.setNickName("Guest");
						uo.setOnlineTime(nowTime);
						uo.setUserGroupID(Constant.USER_GROUP_GUEST);
						uo.setUserID(Constant.GUEST_USERID + nowTime);
						uo.setUserName(Constant.GUEST_USERNAME + nowTime);
						uo.setValidateCode(Constant.GUEST_USERID + "_" + nowTime);
						try {
							uo = userOnlineService.createUserOnline(uo);
							us = this.createGuestUserSession(uo.getUserID(), uo.getUserName(), userService);
							us.setLastActiveTime(System.currentTimeMillis());
							us.setValidateCode(uo.getValidateCode());// ???
							ac.getSession().put(Constant.USER_SESSION_KEY, us);

							uc.removeAuthCode();
							uc.addGuestCookies();

						} catch (BbscsException ex) {
							logger.error(ex);
						}
					}
				}
			}
		}

		return invocation.invoke();
	}

	private UserSession createGuestUserSession(String gUestID, String gUesrName, UserService userService) {
		UserSession us = new UserSession();

		us.setGroupID(Constant.USER_GROUP_GUEST);
		us.setId(gUestID);
		us.setNickName("Guest");
		us.setUserName(gUesrName);
		Map[] permissionMap = userService.getUserPermission(Constant.USER_GROUP_GUEST);
		us.setUserPermissionArray(permissionMap);
		return us;
	}

}
