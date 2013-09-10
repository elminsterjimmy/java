# SQL Manager 2005 Lite for MySQL 3.7.0.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : bbscs7


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES gbk */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `bbscs8`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `bbscs8`;

#
# Structure for the `bbscs_agreeagainst` table : 
#

CREATE TABLE `bbscs_agreeagainst` (
  `ID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `PostID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `VoteType` tinyint(1) default '0',
  `CreateTime` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `id` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_board` table : 
#

CREATE TABLE `bbscs_board` (
  `ID` bigint(20) NOT NULL auto_increment,
  `ParentID` bigint(20) NOT NULL default '0',
  `ParentIDs` varchar(255) default NULL,
  `ChildIDs` varchar(255) default NULL,
  `BoardName` varchar(60) NOT NULL default '',
  `Explains` text,
  `Bulletin` text,
  `BoardPic` varchar(200) default NULL,
  `UseStat` tinyint(1) default '1',
  `Orders` int(11) default '0',
  `NeedPasswd` tinyint(1) default '0',
  `Passwd` varchar(100) default NULL,
  `BoardLevel` int(11) default '0',
  `BoardType` tinyint(3) default '0',
  `AllowHTML` tinyint(1) default '0',
  `AllowUBB` tinyint(1) default '0',
  `AuditPost` tinyint(1) default '0',
  `AuditAttach` tinyint(1) default '0',
  `AddUserPostNum` tinyint(1) default '1',
  `IsHidden` tinyint(1) default '0',
  `IsAuth` tinyint(1) default '0',
  `MainPostNum` int(11) default '0',
  `PostNum` int(11) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_boardauthuser` table : 
#

CREATE TABLE `bbscs_boardauthuser` (
  `ID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `UserID` varchar(40) NOT NULL default '',
  `UserName` varchar(20) NOT NULL default '',
  `CreateTime` bigint(20) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_boardmaster` table : 
#

CREATE TABLE `bbscs_boardmaster` (
  `ID` bigint(20) NOT NULL auto_increment,
  `BoardID` bigint(20) NOT NULL default '0',
  `UserName` varchar(20) NOT NULL default '',
  `Purview` varchar(200) default NULL,
  `RoleID` int(11) default '0',
  `OverChildPurview` tinyint(3) default '0',
  `IsHidden` tinyint(3) default '0',
  PRIMARY KEY  (`ID`),
  KEY `BoardID` (`BoardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_boardpermission` table : 
#

CREATE TABLE `bbscs_boardpermission` (
  `ID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `GroupID` int(11) NOT NULL default '0',
  `Permissions` text,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `BoardID_GroupID` (`BoardID`,`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_boardsave` table : 
#

CREATE TABLE `bbscs_boardsave` (
  `ID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `UserID` (`UserID`,`BoardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_boardtag` table : 
#

CREATE TABLE `bbscs_boardtag` (
  `ID` varchar(40) NOT NULL,
  `BoardID` bigint(20) NOT NULL,
  `TagName` varchar(255) NOT NULL,
  `Orders` int(11) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_bookmark` table : 
#

CREATE TABLE `bbscs_bookmark` (
  `ID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `BookMarkName` varchar(255) NOT NULL default '',
  `Url` varchar(255) default NULL,
  `Alt` varchar(255) default NULL,
  `IsShare` tinyint(1) default '1',
  `CreateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_choice` table : 
#

CREATE TABLE `bbscs_choice` (
  `ID` varchar(40) NOT NULL default '',
  `CategoryID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) NOT NULL default '',
  `PostID` varchar(40) NOT NULL default '',
  `PostMainID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `UserName` varchar(20) NOT NULL default '',
  `UserNickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `CreateTime` bigint(20) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_choicecategory` table : 
#

CREATE TABLE `bbscs_choicecategory` (
  `ID` varchar(40) NOT NULL default '',
  `CategoryName` varchar(60) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `UseStat` tinyint(1) NOT NULL default '1',
  `Orders` int(11) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_commend` table : 
#

CREATE TABLE `bbscs_commend` (
  `ID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) NOT NULL default '',
  `PostID` varchar(40) NOT NULL default '',
  `PostMainID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `UserName` varchar(20) NOT NULL default '',
  `CommendBoardID` bigint(20) NOT NULL default '0',
  `CommendTop` tinyint(1) NOT NULL default '0',
  `Title` varchar(150) default NULL,
  `BoardCategory` varchar(40) default NULL,
  `TopCategory` varchar(40) default NULL,
  `CreateTime` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_config` table : 
#

CREATE TABLE `bbscs_config` (
  `ID` varchar(50) NOT NULL default '',
  `ConfContext` text,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_elite` table : 
#

CREATE TABLE `bbscs_elite` (
  `ID` bigint(20) NOT NULL auto_increment,
  `BoardID` bigint(20) NOT NULL default '0',
  `ParentID` bigint(20) NOT NULL default '0',
  `ParentIDs` text,
  `EliteName` varchar(90) default NULL,
  `CreateUser` varchar(60) default NULL,
  `EliteTime` bigint(20) default '0',
  `Orders` int(11) default '0',
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_forum` table : 
#

CREATE TABLE `bbscs_forum` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) DEFAULT '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),  
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_forum_history` table : 
#

CREATE TABLE `bbscs_forum_history` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) DEFAULT '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),  
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bbscs_forumarchives_0` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_1` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_2` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_3` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_4` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_5` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_6` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_7` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_8` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
######
CREATE TABLE `bbscs_forumarchives_9` (
  `ID` varchar(40) NOT NULL default '',
  `ParentID` varchar(40) NOT NULL default '',
  `MainID` varchar(40) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `BoardName` varchar(60) default NULL,
  `ReNum` int(11) default '0',
  `Face` tinyint(2) default '1',
  `UserID` varchar(40) default NULL,
  `UserName` varchar(20) default NULL,
  `NickName` varchar(60) default NULL,
  `Title` varchar(150) default NULL,
  `Detail` text,
  `Sign` text,
  `ArtSize` int(11) default '0',
  `Click` int(11) default '0',
  `PostTime` bigint(20) default '0',
  `LastTime` bigint(20) default '0',
  `IPAddress` varchar(20) default NULL,
  `IsNew` tinyint(1) default '0',
  `Elite` bigint(20) default '0',
  `EliteID` bigint(20) default '0',
  `Agree` int(11) default '0',
  `BeAgainst` int(11) default '0',
  `CanNotDel` tinyint(1) default '0',
  `CanNotRe` tinyint(1) default '0',
  `Commend` bigint(20) default '0',
  `DelSign` tinyint(1) default '0',
  `DelUserID` varchar(40) default NULL,
  `DelUserName` varchar(20) default NULL,
  `DelTime` bigint(20) default '0',
  `DelIP` varchar(20) default NULL,
  `Amend` varchar(255) default NULL,
  `DoEliteName` varchar(20) default '0',
  `DoEliteTime` bigint(20) default '0',
  `HaveAttachFile` tinyint(1) default '0',
  `AttachFileName` text,
  `LastPostUserName` varchar(20) default NULL,
  `LastPostTitle` varchar(150) default NULL,
  `LastPostNickName` varchar(60) default NULL,
  `IsTop` bigint(20) default '0',
  `IsLock` tinyint(1) default '0',
  `Auditing` tinyint(1) default '0',
  `AuditingAttachFile` tinyint(1) default '0',
  `IsVote` tinyint(1) default '0',
  `IsHidden` tinyint(4) default '0',
  `IsHiddenValue` int(11) default '1',
  `EditType` tinyint(1) default '0',
  `QuoteText` text,
  `QuoteEditType` tinyint(1) default '0',
  `PostType` tinyint(1) default '0',
  `TitleColor` tinyint(2) default '0',
  `UserBlog` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `EmailInform` tinyint(1) default '0',
  `MsgInform` tinyint(1) default '0',
  `VoteID` varchar(40) default NULL,
  `TagID` varchar(40) default '0',
  `TagName` varchar(255) default NULL,
  `IsGuest` tinyint(1) default '0',
  `PreviewAttach` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `MainID` (`MainID`),
  KEY `BoardID` (`BoardID`),
  KEY `LastTime` (`LastTime`),
  KEY `PostTime` (`PostTime`),
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_forumbuy` table : 
#

CREATE TABLE `bbscs_forumbuy` (
  `ID` varchar(40) NOT NULL,
  `PostID` varchar(40) NOT NULL,
  `BuyFromID` varchar(40) NOT NULL,
  `BuyFromName` varchar(20) NOT NULL,
  `BuyToID` varchar(40) NOT NULL,
  `BuyToName` varchar(20) NOT NULL,
  `BuyPrice` int(11) NOT NULL default '0',
  `BuyToUserIncome` int(11) NOT NULL default '0',
  `BuyTime` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_friend` table : 
#

CREATE TABLE `bbscs_friend` (
  `ID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `UserName` varchar(20) NOT NULL default '',
  `FriendID` varchar(40) NOT NULL default '',
  `FriendName` varchar(20) NOT NULL default '',
  `FriendComment` text,
  `IsBlack` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_grouprole` table : 
#

CREATE TABLE `bbscs_grouprole` (
  `GroupID` int(11) NOT NULL default '0',
  `RoleID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`GroupID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_loginerror` table : 
#

CREATE TABLE `bbscs_loginerror` (
  `ID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `ErrorTimes` int(11) NOT NULL default '0',
  `LoginTime` bigint(20) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_note` table : 
#

CREATE TABLE `bbscs_note` (
  `ID` varchar(40) NOT NULL default '',
  `FromID` varchar(40) NOT NULL default '',
  `FromUserName` varchar(20) NOT NULL default '',
  `FromNickName` varchar(60) NOT NULL default '',
  `ToID` varchar(40) NOT NULL default '',
  `ToUserName` varchar(20) NOT NULL default '',
  `ToNickName` varchar(60) NOT NULL default '',
  `NoteType` tinyint(1) NOT NULL default '0',
  `NoteTitle` varchar(150) NOT NULL default '',
  `NoteContext` text NOT NULL,
  `CreateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `IsNew` tinyint(1) default '1',
  `NeedRe` tinyint(1) default '0',
  `IsRe` tinyint(1) default '0',
  `SysMsg` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FromID` (`FromID`),
  KEY `ToID` (`ToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_permission` table : 
#

CREATE TABLE `bbscs_permission` (
  `ID` bigint(20) NOT NULL default '0',
  `PermissionName` varchar(255) NOT NULL default '',
  `PermissionResource` varchar(255) default NULL,
  `Action` varchar(255) default NULL,
  `TypeID` int(2) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_role` table : 
#

CREATE TABLE `bbscs_role` (
  `ID` int(11) NOT NULL auto_increment,
  `RoleName` varchar(255) NOT NULL default '',
  `TypeID` int(2) NOT NULL default '0',
  `Permissions` text,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_subscibe` table : 
#

CREATE TABLE `bbscs_subscibe` (
  `ID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `UserName` varchar(20) NOT NULL default '',
  `NickName` varchar(60) NOT NULL default '',
  `PostID` varchar(40) NOT NULL default '',
  `PostTitle` varchar(150) NOT NULL default '',
  `BoardID` bigint(20) NOT NULL default '0',
  `Emailinform` tinyint(1) default '1',
  `Msginform` tinyint(1) default '1',
  `UserEmail` varchar(255) default NULL,
  `CreateTime` datetime default NULL,
  `UserLocale` varchar(20) default 'zh_CN',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_sysnumstat` table : 
#

CREATE TABLE `bbscs_sysnumstat` (
  `ID` varchar(40) NOT NULL,
  `RecDate` varchar(20) NOT NULL,
  `Num0` int(11) default '0',
  `NumInc0` int(11) NOT NULL default '0',
  `Num1` int(11) NOT NULL default '0',
  `NumInc1` int(11) NOT NULL default '0',
  `Num2` int(11) NOT NULL default '0',
  `NumInc2` int(11) NOT NULL default '0',
  `Num3` int(11) NOT NULL default '0',
  `NumInc3` int(11) NOT NULL default '0',
  `Num4` int(11) NOT NULL default '0',
  `NumInc4` int(11) NOT NULL default '0',
  `Num5` int(11) NOT NULL default '0',
  `NumInc5` int(11) NOT NULL default '0',
  `CreateTime` bigint(20) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_userinfo` table : 
#

CREATE TABLE `bbscs_userinfo` (
  `ID` varchar(40) NOT NULL default '',
  `UserName` varchar(20) NOT NULL default '',
  `NickName` varchar(60) NOT NULL default '',
  `Passwd` varchar(40) NOT NULL default '',
  `RePasswd` varchar(40) NOT NULL default '',
  `Email` varchar(255) NOT NULL default '',
  `Question` varchar(255) NOT NULL default '',
  `Answer` varchar(255) NOT NULL default '',
  `RegTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `LoginTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `LoginIP` varchar(20) NOT NULL default '',
  `LoginTimes` int(11) NOT NULL default '0',
  `LastLoginTime` datetime default NULL,
  `LastLoginIP` varchar(20) default NULL,
  `ArticleNum` int(11) default '0',
  `StayTime` bigint(20) default '0',
  `ArticleEliteNum` int(11) default '0',
  `LifeForce` int(11) default '0',
  `UserTitle` tinyint(3) default '0',
  `Coin` int(11) default '0',
  `Literary` int(11) default '0',
  `Experience` int(11) default '0',
  `UserKnow` int(11) default '0',
  `SignName0` varchar(30) default NULL,
  `SignDetail0` text,
  `SignName1` varchar(30) default NULL,
  `SignDetail1` text,
  `SignName2` varchar(30) default NULL,
  `SignDetail2` text,
  `HavePic` tinyint(3) default '0',
  `PicFileName` varchar(255) default NULL,
  `ForumPerNum` tinyint(3) default '20',
  `PostPerNum` tinyint(3) default '10',
  `UserFrom` varchar(255) default NULL,
  `TimeZone` varchar(20) default 'GMT+08:00',
  `BirthYear` int(4) default '1980',
  `BirthMonth` tinyint(2) default '1',
  `BirthDay` tinyint(2) default '1',
  `ReceiveNote` tinyint(1) default '1',
  `AcceptFriend` tinyint(1) default '1',
  `ForumViewMode` tinyint(1) default '0',
  `Validated` tinyint(1) default '1',
  `GroupID` int(11) default '0',
  `HiddenLogin` tinyint(1) default '0',
  `EditType` tinyint(1) default '-1',
  `UserLocale` varchar(20) default 'zh_CN',
  `ValidateCode` varchar(20) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_userdetail` table : 
#

CREATE TABLE `bbscs_userdetail` (
  `ID` varchar(40) NOT NULL default '',
  `Height` varchar(255) default NULL,
  `Weight` varchar(255) default NULL,
  `Interest` varchar(255) default NULL,
  `Graduate` varchar(255) default NULL,
  `FavourPeople` varchar(255) default NULL,
  `DreamJob` varchar(255) default NULL,
  `FavourArt` varchar(255) default NULL,
  `FavourMusic` varchar(255) default NULL,
  `FavourPlace` varchar(255) default NULL,
  `FavourMovie` varchar(255) default NULL,
  `FavourChat` varchar(255) default NULL,
  `FavourBook` varchar(255) default NULL,
  `DreamLover` varchar(255) default NULL,
  `FavourTeam` varchar(255) default NULL,
  `HomePage` varchar(255) default '',
  `OicqNo` varchar(255) default '',
  `IcqNo` varchar(255) default '',
  `MSN` varchar(255) default NULL,
  `Yahoo` varchar(255) default NULL,
  `Sex` tinyint(1) default '0',
  `Brief` text,
  PRIMARY KEY  (`ID`),
  CONSTRAINT `FK_USERDETAIL_ID` FOREIGN KEY (`ID`) REFERENCES `bbscs_userinfo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_usergroup` table : 
#

CREATE TABLE `bbscs_usergroup` (
  `ID` int(11) NOT NULL auto_increment,
  `GroupName` varchar(255) NOT NULL default '',
  `GroupDesc` varchar(255) default NULL,
  `TypeID` int(2) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_userlevel` table : 
#

CREATE TABLE `bbscs_userlevel` (
  `ID` varchar(40) NOT NULL,
  `LevelName` varchar(60) NOT NULL,
  `LevelValue` int(11) NOT NULL default '0',
  `LevelType` tinyint(1) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_useronline` table : 
#

CREATE TABLE `bbscs_useronline` (
  `ID` varchar(40) NOT NULL default '',
  `UserID` varchar(40) NOT NULL default '',
  `UserName` varchar(20) NOT NULL default '',
  `NickName` varchar(60) NOT NULL default '',
  `OnlineTime` bigint(20) default NULL,
  `BoardID` bigint(20) default '0',
  `AtPlace` varchar(255) default NULL,
  `UserGroupID` int(11) default NULL,
  `ValidateCode` varchar(100) default NULL,
  `HiddenUser` tinyint(1) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_usertop` table : 
#

CREATE TABLE `bbscs_usertop` (
  `ID` varchar(40) NOT NULL,
  `UserID` varchar(40) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `NickName` varchar(60) NOT NULL,
  `ValueType` tinyint(2) NOT NULL default '0',
  `UserValue` int(11) default '0',
  `ValueInc` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ValueType` (`ValueType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_vote` table : 
#

CREATE TABLE `bbscs_vote` (
  `ID` varchar(40) NOT NULL default '',
  `Title` varchar(255) NOT NULL default '',
  `IsM` tinyint(1) default '0',
  `DeadLine` bigint(20) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `id` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_voteitem` table : 
#

CREATE TABLE `bbscs_voteitem` (
  `ID` varchar(40) NOT NULL default '',
  `VoteID` varchar(40) NOT NULL default '',
  `Item` varchar(255) NOT NULL default '',
  `ItemValue` int(11) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `id` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `bbscs_voteuser` table : 
#

CREATE TABLE `bbscs_voteuser` (
  `ID` varchar(40) NOT NULL default '',
  `VoteID` varchar(40) NOT NULL default '',
  `VoteUserID` varchar(40) NOT NULL default '',
  `VoteTime` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `id` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for the `bbscs_config` table  (LIMIT 0,500)
#

INSERT INTO `bbscs_config` (`ID`, `ConfContext`) VALUES 
  ('AttachFileSize','3072'),
  ('AttachFileType','jpg,jpeg,gif,bmp,png,txt,rar,zip,doc,exe'),
  ('AttachImgRow','3'),
  ('AttachImgType','jpg,jpeg,gif,bmp,png'),
  ('AttachmentNum','10'),
  ('BestrowScreen','**'),
  ('BirthDateTimeFormat','yyyy-MM-dd'),
  ('CanDelAttachmentClosedPost','1'),
  ('CanDelAttachmentOverTime','1'),
  ('CanNotRegUserName','guest,webmaster,admin,administrator,fuck,shit,super'),
  ('CanNotUseNickName','[法].{0,3}[轮];[江].{0,3}[泽].{0,3}[民];[Ff].{0,2}[Uu].{0,2}[Cc].{0,2}[Kk];[Ss].{0,2}[Hh].{0,2}[Ii].{0,2}[Tt];[六].{0,3}[四];[李].{0,3}[宏].{0,3}[志];[李].{0,3}[洪].{0,3}[志];[大].{0,3}[法];[真].{0,3}[善].{0,3}[忍];[共].{0,3}[产].{0,3}[党];[中].{0,3}[共];[明].{0,3}[慧];[动].{0,3}[乱];[爆].{0,3}[乱];[版].{0,3}[主];[斑].{0,3}[竹];[管].{0,3}[理].{0,3}[员];[坛].{0,3}[主]'),
  ('CanSeePageNum','10'),
  ('CheckNewPm','0'),
  ('CheckRegUser','0'),
  ('CheckRegUserEmail','0'),
  ('CloseReson','Sorry，社区维护中，请稍候再访问...'),
  ('CookieDomain',''),
  ('CookieKey','nhNhwZ6X7xzgXnnZBxWFQLwCGQtJojL3'),
  ('CookiePath','/'),
  ('CopyRightMsg','www.laoer.com'),
  ('DateShowType','1'),
  ('DefaultTimeZone','26'),
  ('EditInterface','0'),
  ('EditPostLimit','0'),
  ('EditPostTitleLimit','14400'),
  ('FaceHigh','120'),
  ('FaceSize','50'),
  ('FaceWidth','120'),
  ('ForbidEmail','glaoer@sina.com'),
  ('ForbidIP','61.129.89.99,61.129.89.98'),
  ('ForumDateTimeFormat','MM-dd HH:mm'),
  ('ForumHotRes','15'),
  ('ForumHotViews','100'),
  ('ForumName','天乙社区'),
  ('ForumPrePage','20'),
  ('ForumUrl','http://bbscs.laoer.com'),
  ('IsOpen','1'),
  ('LogIP','0'),
  ('LogoutUrl','/login'),
  ('MaxMultiPage','3'),
  ('MetaDescription','java开源社区'),
  ('MetaKeywords','laoer.com,天乙社区,开源,java,struts,hibernate,spring'),
  ('OpenUserReg','1'),
  ('OtherDateTimeFormat','yyyy-MM-dd HH:mm:ss'),
  ('PassChangeUrl','http://www.laoer.com/changPasswd.jsp'),
  ('PassRegUrl','http://www.laoer.com/reg.do'),
  ('PassUrl','http://www.laoer.com/login.do'),
  ('PmAllowFace','0'),
  ('PmAllowHTML','0'),
  ('PmAllowSmilies','1'),
  ('PmAllowUBB','0'),
  ('PmFloodTime','30'),
  ('PmMaxLength','3000'),
  ('PmPerPage','10'),
  ('PostCheckTime','0'),
  ('PostDateTimeFormat','yyyy-MM-dd HH:mm:ss'),
  ('PostDefFaceImg','images/icon1.gif'),
  ('PostHiddenTypeArtNum','1'),
  ('PostHiddenTypeMoney','1'),
  ('PostHiddenTypeRe','1'),
  ('PostMaxSize','150000'),
  ('PostMinSize','1'),
  ('PostPeriodOfTimeDay','0'),
  ('PostPeriodOfTimeEnd','20'),
  ('PostPeriodOfTimeStart','9'),
  ('PostPerPage','10'),
  ('PostPriceList','2,4,8,10,20,30'),
  ('PostPriceTax','0.5'),
  ('PostShowUserImg','1'),
  ('PostToHistoryDay','90'),
  ('PostViewLength','300'),
  ('PostVoteRec','1'),
  ('PrivacyUrl',''),
  ('QuoteMaxSize','300'),
  ('ReduceAttachImg','1'),
  ('ReduceAttachImgSize','500'),
  ('RegDateTimeFormat','yyyy-MM-dd'),
  ('ScreenWord','[法].{0,3}[轮];[江].{0,3}[泽].{0,3}[民];[Ff].{0,2}[Uu].{0,2}[Cc].{0,2}[Kk];[Ss].{0,2}[Hh].{0,2}[Ii].{0,2}[Tt];[六].{0,3}[四];[李].{0,3}[宏].{0,3}[志];[李].{0,3}[洪].{0,3}[志];[大].{0,3}[法];[真].{0,3}[善].{0,3}[忍];[共].{0,3}[产].{0,3}[党];[中].{0,3}[共];[明].{0,3}[慧];[动].{0,3}[乱];[爆].{0,3}[乱]'),
  ('SenderEmail','laoer.@163.com'),
  ('SignMaxLen','500'),
  ('SignUseHtml','1'),
  ('SignUseSmile','1'),
  ('SignUseUBB','0'),
  ('SmtpAuth','1'),
  ('SmtpPasswd','a'),
  ('SmtpPort','25'),
  ('SmtpServer','smtp.163.com'),
  ('SmtpUser','laoer.'),
  ('TimeFormat','HH:mm'),
  ('UseAuthCode','1'),
  ('UseEmail','1'),
  ('UseFace','1'),
  ('UseForbid','1'),
  ('UseLinkToPages','1'),
  ('UsePass','0'),
  ('UsePm','1'),
  ('UsePostPeriodOfTime','0'),
  ('UseRegAuthCode','1'),
  ('UserOnlineTime','300'),
  ('UserPerPage','5,10,20,30,40'),
  ('UseSafeLogin','1'),
  ('UseScreen','1'),
  ('UseSign','1'),
  ('ViewAttachImg','1'),
  ('VoteChange','1'),
  ('VoteItemLength','150'),
  ('VoteItemNum','10'),
  ('VoteUpdatePost','1'),
  ('WebmasterEmail','laoer@vip.163.com'),
  ('WebName','天乙软件工作室'),
  ('WebUrl','http://www.laoer.com');

COMMIT;

#
# Data for the `bbscs_grouprole` table  (LIMIT 0,500)
#

INSERT INTO `bbscs_grouprole` (`GroupID`, `RoleID`) VALUES 
  (1,9),
  (2,9),
  (2,13),
  (3,9),
  (3,13),
  (4,1),
  (4,9),
  (4,13),
  (5,4),
  (5,5),
  (5,6),
  (5,7),
  (5,8),
  (5,9),
  (5,12),
  (5,13);

COMMIT;

#
# Data for the `bbscs_permission` table  (LIMIT 0,500)
#

INSERT INTO `bbscs_permission` (`ID`, `PermissionName`, `PermissionResource`, `Action`, `TypeID`) VALUES 
(101, '后台主窗口权限', '/adminMain', '*', 0),
(102, '查看后台导航权限', '/adminLeft', '*', 0),
(103, '管理打开/关闭论坛权限', '/adminOpenSet', '*', 0),
(104, '网站信息设置权限', '/adminWebset', '*', 0),
(105, '基本设置权限', '/adminBaseSet', '*', 0),
(106, '日期时间设置权限', '/adminDateTimeFormatSet', '*', 0),
(107, 'COOKIE和通行证设置权限', '/adminCookiePassSet', '*', 0),
(108, '屏蔽选项设置权限', '/adminScreenSet', '*', 0),
(109, 'Email选项设置权限', '/adminEmailSet', '*', 0),
(110, '用户注册选项设置权限', '/adminUserRegSet', '*', 0),
(111, '用户资料选项设置权限', '/adminUserProSet', '*', 0),
(112, '用户头像选项设置权限', '/adminFaceSet', '*', 0),
(113, '用户禁止选项设置权限', '/adminForbidSet', '*', 0),
(114, '发帖和编辑选项设置权限', '/adminPostSet', '*', 0),
(115, '附件选项设置权限', '/adminAttachSet', '*', 0),
(116, '投票选项设置权限', '/adminVoteSet', '*', 0),
(117, '悄悄话选项设置权限', '/adminPmSet', '*', 0),
(118, '主题列表显示选项设置权限', '/adminForumViewSet', '*', 0),
(119, '主题内容显示选项设置权限', '/adminPostViewSet', '*', 0),
(120, '隐藏帖选项设置权限', '/adminPostHiddenSet', '*', 0),
(121, '在线时长设定权限', '/adminUOTimeSet', '*', 0),
(122, '查看版区列表权限', '/adminBoardList', '*', 0),
(123, '添加修改版区权限', '/adminBoardSet', '*', 0),
(124, '查看版主列表权限', '/adminBML', '*', 0),
(125, '添加修改版主权限', '/adminBmSet', '*', 0),
(126, '查看权限列表权限', '/adminPermission', '*', 0),
(127, '查看角色列表权限', '/adminRoleList', '*', 0),
(128, '管理角色权限', '/adminRoleSet', '*', 0),
(129, '查看用户组列表权限', '/adminUgList', '*', 0),
(130, '用户组管理权限', '/adminUgSet', '*', 0),
(131, '用户管理权限', '/adminUserSearch', '*', 0),
(132, '版区权限设置权限', '/adminBoardUg', '*', 0),
(133, '版区Tag设置权限', '/adminBoardTag', '*', 0),
(134, '用户等级设置权限', '/adminUserLevel', '*', 0),
(201, '查看社区主框架权限', '/main', '*', 0),
(202, '查看社区左侧导航页权限', '/nag', '*', 0),
(203, '修改签名权限', '/signSet', '*', 0),
(204, '修改昵称权限', '/nickNameSet', '*', 0),
(205, '个人参数设置权限', '/userConfig', '*', 0),
(206, '朋友/黑名单设置权限', '/friendSet', '*', 0),
(207, '悄悄话权限', '/note', '*', 0),
(208, '书签管理权限', '/bookMark', '*', 0),
(209, '头像设置权限', '/userFace', 'index,uppage,up,delme', 0),
(210, '查看用户头像权限', '/userFace', 'showface', 0),
(211, '修改个人详细资料权限', '/userDetailSet', '*', 0),
(212, '进入社区首页权限', '/in', '*', 0),
(213, '察看用户资料权限', '/userInfo', '*', 0),
(214, '查看在线用户权限', '/online', '*', 0),
(215, '全文搜索权限', '/search', '*', 0),
(216, '修改密码权限', '/cpasswd', '*', 0),
(217, '管理个人珍藏权限', '/boardSaveManage', '*', 0),
(220, '社区首页管理', '/inCoverManage', '*', 0),
(401, '查看讨论版权限', '/forum', 'index', 2),
(402, '查看热门帖权限', '/forum', 'hot', 2),
(403, '查看推荐帖权限', '/forum', 'commend', 2),
(404, '查看历史帖权限', '/forum', 'history', 2),
(405, '查看主题权限', '/read', 'topic', 2),
(406, '查看主题摘要权限', '/read', 'summary', 2),
(407, '查看用户IP权限', '/read', 'showip,showiphistory', 2),
(408, '显示帖子中附件权限', '/read', 'showupfile', 2),
(409, '显示帖子中投票权限', '/read', 'showvote', 2),
(410, '只看楼主权限', '/read', 'own', 2),
(411, '查看垃圾桶里帖子主题权限', '/read', 'waste', 2),
(412, '查看未审核帖子主题权限', '/read', 'auditing', 2),
(413, '查看未审核附件帖子主题权限', '/read', 'auditingAttach', 2),
(414, '查看精华区帖子主题权限', '/read', 'elite', 2),
(415, '查看所有原始附件权限', '/read', 'attach', 2),
(416, '转移帖子权限', '/moveForum', '*', 2),
(420, '发帖权限', '/post', 'add,addsave', 2),
(421, '回帖权限', '/post', 're,requote,addqre,addre,addrequote,buy', 2),
(422, '上传附件权限', '/post', 'upfile,upfileinput,upfiledo', 2),
(423, '编辑帖子权限', '/post', 'edit,editdo,showdelattachpage', 2),
(424, '帖子赞成反对权限', '/postOpt', 'votyes,votno', 2),
(425, '订阅帖子权限', '/postOpt', 'subs', 2),
(426, '帖子打包权限', '/postOpt', 'mailsend,mailsendtopic', 2),
(427, '举报帖子权限', '/postOpt', 'report', 2),
(430, '发布修改投票帖权限', '/votePost', 'addsave,add,edit,editdo', 2),
(431, '投票帖投票权限', '/oteOpt', '*', 2),
(432, '删除帖子附件权限', '/delAttach', '*', 2),
(433, '收藏版区权限', '/boardSave', '*', 2),
(434, '查看帖子订阅列表权限', '/subs', '*', 2),
(435, '版内搜索权限', '/forumSearch', '*', 2),
(440, '查看历史帖子主题权限', '/read', 'history,summaryhistory', 2),
(441, '给帖子投票权限', '/voteOpt', '*', 2),
(450, '查看精华区权限', '/refine', 'index,showelite,showflist', 2),
(451, '管理精华区权限', '/refine', 'manage,showelite,showflist,adddir,intodir,del,outdir,edit,editdo,deldir', 2),
(460, '删除单个帖子权限', '/postOpt', 'dela', 2),
(462, '帖子置顶权限', '/postOpt', 'top,untop', 2),
(463, 'M帖权限', '/postOpt', 'cannotdel,candel', 2),
(464, '推荐帖子权限', '/postOpt', 'commend,uncommend', 2),
(465, '锁定帖子权限', '/postOpt', 'lock,unlock', 2),
(466, '加入精华权限', '/postOpt', 'elite', 2),
(470, '版区管理权限', '/forumManage', 'm,w,a,aa,dels,delw,delallw,resume,auditing,auditingAttach,delsnota,delsnotaa', 2),
(471, '版区高级管理权限', '/manageAdvance', 'index,forbiduser,bulletin,addauth,delauth', 2),
(475, '版区封面管理权限', '/coverManage', '*', 2),
(476, '查看社区统计权限', '/sysNumStat', '*', 0),
(477, '查看用户列表权限', '/userShow', '*', 0),
(601, '发帖时显示版区置顶选项权限', '*', '*', 3),
(602, '可以使用彩色标题权限', '*', '*', 3),
(603, '可直接查看隐藏帖内容权限', '*', '*', 3),
(604, '不受发帖间隔时间限制', '*', '*', 3),
(605, '高级-编辑所有帖子权限', '*', '*', 3),
(606, '高级-删除所有帖子权限', '*', '*', 3),
(607, '高级-删除附件权限', '*', '*', 3),
(608, '不需要密码进入版区权限', '*', '*', 3),
(609, '不需要授权进入版区权限', '*', '*', 3),
(610, '可查看未审核附件权限', '*', '*', 3),
(611, '发帖不用审核权限', '*', '*', 3),
(901, '可以查看隐藏版区权限', '*', '*', 1);

COMMIT;

#
# Data for the `bbscs_role` table  (LIMIT 0,500)
#

INSERT INTO `bbscs_role` (`ID`, `RoleName`, `TypeID`, `Permissions`) VALUES 
  (1,'版主角色',1,'401,402,403,404,405,406,407,408,409,410,411,412,413,414,420,421,422,423,424,425,426,427,430,431,432,433,434,435,440,450,451,460,462,463,464,465,466,470,471,475,601,602,603,604,605,606,607,608,609,610'),
  (2,'版副角色',1,'401,402,403,404,405,406,407,408,409,410,411,412,413,414,420,421,422,423,424,425,426,427,430,431,432,433,434,435,440,450,451,460,462,463,464,465,466,470,601,602,603,604,608,609,610'),
  (3,'隐身版主角色',1,'401,402,403,405,406,407,408,409,410,411,412,413,414,420,421,422,423,424,425,426,427,430,431,432,433,434,435,440,450,451,460,462,463,464,465,466,470,601,602,603,604,608,609,610'),
  (4,'后台可进行权限管理角色',0,'126,127,128,129,130'),
  (5,'后台可管理常规选项角色',0,'103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,134'),
  (6,'后台可管理版区角色',0,'122,123,124,125,132,133'),
  (7,'可进入后台管理角色',0,'101,102'),
  (8,'后台可管理用户角色',0,'131'),
  (9,'前台可进入社区用户角色',0,'201,202,212,213,214,215'),
  (10,'前台初级管理员角色',0,'901'),
  (11,'前台中级管理员角色',0,'901'),
  (12,'前台高级管理员角色',0,'220,476,477,901'),
  (13,'前台可管理自己用户信息角色',0,'203,204,205,206,207,208,209,210,211,216,217');

COMMIT;

#
# Data for the `bbscs_userinfo` table  (LIMIT 0,500)
#

INSERT INTO `bbscs_userinfo` (`ID`, `UserName`, `NickName`, `Passwd`, `RePasswd`, `Email`, `Question`, `Answer`, `RegTime`, `LoginTime`, `LoginIP`, `LoginTimes`, `LastLoginTime`, `LastLoginIP`, `ArticleNum`, `StayTime`, `ArticleEliteNum`, `LifeForce`, `UserTitle`, `Coin`, `Literary`, `Experience`, `UserKnow`, `SignName0`, `SignDetail0`, `SignName1`, `SignDetail1`, `SignName2`, `SignDetail2`, `HavePic`, `PicFileName`, `ForumPerNum`, `PostPerNum`, `UserFrom`, `TimeZone`, `BirthYear`, `BirthMonth`, `BirthDay`, `ReceiveNote`, `AcceptFriend`, `ForumViewMode`, `Validated`, `GroupID`, `HiddenLogin`, `EditType`, `UserLocale`, `ValidateCode`) VALUES 
  ('4028818208ed006b0108ed020bd50001','webmaster','webmaster','12345','827CCB0EEA8A706C4C34A16891F84E7B','webmaster@laoer.com','who?','webmaster','2006-08-18','2006-08-18','127.0.0.1',0,'2006-08-18','127.0.0.1',0,0,0,0,0,0,0,0,0,'','孔子东游，遇二小儿辩斗，问其故。 \r\n一小儿曰：我以日本生自山东，故属东。 \r\n一小儿曰：夕阳西下，日本归山西也明矣，是以属西。 \r\n孔子不能决，后以问老子（就是我）。 \r\n老子笑曰：孰为汝多知乎？日本无根基，岂能算东西 ！！','','天乙软件工作室\r\nhttp://www.laoer.com\r\n天乙社区\r\nhttp://bbscs.laoer.com\r\n天乙博客\r\nhttp://blog.laoer.com','',':3:',0,'',20,10,'上海','GMT+08:00',1980,1,1,1,1,2,1,5,0,-1,'zh_CN',NULL);

COMMIT;

#
# Data for the `bbscs_userdetail` table  (LIMIT 0,500)
#

INSERT INTO `bbscs_userdetail` (`ID`, `Height`, `Weight`, `Interest`, `Graduate`, `FavourPeople`, `DreamJob`, `FavourArt`, `FavourMusic`, `FavourPlace`, `FavourMovie`, `FavourChat`, `FavourBook`, `DreamLover`, `FavourTeam`, `HomePage`, `OicqNo`, `IcqNo`, `MSN`, `Yahoo`, `Sex`, `Brief`) VALUES 
  ('4028818208ed006b0108ed020bd50001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);

COMMIT;

#
# Data for the `bbscs_usergroup` table  (LIMIT 0,500)
#

INSERT INTO `bbscs_usergroup` (`ID`, `GroupName`, `GroupDesc`, `TypeID`) VALUES 
  (1,'游客/未注册用户','',0),
  (2,'注册用户','',0),
  (3,'待验证用户','',0),
  (4,'超级版主','',0),
  (5,'系统管理员','',0),
  (6,'封禁用户','',0);

COMMIT;

#
# Data for the `bbscs_userlevel` table  (LIMIT 0,500)
#

INSERT INTO `bbscs_userlevel` (`ID`, `LevelName`, `LevelValue`, `LevelType`) VALUES 
  ('402881820ebb22b2010ebb2462550001','恶贯满盈',-500,0),
  ('402881820ebb335f010ebb344eee0001','犯事累累',-100,0),
  ('402881820ebb3806010ebb38d84f0001','不务正业',0,0),
  ('402881820ebb3806010ebb39143e0002','初出江湖',100,0),
  ('402881820ebb3806010ebb3961450003','新手上路',300,0),
  ('402881820ebb3806010ebb39f1120004','初级站友',800,0),
  ('402881820ebb3806010ebb3a29d50005','中级站友',1500,0),
  ('402881820ebb3806010ebb3a7a560006','高级站友',2500,0),
  ('402881820ebb3806010ebb3ab9730007','青铜长老',5000,0),
  ('402881820ebb3806010ebb3afd130008','白银长老',7000,0),
  ('402881820ebb3806010ebb3b71880009','黄金长老',10000,0),
  ('402881820ebb3806010ebb3bb0f2000a','白金长老',15000,0),
  ('402881820ebb3806010ebb3be996000b','钻石长老',22000,0),
  ('402881820ebb3806010ebb3c220b000c','资深元老',30000,0),
  ('402881820ebb3806010ebb3c55ae000d','社区支柱',40000,0),
  ('402881820ebb3806010ebb3d6171000f','骨灰级元老',2147483647,0);

COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;