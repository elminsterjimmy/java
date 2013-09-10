create table BBSCS_AGREEAGAINST
(
  ID         VARCHAR2(40) default '' not null,
  USERID     VARCHAR2(40) default '' not null,
  POSTID     VARCHAR2(40) default '' not null,
  BOARDID    NUMBER(20) default 0 not null,
  VOTETYPE   NUMBER(1) default 0,
  CREATETIME NUMBER(20) default 0 not null,
  PRIMARY KEY  (ID)
);

create table BBSCS_BOARD
(
  ID             NUMBER(20) not null,
  PARENTID       NUMBER(20) default 0 not null,
  PARENTIDS      VARCHAR2(255) default '',
  CHILDIDS       VARCHAR2(255) default '',
  BOARDNAME      VARCHAR2(60) default '' not null,
  EXPLAINS       CLOB,
  BULLETIN       CLOB,
  BOARDPIC       VARCHAR2(200) default '',
  USESTAT        NUMBER(1) default 1,
  ORDERS         NUMBER(11) default 0,
  NEEDPASSWD     NUMBER(1) default 0,
  PASSWD         VARCHAR2(100) default '',
  BOARDLEVEL     NUMBER(11) default 0,
  BOARDTYPE      NUMBER(3) default 0,
  ALLOWHTML      NUMBER(1) default 0,
  ALLOWUBB       NUMBER(1) default 0,
  AUDITPOST      NUMBER(1) default 0,
  AUDITATTACH    NUMBER(1) default 0,
  ADDUSERPOSTNUM NUMBER(1) default 1,
  ISHIDDEN       NUMBER(1) default 0,
  ISAUTH         NUMBER(1) default 0,
  MAINPOSTNUM    NUMBER(11) default 0,
  POSTNUM        NUMBER(11) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_BOARDAUTHUSER
(
  ID         VARCHAR2(40) default '' not null,
  BOARDID    NUMBER(20) default 0 not null,
  USERID     VARCHAR2(40) default '' not null,
  USERNAME   VARCHAR2(20) default '' not null,
  CREATETIME NUMBER(20) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_BOARDMASTER
(
  ID               NUMBER(20) not null,
  BOARDID          NUMBER(20) default 0 not null,
  USERNAME         VARCHAR2(20) default '' not null,
  PURVIEW          VARCHAR2(200) default '',
  ROLEID           NUMBER(11) default 0,
  OVERCHILDPURVIEW NUMBER(3) default 0,
  ISHIDDEN         NUMBER(3) default 0,
  PRIMARY KEY  (ID)
);

create index I_BM on BBSCS_BOARDMASTER (BOARDID);

create table BBSCS_BOARDPERMISSION
(
  ID          VARCHAR2(40) default '' not null,
  BOARDID     NUMBER(20) default 0 not null,
  GROUPID     NUMBER(11) default 0 not null,
  PERMISSIONS CLOB,
  PRIMARY KEY  (ID)
);

create unique index U_BP_BID_GID on BBSCS_BOARDPERMISSION (BOARDID, GROUPID);

create table BBSCS_BOARDSAVE
(
  ID      VARCHAR2(40) default '' not null,
  USERID  VARCHAR2(40) default '' not null,
  BOARDID NUMBER(20) default 0 not null,
  PRIMARY KEY  (ID)
);

create unique index U_BS_BID_UID on BBSCS_BOARDSAVE (USERID, BOARDID);

create table BBSCS_BOARDTAG
(
  ID      VARCHAR2(40) not null,
  BOARDID NUMBER(20) not null,
  TAGNAME VARCHAR2(255) not null,
  ORDERS  NUMBER(11) default '0',
  PRIMARY KEY  (ID)
);

create table BBSCS_BOOKMARK
(
  ID           VARCHAR2(40) default '' not null,
  USERID       VARCHAR2(40) default '' not null,
  BOOKMARKNAME VARCHAR2(255) default '' not null,
  URL          VARCHAR2(255) default '',
  ALT          VARCHAR2(255) default '',
  ISSHARE      NUMBER(1) default 1,
  CREATETIME   TIMESTAMP(6) not null,
  PRIMARY KEY  (ID)
);

create index I_BM_UID on BBSCS_BOOKMARK (USERID);

create table BBSCS_CHOICE
(
  ID           VARCHAR2(40) default '' not null,
  CATEGORYID   VARCHAR2(40) default '' not null,
  BOARDID      NUMBER(20) default 0 not null,
  BOARDNAME    VARCHAR2(60) default '' not null,
  POSTID       VARCHAR2(40) default '' not null,
  POSTMAINID   VARCHAR2(40) default '' not null,
  USERID       VARCHAR2(40) default '' not null,
  USERNAME     VARCHAR2(20) default '' not null,
  USERNICKNAME VARCHAR2(60),
  TITLE        VARCHAR2(150),
  CREATETIME   NUMBER(20),
  PRIMARY KEY  (ID)
);

create table BBSCS_CHOICECATEGORY
(
  ID           VARCHAR2(40) default '' not null,
  CATEGORYNAME VARCHAR2(60) default '' not null,
  BOARDID      NUMBER(20) default 0 not null,
  USESTAT      NUMBER(1) default 1 not null,
  ORDERS       NUMBER(11) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_COMMEND
(
  ID             VARCHAR2(40) default '' not null,
  BOARDID        NUMBER(20) default '0' not null,
  BOARDNAME      VARCHAR2(60) default '' not null,
  POSTID         VARCHAR2(40) default '' not null,
  POSTMAINID     VARCHAR2(40) default '' not null,
  USERID         VARCHAR2(40) default '' not null,
  USERNAME       VARCHAR2(20) default '' not null,
  COMMENDBOARDID NUMBER(20) default '0' not null,
  COMMENDTOP     NUMBER(1) default '0' not null,
  TITLE          VARCHAR2(150),
  BOARDCATEGORY  VARCHAR2(40),
  TOPCATEGORY    VARCHAR2(40),
  CREATETIME     NUMBER(20) default 0 not null,
  PRIMARY KEY  (ID)
);

create table BBSCS_CONFIG
(
  ID          VARCHAR2(50) default '' not null,
  CONFCONTEXT CLOB,
  PRIMARY KEY  (ID)
);

create table BBSCS_ELITE
(
  ID         NUMBER(20) not null,
  BOARDID    NUMBER(20) default 0 not null,
  PARENTID   NUMBER(20) default 0 not null,
  PARENTIDS  CLOB,
  ELITENAME  VARCHAR2(90),
  CREATEUSER VARCHAR2(60),
  ELITETIME  NUMBER(20) default 0,
  ORDERS     NUMBER(11) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_FORUM
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_F_BID on BBSCS_FORUM (BOARDID);
create index I_F_LASTTIME on BBSCS_FORUM (LASTTIME);
create index I_F_MID on BBSCS_FORUM (MAINID);
create index I_F_POSTTIME on BBSCS_FORUM (POSTTIME);
create index I_F_USERID on BBSCS_FORUM (USERID);

create table BBSCS_FORUM_HISTORY
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FH_BID on BBSCS_FORUM_HISTORY (BOARDID);
create index I_FH_LASTTIME on BBSCS_FORUM_HISTORY (LASTTIME);
create index I_FH_MID on BBSCS_FORUM_HISTORY (MAINID);
create index I_FH_POSTTIME on BBSCS_FORUM_HISTORY (POSTTIME);

create table BBSCS_FORUMARCHIVES_0
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA0_BID on BBSCS_FORUMARCHIVES_0 (BOARDID);
create index I_FA0_LASTTIME on BBSCS_FORUMARCHIVES_0 (LASTTIME);
create index I_FA0_MID on BBSCS_FORUMARCHIVES_0 (MAINID);
create index I_FA0_POSTTIME on BBSCS_FORUMARCHIVES_0 (POSTTIME);

create table BBSCS_FORUMARCHIVES_1
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA1_BID on BBSCS_FORUMARCHIVES_1 (BOARDID);
create index I_FA1_LASTTIME on BBSCS_FORUMARCHIVES_1 (LASTTIME);
create index I_FA1_MID on BBSCS_FORUMARCHIVES_1 (MAINID);
create index I_FA1_POSTTIME on BBSCS_FORUMARCHIVES_1 (POSTTIME);

create table BBSCS_FORUMARCHIVES_2
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA2_BID on BBSCS_FORUMARCHIVES_2 (BOARDID);
create index I_FA2_LASTTIME on BBSCS_FORUMARCHIVES_2 (LASTTIME);
create index I_FA2_MID on BBSCS_FORUMARCHIVES_2 (MAINID);
create index I_FA2_POSTTIME on BBSCS_FORUMARCHIVES_2 (POSTTIME);

create table BBSCS_FORUMARCHIVES_3
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA3_BID on BBSCS_FORUMARCHIVES_3 (BOARDID);
create index I_FA3_LASTTIME on BBSCS_FORUMARCHIVES_3 (LASTTIME);
create index I_FA3_MID on BBSCS_FORUMARCHIVES_3 (MAINID);
create index I_FA3_POSTTIME on BBSCS_FORUMARCHIVES_3 (POSTTIME);

create table BBSCS_FORUMARCHIVES_4
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA4_BID on BBSCS_FORUMARCHIVES_4 (BOARDID);
create index I_FA4_LASTTIME on BBSCS_FORUMARCHIVES_4 (LASTTIME);
create index I_FA4_MID on BBSCS_FORUMARCHIVES_4 (MAINID);
create index I_FA4_POSTTIME on BBSCS_FORUMARCHIVES_4 (POSTTIME);

create table BBSCS_FORUMARCHIVES_5
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA5_BID on BBSCS_FORUMARCHIVES_5 (BOARDID);
create index I_FA5_LASTTIME on BBSCS_FORUMARCHIVES_5 (LASTTIME);
create index I_FA5_MID on BBSCS_FORUMARCHIVES_5 (MAINID);
create index I_FA5_POSTTIME on BBSCS_FORUMARCHIVES_5 (POSTTIME);

create table BBSCS_FORUMARCHIVES_6
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA6_BID on BBSCS_FORUMARCHIVES_6 (BOARDID);
create index I_FA6_LASTTIME on BBSCS_FORUMARCHIVES_6 (LASTTIME);
create index I_FA6_MID on BBSCS_FORUMARCHIVES_6 (MAINID);
create index I_FA6_POSTTIME on BBSCS_FORUMARCHIVES_6 (POSTTIME);

create table BBSCS_FORUMARCHIVES_7
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA7_BID on BBSCS_FORUMARCHIVES_7 (BOARDID);
create index I_FA7_LASTTIME on BBSCS_FORUMARCHIVES_7 (LASTTIME);
create index I_FA7_MID on BBSCS_FORUMARCHIVES_7 (MAINID);
create index I_FA7_POSTTIME on BBSCS_FORUMARCHIVES_7 (POSTTIME);

create table BBSCS_FORUMARCHIVES_8
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA8_BID on BBSCS_FORUMARCHIVES_8 (BOARDID);
create index I_FA8_LASTTIME on BBSCS_FORUMARCHIVES_8 (LASTTIME);
create index I_FA8_MID on BBSCS_FORUMARCHIVES_8 (MAINID);
create index I_FA8_POSTTIME on BBSCS_FORUMARCHIVES_8 (POSTTIME);

create table BBSCS_FORUMARCHIVES_9
(
  ID                 VARCHAR2(40) default '' not null,
  PARENTID           VARCHAR2(40) default '',
  MAINID             VARCHAR2(40) default '',
  BOARDID            NUMBER(20) default 0 not null,
  BOARDNAME          VARCHAR2(60),
  RENUM              NUMBER(11) default 0,
  FACE               NUMBER(2) default 1,
  USERID             VARCHAR2(40),
  USERNAME           VARCHAR2(20),
  NICKNAME           VARCHAR2(60),
  TITLE              VARCHAR2(150),
  DETAIL             CLOB,
  SIGN               CLOB,
  ARTSIZE            NUMBER(11) default 0,
  CLICK              NUMBER(11) default 0,
  POSTTIME           NUMBER(20) default 0,
  LASTTIME           NUMBER(20) default 0,
  IPADDRESS          VARCHAR2(20),
  ISNEW              NUMBER(1) default 0,
  ELITE              NUMBER(20) default 0,
  ELITEID            NUMBER(20) default 0,
  AGREE              NUMBER(11) default 0,
  BEAGAINST          NUMBER(11) default 0,
  CANNOTDEL          NUMBER(1) default 0,
  CANNOTRE           NUMBER(1) default 0,
  COMMEND            NUMBER(20) default 0,
  DELSIGN            NUMBER(1) default 0,
  DELUSERID          VARCHAR2(40),
  DELUSERNAME        VARCHAR2(20),
  DELTIME            NUMBER(20) default 0,
  DELIP              VARCHAR2(20),
  AMEND              VARCHAR2(255),
  DOELITENAME        VARCHAR2(20) default 0,
  DOELITETIME        NUMBER(20) default 0,
  HAVEATTACHFILE     NUMBER(1) default 0,
  ATTACHFILENAME     CLOB,
  LASTPOSTUSERNAME   VARCHAR2(20),
  LASTPOSTTITLE      VARCHAR2(150),
  LASTPOSTNICKNAME   VARCHAR2(60),
  ISTOP              NUMBER(20) default 0,
  ISLOCK             NUMBER(1) default 0,
  AUDITING           NUMBER(1) default 0,
  AUDITINGATTACHFILE NUMBER(1) default 0,
  ISVOTE             NUMBER(1) default 0,
  ISHIDDEN           NUMBER(4) default 0,
  ISHIDDENVALUE      NUMBER(11) default 1,
  EDITTYPE           NUMBER(1) default 0,
  QUOTETEXT          CLOB,
  QUOTEEDITTYPE      NUMBER(1) default 0,
  POSTTYPE           NUMBER(1) default 0,
  TITLECOLOR         NUMBER(2) default 0,
  USERBLOG           NUMBER(1) default 0,
  INDEXSTATUS        NUMBER(1) default 0,
  EMAILINFORM        NUMBER(1) default 0,
  MSGINFORM          NUMBER(1) default 0,
  VOTEID             VARCHAR2(40),
  TAGID              VARCHAR2(40) default 0,
  TAGNAME            VARCHAR2(255),
  ISGUEST            NUMBER(1) default 0,
  PREVIEWATTACH      NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_FA9_BID on BBSCS_FORUMARCHIVES_9 (BOARDID);
create index I_FA9_LASTTIME on BBSCS_FORUMARCHIVES_9 (LASTTIME);
create index I_FA9_MID on BBSCS_FORUMARCHIVES_9 (MAINID);
create index I_FA9_POSTTIME on BBSCS_FORUMARCHIVES_9 (POSTTIME);


create table BBSCS_FORUMBUY
(
  ID              VARCHAR2(40) not null,
  POSTID          VARCHAR2(40) not null,
  BUYFROMID       VARCHAR2(40) not null,
  BUYFROMNAME     VARCHAR2(20) not null,
  BUYTOID         VARCHAR2(40) not null,
  BUYTONAME       VARCHAR2(20) not null,
  BUYPRICE        NUMBER(11) default 0 not null,
  BUYTOUSERINCOME NUMBER(11) default 0 not null,
  BUYTIME         NUMBER(20) default 0 not null,
  PRIMARY KEY  (ID)
);

create table BBSCS_FRIEND
(
  ID            VARCHAR2(40) default '' not null,
  USERID        VARCHAR2(40) default '' not null,
  USERNAME      VARCHAR2(20) default '' not null,
  FRIENDID      VARCHAR2(40) default '' not null,
  FRIENDNAME    VARCHAR2(20) default '' not null,
  FRIENDCOMMENT CLOB,
  ISBLACK       NUMBER(1) default '0',
  PRIMARY KEY  (ID)
);

create index I_FRI_UID on BBSCS_FRIEND (USERID);

create table BBSCS_GROUPROLE
(
  GROUPID NUMBER(11) default 0 not null,
  ROLEID  NUMBER(11) default 0 not null,
  PRIMARY KEY  (GROUPID,ROLEID)
);

create table BBSCS_LOGINERROR
(
  ID         VARCHAR2(40) default '' not null,
  USERID     VARCHAR2(40) default '' not null,
  ERRORTIMES NUMBER(11) default 0 not null,
  LOGINTIME  NUMBER(20) default 0,
  PRIMARY KEY  (ID)
);

create unique index U_LE_UID on BBSCS_LOGINERROR (USERID);

create table BBSCS_NOTE
(
  ID           VARCHAR2(40) default '' not null,
  FROMID       VARCHAR2(40) default '' not null,
  FROMUSERNAME VARCHAR2(20) default '' not null,
  FROMNICKNAME VARCHAR2(60) default '' not null,
  TOID         VARCHAR2(40) default '' not null,
  TOUSERNAME   VARCHAR2(20) default '' not null,
  TONICKNAME   VARCHAR2(60) default '' not null,
  NOTETYPE     NUMBER(1) default 0 not null,
  NOTETITLE    VARCHAR2(150) default '' not null,
  NOTECONTEXT  CLOB not null,
  CREATETIME   TIMESTAMP(6) not null,
  ISNEW        NUMBER(1) default 1,
  NEEDRE       NUMBER(1) default 0,
  ISRE         NUMBER(1) default 0,
  SYSMSG       NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);
create index I_N_FID on BBSCS_NOTE (FROMID);
create index I_N_TID on BBSCS_NOTE (TOID);

create table BBSCS_PERMISSION
(
  ID                 NUMBER(20) default 0 not null,
  PERMISSIONNAME     VARCHAR2(255) default '' not null,
  PERMISSIONRESOURCE VARCHAR2(255),
  ACTION             VARCHAR2(255),
  TYPEID             NUMBER(2) default 0 not null,
  PRIMARY KEY  (ID)
);

create table BBSCS_ROLE
(
  ID          NUMBER(11) not null,
  ROLENAME    VARCHAR2(255) default '' not null,
  TYPEID      NUMBER(2) default '0' not null,
  PERMISSIONS CLOB,
  PRIMARY KEY  (ID)
);

create table BBSCS_SUBSCIBE
(
  ID          VARCHAR2(40) default '' not null,
  USERID      VARCHAR2(40) default '' not null,
  USERNAME    VARCHAR2(20) default '' not null,
  NICKNAME    VARCHAR2(60) default '' not null,
  POSTID      VARCHAR2(40) default '' not null,
  POSTTITLE   VARCHAR2(150) default '' not null,
  BOARDID     NUMBER(20) default '0' not null,
  EMAILINFORM NUMBER(1) default '1',
  MSGINFORM   NUMBER(1) default '1',
  USEREMAIL   VARCHAR2(255),
  CREATETIME  TIMESTAMP(6),
  USERLOCALE  VARCHAR2(20) default 'zh_CN',
  PRIMARY KEY  (ID)
);

create table BBSCS_SYSNUMSTAT
(
  ID         VARCHAR2(40) not null,
  RECDATE    VARCHAR2(20) not null,
  NUM0       NUMBER(11) default 0,
  NUMINC0    NUMBER(11) default 0 not null,
  NUM1       NUMBER(11) default 0 not null,
  NUMINC1    NUMBER(11) default 0 not null,
  NUM2       NUMBER(11) default 0 not null,
  NUMINC2    NUMBER(11) default 0 not null,
  NUM3       NUMBER(11) default 0 not null,
  NUMINC3    NUMBER(11) default 0 not null,
  NUM4       NUMBER(11) default 0 not null,
  NUMINC4    NUMBER(11) default 0 not null,
  NUM5       NUMBER(11) default 0 not null,
  NUMINC5    NUMBER(11) default 0 not null,
  CREATETIME NUMBER(20) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_USERINFO
(
  ID              VARCHAR2(40) default '' not null,
  USERNAME        VARCHAR2(20) default '' not null,
  NICKNAME        VARCHAR2(60) default '' not null,
  PASSWD          VARCHAR2(40) default '' not null,
  REPASSWD        VARCHAR2(40) default '' not null,
  EMAIL           VARCHAR2(255) default '' not null,
  QUESTION        VARCHAR2(255) default '' not null,
  ANSWER          VARCHAR2(255) default '' not null,
  REGTIME         TIMESTAMP(6) not null,
  LOGINTIME       TIMESTAMP(6) not null,
  LOGINIP         VARCHAR2(20) default '',
  LOGINTIMES      NUMBER(11) default 0 not null,
  LASTLOGINTIME   TIMESTAMP(6),
  LASTLOGINIP     VARCHAR2(20),
  ARTICLENUM      NUMBER(11) default 0,
  STAYTIME        NUMBER(20) default 0,
  ARTICLEELITENUM NUMBER(11) default 0,
  LIFEFORCE       NUMBER(11) default 0,
  USERTITLE       NUMBER(3) default 0,
  COIN            NUMBER(11) default 0,
  LITERARY        NUMBER(11) default 0,
  EXPERIENCE      NUMBER(11) default 0,
  USERKNOW        NUMBER(11) default 0,
  SIGNNAME0       VARCHAR2(30),
  SIGNDETAIL0     CLOB,
  SIGNNAME1       VARCHAR2(30),
  SIGNDETAIL1     CLOB,
  SIGNNAME2       VARCHAR2(30),
  SIGNDETAIL2     CLOB,
  HAVEPIC         NUMBER(3) default 0,
  PICFILENAME     VARCHAR2(255),
  FORUMPERNUM     NUMBER(3) default 20,
  POSTPERNUM      NUMBER(3) default 10,
  USERFROM        VARCHAR2(255),
  TIMEZONE        VARCHAR2(20) default 'GMT+08:00',
  BIRTHYEAR       NUMBER(4) default 1980,
  BIRTHMONTH      NUMBER(2) default 1,
  BIRTHDAY        NUMBER(2) default 1,
  RECEIVENOTE     NUMBER(1) default 1,
  ACCEPTFRIEND    NUMBER(1) default 1,
  FORUMVIEWMODE   NUMBER(1) default 0,
  VALIDATED       NUMBER(1) default 1,
  GROUPID         NUMBER(11) default 0,
  HIDDENLOGIN     NUMBER(1) default 0,
  EDITTYPE        NUMBER(1) default -1,
  USERLOCALE      VARCHAR2(20) default 'zh_CN',
  VALIDATECODE    VARCHAR2(20),
  PRIMARY KEY  (ID)
);

create table BBSCS_USERDETAIL
(
  ID           VARCHAR2(40) default '' not null,
  HEIGHT       VARCHAR2(255),
  WEIGHT       VARCHAR2(255),
  INTEREST     VARCHAR2(255) default '',
  GRADUATE     VARCHAR2(255) default '',
  FAVOURPEOPLE VARCHAR2(255) default '',
  DREAMJOB     VARCHAR2(255) default '',
  FAVOURART    VARCHAR2(255) default '',
  FAVOURMUSIC  VARCHAR2(255) default '',
  FAVOURPLACE  VARCHAR2(255) default '',
  FAVOURMOVIE  VARCHAR2(255) default '',
  FAVOURCHAT   VARCHAR2(255) default '',
  FAVOURBOOK   VARCHAR2(255) default '',
  DREAMLOVER   VARCHAR2(255) default '',
  FAVOURTEAM   VARCHAR2(255) default '',
  HOMEPAGE     VARCHAR2(255) default '',
  OICQNO       VARCHAR2(255) default '',
  ICQNO        VARCHAR2(255) default '',
  MSN          VARCHAR2(255) default '',
  YAHOO        VARCHAR2(255) default '',
  SEX          NUMBER(1) default 0,
  BRIEF        CLOB,
  PRIMARY KEY  (ID),
  CONSTRAINT FK_USERDETAIL_ID FOREIGN KEY (ID) REFERENCES BBSCS_USERINFO (ID) ON DELETE CASCADE
);

create table BBSCS_USERGROUP
(
  ID        NUMBER(11) not null,
  GROUPNAME VARCHAR2(255) default '' not null,
  GROUPDESC VARCHAR2(255),
  TYPEID    NUMBER(2) default 0 not null,
  PRIMARY KEY  (ID)
);

create table BBSCS_USERLEVEL
(
  ID         VARCHAR2(40) not null,
  LEVELNAME  VARCHAR2(60) not null,
  LEVELVALUE NUMBER(11) default 0 not null,
  LEVELTYPE  NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_USERONLINE
(
  ID           VARCHAR2(40) default '' not null,
  USERID       VARCHAR2(40) default '' not null,
  USERNAME     VARCHAR2(20) default '' not null,
  NICKNAME     VARCHAR2(60) default '' not null,
  ONLINETIME   NUMBER(20),
  BOARDID      NUMBER(20) default '0',
  ATPLACE      VARCHAR2(255),
  USERGROUPID  NUMBER(11),
  VALIDATECODE VARCHAR2(100),
  HIDDENUSER   NUMBER(1) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_USERTOP
(
  ID        VARCHAR2(40) not null,
  USERID    VARCHAR2(40) not null,
  USERNAME  VARCHAR2(20) not null,
  NICKNAME  VARCHAR2(60) not null,
  VALUETYPE NUMBER(2) default 0 not null,
  USERVALUE NUMBER(11) default 0,
  VALUEINC  NUMBER(11),
  PRIMARY KEY  (ID)
);

create index I_UT_VT on BBSCS_USERTOP (VALUETYPE);

create table BBSCS_VOTE
(
  ID       VARCHAR2(40) default '' not null,
  TITLE    VARCHAR2(255) default '' not null,
  ISM      NUMBER(1) default 0,
  DEADLINE NUMBER(20) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_VOTEITEM
(
  ID        VARCHAR2(40) default '' not null,
  VOTEID    VARCHAR2(40) default '' not null,
  ITEM      VARCHAR2(255) default '' not null,
  ITEMVALUE NUMBER(11) default 0,
  PRIMARY KEY  (ID)
);

create table BBSCS_VOTEUSER
(
  ID         VARCHAR2(40) default '' not null,
  VOTEID     VARCHAR2(40) default '' not null,
  VOTEUSERID VARCHAR2(40) default '' not null,
  VOTETIME   NUMBER(20) default 0 not null,
  PRIMARY KEY  (ID)
);

create sequence SEQ_BOARD_ID;
create sequence SEQ_BOARDMASTER_ID;
create sequence SEQ_ELITE_ID;
create sequence SEQ_ROLE_ID;
create sequence SEQ_USERGROUP_ID;

COMMIT;

INSERT INTO bbscs_config (ID, ConfContext) VALUES ('AttachFileSize','3072');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('AttachFileType','jpg,jpeg,gif,bmp,png,txt,rar,zip,doc,exe');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('AttachImgRow','3');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('AttachImgType','jpg,jpeg,gif,bmp,png');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('AttachmentNum','10');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('BestrowScreen','**');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('BirthDateTimeFormat','yyyy-MM-dd');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CanDelAttachmentClosedPost','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CanDelAttachmentOverTime','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CanNotRegUserName','guest,webmaster,admin,administrator,fuck,shit,super');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CanNotUseNickName','[法].{0,3}[轮];[江].{0,3}[泽].{0,3}[民];[Ff].{0,2}[Uu].{0,2}[Cc].{0,2}[Kk];[Ss].{0,2}[Hh].{0,2}[Ii].{0,2}[Tt];[六].{0,3}[四];[李].{0,3}[宏].{0,3}[志];[李].{0,3}[洪].{0,3}[志];[大].{0,3}[法];[真].{0,3}[善].{0,3}[忍];[共].{0,3}[产].{0,3}[党];[中].{0,3}[共];[明].{0,3}[慧];[动].{0,3}[乱];[爆].{0,3}[乱];[版].{0,3}[主];[斑].{0,3}[竹];[管].{0,3}[理].{0,3}[员];[坛].{0,3}[主]');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CanSeePageNum','10');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CheckNewPm','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CheckRegUser','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CheckRegUserEmail','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CloseReson','Sorry，社区维护中，请稍候再访问...');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CookieDomain','');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CookieKey','nhNhwZ6X7xzgXnnZBxWFQLwCGQtJojL3');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CookiePath','/');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('CopyRightMsg','www.laoer.com');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('DateShowType','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('DefaultTimeZone','26');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('EditInterface','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('EditPostLimit','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('EditPostTitleLimit','14400');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('FaceHigh','120');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('FaceSize','50');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('FaceWidth','120');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ForbidEmail','glaoer@sina.com');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ForbidIP','61.129.89.99,61.129.89.98');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ForumDateTimeFormat','MM-dd HH:mm');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ForumHotRes','15');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ForumHotViews','100');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ForumName','天乙社区');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ForumPrePage','20');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ForumUrl','http://bbscs.laoer.com');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('IsOpen','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('LogIP','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('LogoutUrl','/login');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('MaxMultiPage','3');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('MetaDescription','java开源社区');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('MetaKeywords','laoer.com,天乙社区,开源,java,struts,hibernate,spring');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('OpenUserReg','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('OtherDateTimeFormat','yyyy-MM-dd HH:mm:ss');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PassChangeUrl','http://www.laoer.com/changPasswd.jsp');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PassRegUrl','http://www.laoer.com/reg.do');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PassUrl','http://www.laoer.com/login.do');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PmAllowFace','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PmAllowHTML','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PmAllowSmilies','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PmAllowUBB','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PmFloodTime','30');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PmMaxLength','3000');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PmPerPage','10');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostCheckTime','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostDateTimeFormat','yyyy-MM-dd HH:mm:ss');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostDefFaceImg','images/icon1.gif');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostHiddenTypeArtNum','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostHiddenTypeMoney','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostHiddenTypeRe','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostMaxSize','150000');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostMinSize','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PostPeriodOfTimeDay','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostPeriodOfTimeEnd','20');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostPeriodOfTimeStart','9');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('PostPerPage','10');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PostPriceList','2,4,8,10,20,30');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PostPriceTax','0.5');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PostShowUserImg','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PostToHistoryDay','90');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PostViewLength','300');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PostVoteRec','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('PrivacyUrl','');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('QuoteMaxSize','300');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('ReduceAttachImg','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('ReduceAttachImgSize','500');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('RegDateTimeFormat','yyyy-MM-dd');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('ScreenWord','[法].{0,3}[轮];[江].{0,3}[泽].{0,3}[民];[Ff].{0,2}[Uu].{0,2}[Cc].{0,2}[Kk];[Ss].{0,2}[Hh].{0,2}[Ii].{0,2}[Tt];[六].{0,3}[四];[李].{0,3}[宏].{0,3}[志];[李].{0,3}[洪].{0,3}[志];[大].{0,3}[法];[真].{0,3}[善].{0,3}[忍];[共].{0,3}[产].{0,3}[党];[中].{0,3}[共];[明].{0,3}[慧];[动].{0,3}[乱];[爆].{0,3}[乱]');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SenderEmail','laoer.@163.com');
INSERT INTO bbscs_config (ID, ConfContext) VALUES ('SignMaxLen','500');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SignUseHtml','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SignUseSmile','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SignUseUBB','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SmtpAuth','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SmtpPasswd','a');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SmtpPort','25');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SmtpServer','smtp.163.com');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('SmtpUser','laoer.');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('TimeFormat','HH:mm');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseAuthCode','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseEmail','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseFace','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseForbid','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseLinkToPages','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UsePass','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UsePm','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UsePostPeriodOfTime','0');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseRegAuthCode','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UserOnlineTime','300');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UserPerPage','5,10,20,30,40');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseSafeLogin','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseScreen','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('UseSign','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('ViewAttachImg','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('VoteChange','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('VoteItemLength','150');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('VoteItemNum','10');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('VoteUpdatePost','1');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('WebmasterEmail','laoer@vip.163.com');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('WebName','天乙软件工作室');
INSERT INTO bbscs_config (ID, ConfContext) VALUES  ('WebUrl','http://www.laoer.com');

COMMIT;

INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES (1,9);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (2,9);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (2,13);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (3,9);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (3,13);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (4,1);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (4,9);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (4,13);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (5,4);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (5,5);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (5,6);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (5,7);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (5,8);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (5,9);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (5,12);
INSERT INTO bbscs_grouprole (GroupID, RoleID) VALUES  (5,13);

COMMIT;

INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES (101,'后台主窗口权限','/adminMain','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (102,'查看后台导航权限','/adminLeft','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (103,'管理打开/关闭论坛权限','/adminOpenSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (104,'网站信息设置权限','/adminWebset','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (105,'基本设置权限','/adminBaseSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (106,'日期时间设置权限','/adminDateTimeFormatSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (107,'COOKIE和通行证设置权限','/adminCookiePassSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (108,'屏蔽选项设置权限','/adminScreenSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (109,'Email选项设置权限','/adminEmailSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (110,'用户注册选项设置权限','/adminUserRegSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (111,'用户资料选项设置权限','/adminUserProSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (112,'用户头像选项设置权限','/adminFaceSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (113,'用户禁止选项设置权限','/adminForbidSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (114,'发帖和编辑选项设置权限','/adminPostSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (115,'附件选项设置权限','/adminAttachSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (116,'投票选项设置权限','/adminVoteSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (117,'悄悄话选项设置权限','/adminPmSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (118,'主题列表显示选项设置权限','/adminForumViewSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (119,'主题内容显示选项设置权限','/adminPostViewSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (120,'隐藏帖选项设置权限','/adminPostHiddenSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (121,'在线时长设定权限','/adminUOTimeSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (122,'查看版区列表权限','/adminBoardList','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (123,'添加修改版区权限','/adminBoardSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (124,'查看版主列表权限','/adminBML','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (125,'添加修改版主权限','/adminBmSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (126,'查看权限列表权限','/adminPermission','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (127,'查看角色列表权限','/adminRoleList','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (128,'管理角色权限','/adminRoleSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (129,'查看用户组列表权限','/adminUgList','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (130,'用户组管理权限','/adminUgSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (131,'用户管理权限','/adminUserSearch','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (132,'版区权限设置权限','/adminBoardUg','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (133,'版区Tag设置权限','/adminBoardTag','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (134,'用户等级设置权限','/adminUserLevel','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (201,'查看社区主框架权限','/main','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (202,'查看社区左侧导航页权限','/nag','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (203,'修改签名权限','/signSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (204,'修改昵称权限','/nickNameSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (205,'个人参数设置权限','/userConfig','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (206,'朋友/黑名单设置权限','/friendSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (207,'悄悄话权限','/note','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (208,'书签管理权限','/bookMark','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (209,'头像设置权限','/userFace','index,uppage,up,delme',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (210,'查看用户头像权限','/userFace','showface',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (211,'修改个人详细资料权限','/userDetailSet','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (212,'进入社区首页权限','/in','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (213,'察看用户资料权限','/userInfo','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (214,'查看在线用户权限','/online','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (215,'全文搜索权限','/search','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (216,'修改密码权限','/cpasswd','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (217,'管理个人珍藏权限','/boardSaveManage','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (220,'社区首页管理','/inCoverManage','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (401,'查看讨论版权限','/forum','index',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (402,'查看热门帖权限','/forum','hot',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (403,'查看推荐帖权限','/forum','commend',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (404,'查看历史帖权限','/forum','history',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (405,'查看主题权限','/read','topic',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (406,'查看主题摘要权限','/read','summary',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (407,'查看用户IP权限','/read','showip,showiphistory',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (408,'显示帖子中附件权限','/read','showupfile',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (409,'显示帖子中投票权限','/read','showvote',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (410,'只看楼主权限','/read','own',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (411,'查看垃圾桶里帖子主题权限','/read','waste',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (412,'查看未审核帖子主题权限','/read','auditing',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (413,'查看未审核附件帖子主题权限','/read','auditingAttach',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (414,'查看精华区帖子主题权限','/read','elite',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (415,'查看所有原始附件权限','/read','attach',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (416,'转移帖子权限','/moveForum','*',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (420,'发帖权限','/post','add,addsave',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (421,'回帖权限','/post','re,requote,addqre,addre,addrequote,buy',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (422,'上传附件权限','/post','upfile,upfileinput,upfiledo',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (423,'编辑帖子权限','/post','edit,editdo,showdelattachpage',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (424,'帖子赞成反对权限','/postOpt','votyes,votno',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (425,'订阅帖子权限','/postOpt','subs',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (426,'帖子打包权限','/postOpt','mailsend,mailsendtopic',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (427,'举报帖子权限','/postOpt','report',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (430,'发布修改投票帖权限','/votePost','addsave,add,edit,editdo',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (431,'投票帖投票权限','/oteOpt','*',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (432,'删除帖子附件权限','/delAttach','*',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (433,'收藏版区权限','/boardSave','*',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (434,'查看帖子订阅列表权限','/subs','*',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (435,'版内搜索权限','/forumSearch','*',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (440,'查看历史帖子主题权限','/read','history,summaryhistory',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (441,'给帖子投票权限','/voteOpt','*',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (450,'查看精华区权限','/refine','index,showelite,showflist',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (451,'管理精华区权限','/refine','manage,showelite,showflist,adddir,intodir,del,outdir,edit,editdo,deldir',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (460,'删除单个帖子权限','/postOpt','dela',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (462,'帖子置顶权限','/postOpt','top,untop',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (463,'M帖权限','/postOpt','cannotdel,candel',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (464,'推荐帖子权限','/postOpt','commend,uncommend',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (465,'锁定帖子权限','/postOpt','lock,unlock',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (466,'加入精华权限','/postOpt','elite',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (470,'版区管理权限','/forumManage','m,w,a,aa,dels,delw,delallw,resume,auditing,auditingAttach,delsnota,delsnotaa',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (471,'版区高级管理权限','/manageAdvance','index,forbiduser,bulletin,addauth,delauth',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (475,'版区封面管理权限','/coverManage','*',2);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (476,'查看社区统计权限','/sysNumStat','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (477,'查看用户列表权限','/userShow','*',0);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (601,'发帖时显示版区置顶选项权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (602,'可以使用彩色标题权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (603,'可直接查看隐藏帖内容权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (604,'不受发帖间隔时间限制','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (605,'高级-编辑所有帖子权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (606,'高级-删除所有帖子权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (607,'高级-删除附件权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (608,'不需要密码进入版区权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (609,'不需要授权进入版区权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (610,'可查看未审核附件权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (611,'发帖不用审核权限','*','*',3);
INSERT INTO bbscs_permission (ID, PermissionName, PermissionResource, Action, TypeID) VALUES  (901,'可以查看隐藏版区权限','*','*',1);

COMMIT;

INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES 
  (1,'版主角色',1,'401,402,403,404,405,406,407,408,409,410,411,412,413,414,420,421,422,423,424,425,426,427,430,431,432,433,434,435,440,450,451,460,462,463,464,465,466,470,471,475,601,602,603,604,605,606,607,608,609,610');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (2,'版副角色',1,'401,402,403,404,405,406,407,408,409,410,411,412,413,414,420,421,422,423,424,425,426,427,430,431,432,433,434,435,440,450,451,460,462,463,464,465,466,470,601,602,603,604,608,609,610');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (3,'隐身版主角色',1,'401,402,403,405,406,407,408,409,410,411,412,413,414,420,421,422,423,424,425,426,427,430,431,432,433,434,435,440,450,451,460,462,463,464,465,466,470,601,602,603,604,608,609,610');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (4,'后台可进行权限管理角色',0,'126,127,128,129,130');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (5,'后台可管理常规选项角色',0,'103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,134');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (6,'后台可管理版区角色',0,'122,123,124,125,132,133');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (7,'可进入后台管理角色',0,'101,102');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (8,'后台可管理用户角色',0,'131');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (9,'前台可进入社区用户角色',0,'201,202,212,213,214,215');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (10,'前台初级管理员角色',0,'901');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (11,'前台中级管理员角色',0,'901');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (12,'前台高级管理员角色',0,'220,476,477,901');
INSERT INTO bbscs_role (ID, RoleName, TypeID, Permissions) VALUES  (13,'前台可管理自己用户信息角色',0,'203,204,205,206,207,208,209,210,211,216,217');

COMMIT;

INSERT INTO bbscs_userinfo (ID, UserName, NickName, Passwd, RePasswd, Email, Question, Answer, RegTime, LoginTime, LoginIP, LoginTimes, LastLoginTime, LastLoginIP, ArticleNum, StayTime, ArticleEliteNum, LifeForce, UserTitle, Coin, Literary, Experience, UserKnow, SignName0, SignDetail0, SignName1, SignDetail1, SignName2, SignDetail2, HavePic, PicFileName, ForumPerNum, PostPerNum, UserFrom, TimeZone, BirthYear, BirthMonth, BirthDay, ReceiveNote, AcceptFriend, ForumViewMode, Validated, GroupID, HiddenLogin, EditType, UserLocale, ValidateCode) VALUES ('4028818208ed006b0108ed020bd50001','webmaster','webmaster','12345','827CCB0EEA8A706C4C34A16891F84E7B','webmaster@laoer.com','who?','webmaster',to_date('2006-08-18','yyyy-mm-dd'),to_date('2006-08-18','yyyy-mm-dd'),'127.0.0.1',0,to_date('2006-08-18','yyyy-mm-dd'),'127.0.0.1',0,0,0,0,0,0,0,0,0,'','孔子东游，遇二小儿辩斗，问其故。 \r\n一小儿曰：我以日本生自山东，故属东。 \r\n一小儿曰：夕阳西下，日本归山西也明矣，是以属西。 \r\n孔子不能决，后以问老子（就是我）。 \r\n老子笑曰：孰为汝多知乎？日本无根基，岂能算东西 ！！','','天乙软件工作室\r\nhttp://www.laoer.com\r\n天乙社区\r\nhttp://bbscs.laoer.com\r\n天乙博客\r\nhttp://blog.laoer.com','',':3:',0,'',20,10,'上海','GMT+08:00',1980,1,1,1,1,2,1,5,0,-1,'zh_CN','');

COMMIT;

INSERT INTO bbscs_userdetail (ID, Height, Weight, Interest, Graduate, FavourPeople, DreamJob, FavourArt, FavourMusic, FavourPlace, FavourMovie, FavourChat, FavourBook, DreamLover, FavourTeam, HomePage, OicqNo, IcqNo, MSN, Yahoo, Sex, Brief) VALUES  ('4028818208ed006b0108ed020bd50001','','','','','','','','','','','','','','','','','','','',1,'');

COMMIT;

INSERT INTO bbscs_usergroup (ID, GroupName, GroupDesc, TypeID) VALUES (1,'游客/未注册用户','',0);
INSERT INTO bbscs_usergroup (ID, GroupName, GroupDesc, TypeID) VALUES (2,'注册用户','',0);
INSERT INTO bbscs_usergroup (ID, GroupName, GroupDesc, TypeID) VALUES (3,'待验证用户','',0);
INSERT INTO bbscs_usergroup (ID, GroupName, GroupDesc, TypeID) VALUES (4,'超级版主','',0);
INSERT INTO bbscs_usergroup (ID, GroupName, GroupDesc, TypeID) VALUES (5,'系统管理员','',0);
INSERT INTO bbscs_usergroup (ID, GroupName, GroupDesc, TypeID) VALUES (6,'封禁用户','',0);

COMMIT;

INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES ('402881820ebb22b2010ebb2462550001','恶贯满盈',-500,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb335f010ebb344eee0001','犯事累累',-100,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb38d84f0001','不务正业',0,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb39143e0002','初出江湖',100,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES ('402881820ebb3806010ebb3961450003','新手上路',300,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb39f1120004','初级站友',800,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3a29d50005','中级站友',1500,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3a7a560006','高级站友',2500,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3ab9730007','青铜长老',5000,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3afd130008','白银长老',7000,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3b71880009','黄金长老',10000,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3bb0f2000a','白金长老',15000,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3be996000b','钻石长老',22000,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3c220b000c','资深元老',30000,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3c55ae000d','社区支柱',40000,0);
INSERT INTO bbscs_userlevel (ID, LevelName, LevelValue, LevelType) VALUES  ('402881820ebb3806010ebb3d6171000f','骨灰级元老',2147483647,0);

COMMIT;