package com.laoer.bbscs.web.action;

import java.util.List;

import com.laoer.bbscs.bean.UserDetail;
import com.laoer.bbscs.bean.UserInfo;
import com.laoer.bbscs.comm.BBSCSUtil;
import com.laoer.bbscs.service.BookMarkService;
import com.laoer.bbscs.service.ForumService;
import com.laoer.bbscs.service.UserService;
import com.laoer.bbscs.service.web.PageList;
import com.laoer.bbscs.service.web.Pages;

public class UserInfoAction extends BaseMainAction {

	/**
	 *
	 */
	private static final long serialVersionUID = 2304722256102375981L;

	private String id;

	private String t;

	private String username;

	private UserService userService;

	private BookMarkService bookMarkService;

	private ForumService forumService;

	private List ownMainList;

	private List ownReList;

	private UserInfo ui;

	private UserDetail userDetail;

	public BookMarkService getBookMarkService() {
		return bookMarkService;
	}

	public void setBookMarkService(BookMarkService bookMarkService) {
		this.bookMarkService = bookMarkService;
	}

	public ForumService getForumService() {
		return forumService;
	}

	public void setForumService(ForumService forumService) {
		this.forumService = forumService;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getT() {
		return t;
	}

	public void setT(String t) {
		this.t = t;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List getOwnMainList() {
		return ownMainList;
	}

	public void setOwnMainList(List ownMainList) {
		this.ownMainList = ownMainList;
	}

	public List getOwnReList() {
		return ownReList;
	}

	public void setOwnReList(List ownReList) {
		this.ownReList = ownReList;
	}

	public UserInfo getUi() {
		return ui;
	}

	public void setUi(UserInfo ui) {
		this.ui = ui;
	}

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

	private PageList pageList;

	public PageList getPageList() {
		return pageList;
	}

	public void setPageList(PageList pageList) {
		this.pageList = pageList;
	}

	public String id() {
		this.ui = this.getUserService().findUserInfoById(this.getId());
		if (this.ui == null) {
			this.addActionError(this.getText("error.user.noexist"));
			return ERROR;
		}

		ui.getUserDetail().setBrief(BBSCSUtil.filterText(ui.getUserDetail().getBrief(), false, false, true));

		this.setUserDetail(ui.getUserDetail());

		Pages pages = new Pages();
		pages.setPage(1);
		pages.setPerPageNum(10);
		pages.setTotalNum(10);

		PageList pl = this.getForumService().findForumsOwner(ui.getId(), 1, pages);
		this.setOwnMainList(pl.getObjectList());

		pages = new Pages();
		pages.setPage(1);
		pages.setPerPageNum(10);
		pages.setTotalNum(10);

		pl = this.getForumService().findForumsOwner(ui.getId(), 0, pages);
		this.setOwnReList(pl.getObjectList());

		return SUCCESS;

	}

	public String name() {
		this.ui = this.getUserService().findUserInfoByUserName(this.getUsername());
		if (this.ui == null) {
			this.addActionError(this.getText("error.user.noexist"));
			return ERROR;
		}

		this.setUserDetail(ui.getUserDetail());

		Pages pages = new Pages();
		pages.setPage(1);
		pages.setPerPageNum(10);
		pages.setTotalNum(10);

		PageList pl = this.getForumService().findForumsOwner(ui.getId(), 1, pages);
		this.setOwnMainList(pl.getObjectList());

		pages = new Pages();
		pages.setPage(1);
		pages.setPerPageNum(10);
		pages.setTotalNum(10);

		pl = this.getForumService().findForumsOwner(ui.getId(), 0, pages);
		this.setOwnReList(pl.getObjectList());

		return SUCCESS;
	}

	public String bookmark() {
		Pages pages = new Pages();
		pages.setPage(this.getPage());
		pages.setPerPageNum(10);
		pages.setFileName(BBSCSUtil.getActionMappingURLWithoutPrefix("userInfo?action=" + this.getAction() + "&id="
				+ this.getId() + "&ajax=shtml"));
		this.setPageList(this.getBookMarkService().findBookMarksByUserIDShare(this.getId(), 1, pages));
		return "bookMarkInUserInfo";
	}

}
