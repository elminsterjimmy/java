package com.laoer.bbscs.web.taglib;

import java.io.IOException;
import java.io.Writer;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.struts2.components.Component;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.laoer.bbscs.bean.UserInfoSimple;
import com.laoer.bbscs.comm.BBSCSUtil;
import com.laoer.bbscs.comm.Constant;
import com.laoer.bbscs.service.UserService;
import com.laoer.bbscs.service.config.SysConfig;
import com.opensymphony.xwork2.util.ValueStack;

public class UserInfoInPost extends Component {

	private PageContext pageContext;

	private HttpServletRequest request;

	//private HttpServletResponse response;

	protected String idValue = "";

	protected String styleClass = "pic1";

	protected String facePicName = "images/defaultFace.gif";

	public UserInfoInPost(ValueStack stack, PageContext pageContext, HttpServletRequest request,
			HttpServletResponse response) {
		super(stack);
		this.pageContext = pageContext;
		this.request = request;
		//this.response = response;
	}

	public boolean start(Writer writer) {
		boolean result = super.start(writer);

		if (idValue == null) {
			idValue = "top";
		} else if (altSyntax()) {
			if (idValue.startsWith("%{") && idValue.endsWith("}")) {
				idValue = idValue.substring(2, idValue.length() - 1);
			}
		}

		Object value = this.getStack().findValue(idValue);
		StringBuffer sb = new StringBuffer();
		if (value == null) {
			sb.append("");
			return result;
		}
		String userID = (String) value;
		WebApplicationContext wc = WebApplicationContextUtils.getWebApplicationContext(this.pageContext
				.getServletContext());
		UserService userService = (UserService) wc.getBean("userService");
		SysConfig sysConfig = (SysConfig) wc.getBean("sysConfig");
		ResourceBundleMessageSource messageSource = (ResourceBundleMessageSource) wc.getBean("messageSource");
		UserInfoSimple uis = userService.getUserInfoSimple(userID);
		if (sysConfig.getPostShowUserImg() == 1) {
			if (uis.getHavePic() == 1 && !uis.getPicFileName().equals("-")) {
				sb.append("<a href=\"");
				sb.append(BBSCSUtil.getUserWebPath(uis.getId()));
				sb.append(uis.getPicFileName());
				sb.append("\" target=\"_blank\">");
				sb.append("<img src=\"");
				sb.append(BBSCSUtil.getUserWebPath(uis.getId()));
				sb.append(uis.getPicFileName());
				sb.append(Constant.IMG_SMALL_FILEPREFIX);
				sb.append("\" alt=\"Face\" class=\"");
				sb.append(this.getStyleClass());
				sb.append("\" border=\"0\"/>");
				sb.append("</a><br/>");
			} else {
				sb.append("<img src=\"");
				sb.append(facePicName);
				sb.append("\" alt=\"Face\" /><br/>");
			}
			sb.append("<br/>");
		}
		sb.append(messageSource.getMessage("uiinpost.artnum", null, request.getLocale()));
		sb.append(":");
		// sb.append("发帖:");
		sb.append(uis.getArticleNum());
		sb.append("<br/>");

		sb.append(messageSource.getMessage("uiinpost.elitenum", null, request.getLocale()));
		sb.append(":");

		// sb.append("精华:");
		sb.append(uis.getArticleEliteNum());
		sb.append("<br/>");
		int titleValue = userService.getUserTitleValue(uis);

		sb.append(messageSource.getMessage("uiinpost.point", null, request.getLocale()));
		sb.append(":");

		// sb.append("积分:");
		sb.append(titleValue);
		sb.append("<br/>");
		// String userTitle = BBSCSUtil.getUserTitle(uis.getUserTitle(),
		// titleValue, request.getLocale());
		String userTitle = userService.getUserTitle(uis);

		sb.append(messageSource.getMessage("uiinpost.level", null, request.getLocale()));
		sb.append(":");

		// sb.append("等级:");
		sb.append(userTitle);
		sb.append("<br/>");

		sb.append(messageSource.getMessage("bbscs.coin", null, request.getLocale()));
		sb.append(":");
		sb.append(uis.getCoin());
		sb.append("<br/>");

		sb.append(messageSource.getMessage("uiinpost.from", null, request.getLocale()));
		sb.append(":");

		// sb.append("来自:");
		sb.append(uis.getUserFrom());
		sb.append("<br/>");

		sb.append(messageSource.getMessage("uiinpost.regtime", null, request.getLocale()));
		sb.append(":");

		// sb.append("注册:");
		sb.append(BBSCSUtil.formatDateTime(new Date(uis.getRegTime()), sysConfig.getRegDateTimeFormat()));
		sb.append("<br/>");

		sb.append(messageSource.getMessage("uiinpost.lastlogin", null, request.getLocale()));
		sb.append(":");

		// sb.append("最后登录:");
		sb.append(BBSCSUtil.formatDateTime(new Date(uis.getLoginTime()), "MM-dd HH:mm"));
		try {
			writer.write(sb.toString());
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}

		return result;
	}

	public String getFacePicName() {
		return facePicName;
	}

	public void setFacePicName(String facePicName) {
		this.facePicName = facePicName;
	}

	public String getIdValue() {
		return idValue;
	}

	public void setIdValue(String idValue) {
		this.idValue = idValue;
	}

	public String getStyleClass() {
		return styleClass;
	}

	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}

}
