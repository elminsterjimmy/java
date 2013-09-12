drop database `myfavorite`;

CREATE DATABASE `myfavorite`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `myfavorite`;

CREATE TABLE `mf_userinfo` (
  `id` varchar(40) NOT NULL default '',
  `userName` varchar(20) NOT NULL default '',
  `nickName` varchar(60) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `hashedPasswd` varchar(40) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `question` varchar(255) NOT NULL default '',
  `answer` varchar(255) NOT NULL default '',
  `regTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `loginTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `loginIP` varchar(20) NOT NULL default '',
  `loginTimes` int(11) NOT NULL default '0',
  `lastLoginTime` datetime default NULL,
  `lastLoginIP` varchar(20) default NULL,
  `articleNum` int(11) default '0',
  `userTitle` tinyint(3) default '0',
  `experience` int(11) default '0',
  `sign` text,
  `havePic` tinyint(3) default '0',
  `picFileName` varchar(255) default NULL,
  `articlePerNum` tinyint(3) default '10',
  `userFrom` varchar(255) default NULL,
  `timeZone` varchar(20) default 'GMT+08:00',
  `birthYear` int(4) default '1980',
  `birthMonth` tinyint(2) default '1',
  `birthDay` tinyint(2) default '1',
  `receiveNote` tinyint(1) default '1',
  `acceptFriend` tinyint(1) default '1',
  `validated` tinyint(1) default '0',
  `groupID` int(11) default '0',
  `hiddenLogin` tinyint(1) default '0',
  `userLocale` varchar(20) default 'zh_CN',
  `validateCode` varchar(20) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `mf_main` (
  `id` varchar(40) NOT NULL default '',
  `name` varchar(200) default NULL,
  `picFileName` varchar(255) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `mf_post` (
  `id` varchar(40) NOT NULL default '',
  `parentID` varchar(40) NOT NULL default '',
  `mainID` varchar(40) NOT NULL default '',
  `replyCount` int(11) default '0',
  `userId` varchar(40) default NULL,
  `userName` varchar(20) default NULL,
  `nickName` varchar(60) default NULL,
  `title` varchar(150) default NULL,
  `detail` text,
  `sign` text,
  `articleSize` int(11) default '0',
  `clickCount` int(11) default '0',
  `postTime` bigint(20) default '0',
  `lastReplyTime` bigint(20) default '0',
  `ipAddr` varchar(20) default NULL,
  `isNew` tinyint(1) default '0',
  `agree` int(11) default '0',
  `against` int(11) default '0',
  `canNotDel` tinyint(1) default '0',
  `canNotRe` tinyint(1) default '0',
  `commend` bigint(20) default '0',
  `delSign` tinyint(1) default '0',
  `delUserID` varchar(40) default NULL,
  `delUserName` varchar(20) default NULL,
  `delTime` bigint(20) default '0',
  `delIP` varchar(20) default NULL,
  `delAmend` varchar(255) default NULL,
  `haveAttachFile` tinyint(1) default '0',
  `attachFileName` text,
  `lastPostUserName` varchar(20) default NULL,
  `lastPostTitle` varchar(150) default NULL,
  `lastPostNickName` varchar(60) default NULL,
  `isTop` bigint(20) default '0',
  `isLock` tinyint(1) default '0',
  `isVote` tinyint(1) default '0',
  `isHidden` tinyint(4) default '0',
  `isHiddenValue` int(11) default '1',
  `quoteText` text,
  `postType` tinyint(1) default '0',
  `IndexStatus` tinyint(1) default '0',
  `voteID` varchar(40) default NULL,
  `tagID` varchar(40) default '0',
  `tagName` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `mainID` (`MainID`),
  KEY `userID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `mf_sysconfig` (
  `ID` varchar(50) NOT NULL default '',
  `ConfContext` text,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `mf_taxonomy_relastionship` (
  `objectID` varchar(40) NOT NULL,
  `taxonomyID` varchar(40) NOT NULL,
  `order` int(11) default '1',
  PRIMARY KEY  (`objectID`, `taxonomyID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `mf_taxonomy` (
  `ID` varchar(40) NOT NULL,
  `taxonomy` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;