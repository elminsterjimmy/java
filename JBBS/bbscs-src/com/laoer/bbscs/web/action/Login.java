package com.laoer.bbscs.web.action;

import com.laoer.bbscs.service.*;
import com.laoer.bbscs.service.config.SysConfig;
import com.laoer.bbscs.comm.*;
import com.laoer.bbscs.web.interceptor.*;
import com.laoer.bbscs.web.servlet.UserCookie;
import com.laoer.bbscs.web.servlet.UserSession;
import com.laoer.bbscs.web.ui.RadioInt;
import com.laoer.bbscs.bean.*;
import com.laoer.bbscs.exception.*;
import org.apache.commons.logging.*;
import org.apache.commons.lang.*;
import org.apache.struts2.interceptor.SessionAware;

import java.util.*;

public class Login extends BaseAction implements RequestBasePathAware, RemoteAddrAware, UserCookieAware, SessionAware {

	private static final Log logger = LogFactory.getLog(Login.class);

	/**
	 *
	 */
	private static final long serialVersionUID = 9023754752433923497L;

	// private HttpServletRequest request;

	public Login() {
		this.setRadioYesNoListValues();
		this.setCookieTimeListValues();
	}

	private SysConfig sysConfig;

	private UserService userService;

	private LoginErrorService loginErrorService;

	private UserOnlineService userOnlineService;

