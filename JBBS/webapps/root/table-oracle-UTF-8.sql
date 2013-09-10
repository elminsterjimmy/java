create table BBSCS_AGREEAGAINST
(
  ID         VARCHAR2(40) default '' not null,
  USERID     VARCHAR2(40) default '' not null,
  POSTID     VARCHAR2(40) default '' not null,
  BOARDID    NUMBER(20) default 0 not null,
  VOTETYPE   NUMBER(1) default 0,
  CREATETIME NUMBER(20) default 0 not null,
  PRIMARY KEY  (ID)
)
######
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
)
######
create table BBSCS_BOARDAUTHUSER
(
  ID         VARCHAR2(40) default '' not null,
  BOARDID    NUMBER(20) default 0 not null,
  USERID     VARCHAR2(40) default '' not null,
  USERNAME   VARCHAR2(20) default '' not null,
  CREATETIME NUMBER(20) default 0,
  PRIMARY KEY  (ID)
)
######
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
)
######
create index I_BM on BBSCS_BOARDMASTER (BOARDID)
######
create table BBSCS_BOARDPERMISSION
(
  ID          VARCHAR2(40) default '' not null,
  BOARDID     NUMBER(20) default 0 not null,
  GROUPID     NUMBER(11) default 0 not null,
  PERMISSIONS CLOB,
  PRIMARY KEY  (ID)
)
######
create unique index U_BP_BID_GID on BBSCS_BOARDPERMISSION (BOARDID, GROUPID)
######
create table BBSCS_BOARDSAVE
(
  ID      VARCHAR2(40) default '' not null,
  USERID  VARCHAR2(40) default '' not null,
  BOARDID NUMBER(20) default 0 not null,
  PRIMARY KEY  (ID)
)
######
create unique index U_BS_BID_UID on BBSCS_BOARDSAVE (USERID, BOARDID)
######
create table BBSCS_BOARDTAG
(
  ID      VARCHAR2(40) not null,
  BOARDID NUMBER(20) not null,
  TAGNAME VARCHAR2(255) not null,
  ORDERS  NUMBER(11) default '0',
  PRIMARY KEY  (ID)
)
######
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
)
######
create index I_BM_UID on BBSCS_BOOKMARK (USERID)
######
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
)
######
create table BBSCS_CHOICECATEGORY
(
  ID           VARCHAR2(40) default '' not null,
  CATEGORYNAME VARCHAR2(60) default '' not null,
  BOARDID      NUMBER(20) default 0 not null,
  USESTAT      NUMBER(1) default 1 not null,
  ORDERS       NUMBER(11) default 0,
  PRIMARY KEY  (ID)
)
######
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
)
######
create table BBSCS_CONFIG
(
  ID          VARCHAR2(50) default '' not null,
  CONFCONTEXT CLOB,
  PRIMARY KEY  (ID)
)
######
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
)
######
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
)
######
create index I_F_BID on BBSCS_FORUM (BOARDID)
######
create index I_F_DELSIGN on BBSCS_FORUM (DELSIGN)
######
create index I_F_ISNEW on BBSCS_FORUM (ISNEW)
######
create index I_F_LASTTIME on BBSCS_FORUM (LASTTIME)
######
create index I_F_MID on BBSCS_FORUM (MAINID)
######
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
)
######
create index I_FH_BID on BBSCS_FORUM_HISTORY (BOARDID)
######
create index I_FH_DELSIGN on BBSCS_FORUM_HISTORY (DELSIGN)
######
create index I_FH_ISNEW on BBSCS_FORUM_HISTORY (ISNEW)
######
create index I_FH_LASTTIME on BBSCS_FORUM_HISTORY (LASTTIME)
######
create index I_FH_MID on BBSCS_FORUM_HISTORY (MAINID)
######
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
)
######
create index I_FA0_BID on BBSCS_FORUMARCHIVES_0 (BOARDID)
######
create index I_FA0_LASTTIME on BBSCS_FORUMARCHIVES_0 (LASTTIME)
######
create index I_FA0_MID on BBSCS_FORUMARCHIVES_0 (MAINID)
######
create index I_FA0_POSTTIME on BBSCS_FORUMARCHIVES_0 (POSTTIME)
######
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
)
######
create index I_FA1_BID on BBSCS_FORUMARCHIVES_1 (BOARDID)
######
create index I_FA1_LASTTIME on BBSCS_FORUMARCHIVES_1 (LASTTIME)
######
create index I_FA1_MID on BBSCS_FORUMARCHIVES_1 (MAINID)
######
create index I_FA1_POSTTIME on BBSCS_FORUMARCHIVES_1 (POSTTIME)
######
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
)
######
create index I_FA2_BID on BBSCS_FORUMARCHIVES_2 (BOARDID)
######
create index I_FA2_LASTTIME on BBSCS_FORUMARCHIVES_2 (LASTTIME)
######
create index I_FA2_MID on BBSCS_FORUMARCHIVES_2 (MAINID)
######
create index I_FA2_POSTTIME on BBSCS_FORUMARCHIVES_2 (POSTTIME)
######
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
)
######
create index I_FA3_BID on BBSCS_FORUMARCHIVES_3 (BOARDID)
######
create index I_FA3_LASTTIME on BBSCS_FORUMARCHIVES_3 (LASTTIME)
######
create index I_FA3_MID on BBSCS_FORUMARCHIVES_3 (MAINID)
######
create index I_FA3_POSTTIME on BBSCS_FORUMARCHIVES_3 (POSTTIME)
######
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
)
######
create index I_FA4_BID on BBSCS_FORUMARCHIVES_4 (BOARDID)
######
create index I_FA4_LASTTIME on BBSCS_FORUMARCHIVES_4 (LASTTIME)
######
create index I_FA4_MID on BBSCS_FORUMARCHIVES_4 (MAINID)
######
create index I_FA4_POSTTIME on BBSCS_FORUMARCHIVES_4 (POSTTIME)
######
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
)
######
create index I_FA5_BID on BBSCS_FORUMARCHIVES_5 (BOARDID)
######
create index I_FA5_LASTTIME on BBSCS_FORUMARCHIVES_5 (LASTTIME)
######
create index I_FA5_MID on BBSCS_FORUMARCHIVES_5 (MAINID)
######
create index I_FA5_POSTTIME on BBSCS_FORUMARCHIVES_5 (POSTTIME)
######
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
)
######
create index I_FA6_BID on BBSCS_FORUMARCHIVES_6 (BOARDID)
######
create index I_FA6_LASTTIME on BBSCS_FORUMARCHIVES_6 (LASTTIME)
######
create index I_FA6_MID on BBSCS_FORUMARCHIVES_6 (MAINID)
######
create index I_FA6_POSTTIME on BBSCS_FORUMARCHIVES_6 (POSTTIME)
######
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
)
######
create index I_FA7_BID on BBSCS_FORUMARCHIVES_7 (BOARDID)
######
create index I_FA7_LASTTIME on BBSCS_FORUMARCHIVES_7 (LASTTIME)
######
create index I_FA7_MID on BBSCS_FORUMARCHIVES_7 (MAINID)
######
create index I_FA7_POSTTIME on BBSCS_FORUMARCHIVES_7 (POSTTIME)
######
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
)
######
create index I_FA8_BID on BBSCS_FORUMARCHIVES_8 (BOARDID)
######
create index I_FA8_LASTTIME on BBSCS_FORUMARCHIVES_8 (LASTTIME)
######
create index I_FA8_MID on BBSCS_FORUMARCHIVES_8 (MAINID)
######
create index I_FA8_POSTTIME on BBSCS_FORUMARCHIVES_8 (POSTTIME)
######
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
)
######
create index I_FA9_BID on BBSCS_FORUMARCHIVES_9 (BOARDID)
######
create index I_FA9_LASTTIME on BBSCS_FORUMARCHIVES_9 (LASTTIME)
######
create index I_FA9_MID on BBSCS_FORUMARCHIVES_9 (MAINID)
######
create index I_FA9_POSTTIME on BBSCS_FORUMARCHIVES_9 (POSTTIME)
######
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
)
######
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
)
######
create index I_FRI_UID on BBSCS_FRIEND (USERID)
######
create table BBSCS_GROUPROLE
(
  GROUPID NUMBER(11) default 0 not null,
  ROLEID  NUMBER(11) default 0 not null,
  PRIMARY KEY  (GROUPID,ROLEID)
)
######
create table BBSCS_LOGINERROR
(
  ID         VARCHAR2(40) default '' not null,
  USERID     VARCHAR2(40) default '' not null,
  ERRORTIMES NUMBER(11) default 0 not null,
  LOGINTIME  NUMBER(20) default 0,
  PRIMARY KEY  (ID)
)
######
create unique index U_LE_UID on BBSCS_LOGINERROR (USERID)
######
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
)
######
create index I_N_FID on BBSCS_NOTE (FROMID)
######
create index I_N_TID on BBSCS_NOTE (TOID)
######
create table BBSCS_PERMISSION
(
  ID                 NUMBER(20) default 0 not null,
  PERMISSIONNAME     VARCHAR2(255) default '' not null,
  PERMISSIONRESOURCE VARCHAR2(255),
  ACTION             VARCHAR2(255),
  TYPEID             NUMBER(2) default 0 not null,
  PRIMARY KEY  (ID)
)
######
create table BBSCS_ROLE
(
  ID          NUMBER(11) not null,
  ROLENAME    VARCHAR2(255) default '' not null,
  TYPEID      NUMBER(2) default '0' not null,
  PERMISSIONS CLOB,
  PRIMARY KEY  (ID)
)
######
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
)
######
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
)
######
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
)
######
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
)
######
create table BBSCS_USERGROUP
(
  ID        NUMBER(11) not null,
  GROUPNAME VARCHAR2(255) default '' not null,
  GROUPDESC VARCHAR2(255),
  TYPEID    NUMBER(2) default 0 not null,
  PRIMARY KEY  (ID)
)
######
create table BBSCS_USERLEVEL
(
  ID         VARCHAR2(40) not null,
  LEVELNAME  VARCHAR2(60) not null,
  LEVELVALUE NUMBER(11) default 0 not null,
  LEVELTYPE  NUMBER(1) default 0,
  PRIMARY KEY  (ID)
)
######
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
)
######
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
)
######
create index I_UT_VT on BBSCS_USERTOP (VALUETYPE)
######
create table BBSCS_VOTE
(
  ID       VARCHAR2(40) default '' not null,
  TITLE    VARCHAR2(255) default '' not null,
  ISM      NUMBER(1) default 0,
  DEADLINE NUMBER(20) default 0,
  PRIMARY KEY  (ID)
)
######
create table BBSCS_VOTEITEM
(
  ID        VARCHAR2(40) default '' not null,
  VOTEID    VARCHAR2(40) default '' not null,
  ITEM      VARCHAR2(255) default '' not null,
  ITEMVALUE NUMBER(11) default 0,
  PRIMARY KEY  (ID)
)
######
create table BBSCS_VOTEUSER
(
  ID         VARCHAR2(40) default '' not null,
  VOTEID     VARCHAR2(40) default '' not null,
  VOTEUSERID VARCHAR2(40) default '' not null,
  VOTETIME   NUMBER(20) default 0 not null,
  PRIMARY KEY  (ID)
)
######
create sequence SEQ_BOARD_ID
######
create sequence SEQ_BOARDMASTER_ID
######
create sequence SEQ_ELITE_ID
######
create sequence SEQ_ROLE_ID
######
create sequence SEQ_USERGROUP_ID