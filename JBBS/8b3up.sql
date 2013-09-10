update `bbscs_permission` set `PermissionResource` = "/adminPmSet" where id = 117;
INSERT INTO `bbscs_config` ( `ID` , `ConfContext` ) VALUES ('UseAuthCode', '1');
INSERT INTO `bbscs_config` ( `ID` , `ConfContext` ) VALUES ('PostToHistoryDay', '90');
INSERT INTO `bbscs_config` ( `ID` , `ConfContext` ) VALUES ('UseRegAuthCode', '1');