	// private Cache userSessionCache;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public SysConfig getSysConfig() {
		return sysConfig;
	}

	public void setSysConfig(SysConfig sysConfig) {
		this.sysConfig = sysConfig;
	}

	private String actionUrl;

	private String tourl;

	private String passwd;

	private String username;

	private int hiddenLogin;

	private String authCode;

	private boolean urlRewrite = false;

	private boolean useAuthCode = true;

	private int cookieTime = -1;

	public String getActionUrl() {
		return actionUrl;
	}

	public void setActionUrl(String actionUrl) {
		this.actionUrl = actionUrl;
	}

	public String getTourl() {
		return tourl;
	}

	public void setTourl(String tourl) {
		this.tourl = tourl;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public int getHiddenLogin() {
		return hiddenLogin;
	}

	public void setHiddenLogin(int hiddenLogin) {
		this.hiddenLogin = hiddenLogin;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	// public void setServletRequest(HttpServletRequest request) {
	// this.request = request;
	// }

	private String remoteAddr;

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}

	private UserCookie userCookie;

	public void setUserCookie(UserCookie userCookie) {
		this.userCookie = userCookie;
	}

	public String getRemoteAddr() {
		return remoteAddr;
	}

	public UserCookie getUserCookie() {
		return userCookie;
	}

	private String basePath;

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}

	public String getBasePath() {
		return basePath;
	}

	List<RadioInt> radioYesNoList = new ArrayList<RadioInt>();

	private void setRadioYesNoListValues() {
		radioYesNoList.add(new RadioInt(0, this.getText("bbscs.no")));
		radioYesNoList.add(new RadioInt(1, this.getText("bbscs.yes")));
	}

	public List<RadioInt> getRadioYesNoList() {
		return radioYesNoList;
	}

	public void setRadioYesNoList(List<RadioInt> radioYesNoList) {
		this.radioYesNoList = radioYesNoList;
	}

	List<RadioInt> cookieTimeList = new ArrayList<RadioInt>();

	private void setCookieTimeListValues() {
		cookieTimeList.add(new RadioInt(365 * 24 * 3600, this.getText("login.cookietime0")));
		cookieTimeList.add(new RadioInt(30 * 24 * 3600, this.getText("login.cookietime1")));
		cookieTimeList.add(new RadioInt(24 * 3600, this.getText("login.cookietime2")));
		cookieTimeList.add(new RadioInt(-1, this.getText("login.cookietime3")));
	}

	public List<RadioInt> getCookieTimeList() {
		return cookieTimeList;
	}

	public void setCookieTimeList(List<RadioInt> cookieTimeList) {
		this.cookieTimeList = cookieTimeList;
	}

	public boolean isUrlRewrite() {
		return urlRewrite;
	}

	public void setUrlRewrite(boolean urlRewrite) {
		this.urlRewrite = urlRewrite;
	}

	private Map session;

	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	private void setUserAuthCodeValue() {
		this.setUseAuthCode(this.getSysConfig().isUseAuthCode());
	}

	public String execute() {
		this.setUrlRewrite(Constant.USE_URL_REWRITE);
		this.setUserAuthCodeValue();
		// setRadioYesNoListValues();
		if (this.getAction().equalsIgnoreCase("index")) {
			this.setAction("login");
			this.setHiddenLogin(0);

			// this.setTourl("main");
			if (Constant.USE_URL_REWRITE) {
				// tourl = BBSCSUtil.absoluteActionURLHtml(request,
				// "/main.html").toString();
				tourl = this.getBasePath() + "main.html";
			} else {
				// tourl = BBSCSUtil.absoluteActionURL(request,
				// "/main").toString();
				tourl = this.getBasePath() + BBSCSUtil.getActionMappingURLWithoutPrefix("main");
			}

			return this.input();
		}
		if (this.getAction().equalsIgnoreCase("admin")) {
			this.setAction("login");
			this.setHiddenLogin(0);
			// tourl = BBSCSUtil.absoluteActionURL(request,
			// "/adminMain").toString();
			tourl = this.getBasePath() + BBSCSUtil.getActionMappingURLWithoutPrefix("adminMain");

			return this.input();
		}
		if (this.getAction().equalsIgnoreCase("relogin")) {
			this.setAction("login");
			this.setHiddenLogin(0);

			if (Constant.USE_URL_REWRITE) {
				tourl = this.getBasePath() + "main.html";
			} else {
				tourl = this.getBasePath() + BBSCSUtil.getActionMappingURLWithoutPrefix("main");
			}
			this.addActionError(this.getText("error.login.re"));
			return this.input();
		}

		if (this.getAction().equalsIgnoreCase("login")) {
			return this.login();
		}

		if (this.getAction().equalsIgnoreCase("check")) {
			return this.check();
		}

		return this.input();
	}

	public String index() {
		this.setAction("login");
		this.setHiddenLogin(0);
		if (Constant.USE_URL_REWRITE) {
			tourl = this.getBasePath() + "main.html";
		} else {
			tourl = this.getBasePath() + BBSCSUtil.getActionMappingURLWithoutPrefix("main");
		}

		return this.input();
	}

	public String check() {
		if (StringUtils.isNotBlank(this.getUserCookie().getUserName())
				&& StringUtils.isNotBlank(this.getUserCookie().getPasswd())) {
			return this.cookieLogin();
		} else {
			return this.index();
		}
	}

	public String input() {
		if (this.getSysConfig().getUsePass() == 0) {
			return INPUT;
		} else {
			this.setActionUrl(this.getSysConfig().getPassUrl());
			return "loginPass";
		}
	}

	@SuppressWarnings("unchecked")
	public String login() {
		if (StringUtils.isBlank(this.username) || StringUtils.isBlank(this.passwd)) {
			this.addActionError(this.getText("error.nullerror"));
			return INPUT;
		}

		UserInfo ui = this.getUserService().findUserInfoByUserName(this.getUsername());
		if (ui == null) {
			this.addActionError(this.getText("error.user.notexist"));
			return INPUT;
		}
		if (this.getSysConfig().isUseSafeLogin()) {
			if (this.getLoginErrorService().isCanNotLogin(ui.getId())) {
				this.addActionError(this.getText("error.login.times"));
				return INPUT;
			}
		}

		if (!Util.hash(this.getPasswd()).equals(ui.getRePasswd())) { // 密码错误
			if (this.getSysConfig().isUseSafeLogin()) {
				try {
					this.getLoginErrorService().createLoginError(ui.getId());
				} catch (BbscsException ex1) {
					logger.error(ex1);
				}
			}
			this.addActionError(this.getText("error.login.passwd"));
			return INPUT;
		}

		if (this.getSysConfig().isUseAuthCode()) {
			//String cauthCode = this.getUserCookie().getAuthCode();
			String cauthCode = this.getSessionAuthCode();

			if (StringUtils.isBlank(cauthCode) || !cauthCode.equals(this.getAuthCode())) {
				this.addActionError(this.getText("error.login.authcode"));
				return INPUT;
			}
		}

		ui.setLastLoginIP(ui.getLoginIP());
		ui.setLastLoginTime(ui.getLoginTime());

		ui.setLoginIP(this.getRemoteAddr());
		ui.setLoginTime(new Date());
		ui.setUserLocale(this.getLocale().toString());

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
		if (this.getHiddenLogin() == 1 || ui.getHiddenLogin() == 1) { // 用户隐身登录
			uo.setHiddenUser(1);
		}

		try {
			ui = this.getUserService().saveAtLogin(ui); // 用户登录处理
			uo = this.getUserOnlineService().createUserOnline(uo); // 加入在线用户表
		} catch (BbscsException ex) {
			logger.error(ex);
			return INPUT;
		}

		UserSession us = userService.getUserSession(ui);
		us.setValidateCode(uo.getValidateCode());
		// this.getUserSessionCache().add(ui.getUserName(), us);
		this.getSession().put(Constant.USER_SESSION_KEY, us);

		this.getUserCookie().removeAuthCode();
		this.getUserCookie().addCookies(ui);
		// this.getUserCookie().addValidateCode(uo.getValidateCode());
		if (this.getCookieTime() != -1) {
			this.getUserCookie().addC("U", this.getUsername(), this.getCookieTime());
			this.getUserCookie().addDES("P", Util.hash(this.getPasswd()), this.getCookieTime());
		}

		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String cookieLogin() {
		UserInfo ui = this.getUserService().findUserInfoByUserName(this.getUserCookie().getUserName());
		if (ui == null) {
			this.addActionError(this.getText("error.user.notexist"));
			return INPUT;
		}

		if (!this.getUserCookie().getPasswd().equals(ui.getRePasswd())) { // 密码错误
			if (this.getSysConfig().isUseSafeLogin()) {
				try {
					this.getLoginErrorService().createLoginError(ui.getId());
				} catch (BbscsException ex1) {
					logger.error(ex1);
				}
			}
			this.addActionError(this.getText("error.login.passwd"));
			return INPUT;
		}

		ui.setLastLoginIP(ui.getLoginIP());
		ui.setLastLoginTime(ui.getLoginTime());

		ui.setLoginIP(this.getRemoteAddr());
		ui.setLoginTime(new Date());
		ui.setUserLocale(this.getLocale().toString());

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
		if (this.getHiddenLogin() == 1 || ui.getHiddenLogin() == 1) { // 用户隐身登录
			uo.setHiddenUser(1);
		}

		try {
			ui = this.getUserService().saveAtLogin(ui); // 用户登录处理
			uo = this.getUserOnlineService().createUserOnline(uo); // 加入在线用户表
		} catch (BbscsException ex) {
			logger.error(ex);
			return INPUT;
		}

		UserSession us = userService.getUserSession(ui);
		us.setValidateCode(uo.getValidateCode());
		this.getSession().put(Constant.USER_SESSION_KEY, us);

		this.getUserCookie().removeAuthCode();
		this.getUserCookie().addCookies(ui);

		if (Constant.USE_URL_REWRITE) {
			tourl = this.getBasePath() + "main.html";
		} else {
			tourl = this.getBasePath() + BBSCSUtil.getActionMappingURLWithoutPrefix("main");
		}

		return SUCCESS;
	}

	public LoginErrorService getLoginErrorService() {
		return loginErrorService;
	}

	public void setLoginErrorService(LoginErrorService loginErrorService) {
		this.loginErrorService = loginErrorService;
	}

	public UserOnlineService getUserOnlineService() {
		return userOnlineService;
	}

	public void setUserOnlineService(UserOnlineService userOnlineService) {
		this.userOnlineService = userOnlineService;
	}

	public boolean isUseAuthCode() {
		return useAuthCode;
	}

	public void setUseAuthCode(boolean useAuthCode) {
		this.useAuthCode = useAuthCode;
	}

	public int getCookieTime() {
		return cookieTime;
	}

	public void setCookieTime(int cookieTime) {
		this.cookieTime = cookieTime;
	}

	/*
	 * public Cache getUserSessionCache() { return userSessionCache; }
	 *
	 * public void setUserSessionCache(Cache userSessionCache) {
	 * this.userSessionCache = userSessionCache; }
	 */

	private String getSessionAuthCode() {
        return (String)this.getSession().get("authCode");
    }

}
