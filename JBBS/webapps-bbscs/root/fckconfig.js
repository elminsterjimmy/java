/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2005 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * "Support Open Source software. What about a donation today?"
 * 
 * File Name: fckconfig.js
 * 	Editor configuration settings.
 * 	See the documentation for more info.
 * 
 * File Authors:
 * 		Frederico Caldeira Knabben (fredck@fckeditor.net)
 */

FCKConfig.CustomConfigurationsPath = '' ;

FCKConfig.EditorAreaCSS = FCKConfig.BasePath + 'css/fck_editorarea.css' ;

FCKConfig.DocType = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' ;

FCKConfig.BaseHref = '' ;

FCKConfig.FullPage = false ;

FCKConfig.Debug = false ;
FCKConfig.AllowQueryStringDebug = true ;

FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/default/' ;

FCKConfig.PluginsPath = FCKConfig.BasePath + 'plugins/' ;

// FCKConfig.Plugins.Add( 'placeholder', 'de,en,fr,it,pl' ) ;

FCKConfig.ProtectedSource.Add( /<script[\s\S]*?\/script>/gi ) ;	// <SCRIPT> tags.
// FCKConfig.ProtectedSource.Add( /<%[\s\S]*?%>/g ) ;	// ASP style server side code <%...%>
// FCKConfig.ProtectedSource.Add( /<\?[\s\S]*?\?>/g ) ;	// PHP style server side code <?...?>
// FCKConfig.ProtectedSource.Add( /(<asp:[^\>]+>[\s|\S]*?<\/asp:[^\>]+>)|(<asp:[^\>]+\/>)/gi ) ;	// ASP.Net style tags <asp:control>

FCKConfig.AutoDetectLanguage	= true ;
FCKConfig.DefaultLanguage		= 'en' ;
FCKConfig.ContentLangDirection	= 'ltr' ;

FCKConfig.EnableXHTML		= true ;	// Unsupported: Do not change.
FCKConfig.EnableSourceXHTML	= true ;	// Unsupported: Do not change.

FCKConfig.ProcessHTMLEntities	= true ;
FCKConfig.IncludeLatinEntities	= true ;
FCKConfig.IncludeGreekEntities	= true ;

FCKConfig.FillEmptyBlocks	= true ;

FCKConfig.FormatSource		= true ;
FCKConfig.FormatOutput		= true ;
FCKConfig.FormatIndentator	= '    ' ;

FCKConfig.ForceStrongEm = true ;
FCKConfig.GeckoUseSPAN	= true ;
FCKConfig.StartupFocus	= false ;
FCKConfig.ForcePasteAsPlainText	= false ;
FCKConfig.AutoDetectPasteFromWord = true ;	// IE only.
FCKConfig.ForceSimpleAmpersand	= false ;
FCKConfig.TabSpaces		= 0 ;
FCKConfig.ShowBorders	= true ;
FCKConfig.UseBROnCarriageReturn	= false ;	// IE only.
FCKConfig.ToolbarStartExpanded	= true ;
FCKConfig.ToolbarCanCollapse	= true ;
FCKConfig.IEForceVScroll = false ;
FCKConfig.IgnoreEmptyParagraphValue = true ;
FCKConfig.PreserveSessionOnFileBrowser = false ;
FCKConfig.FloatingPanelsZIndex = 10000 ;

FCKConfig.ToolbarSets["Default"] = [
	['Source','DocProps','-','Save','NewPage','Preview','-','Templates'],
	['Cut','Copy','Paste','PasteText','PasteWord','-','Print','SpellCheck'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor'],
	['Image','Flash','Table','Rule','Smiley','SpecialChar','PageBreak','UniversalKey'],
	['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],
	'/',
	['Style','FontFormat','FontName','FontSize'],
	['TextColor','BGColor'],
	['About']
] ;

FCKConfig.ToolbarSets["Basic"] = [
	['Bold','Italic','Underline','-','OrderedList','UnorderedList','-','Link','Unlink','-','Image','Flash','Smiley']
] ;

FCKConfig.ToolbarSets["Bbscs"] = [
	['Preview','-','Templates'],
	['Cut','Copy','Paste','PasteText','PasteWord'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor'],
	['Image','Flash','Table','Rule','Smiley','SpecialChar','UniversalKey'],
	'/',
	['Style','FontFormat','FontName','FontSize'],
	['TextColor','BGColor']
] ;

FCKConfig.ContextMenu = ['Generic','Link','Anchor','Image','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','TableCell','Table','Form'] ;

FCKConfig.FontColors = '000000,993300,333300,003300,003366,000080,333399,333333,800000,FF6600,808000,808080,008080,0000FF,666699,808080,FF0000,FF9900,99CC00,339966,33CCCC,3366FF,800080,999999,FF00FF,FFCC00,FFFF00,00FF00,00FFFF,00CCFF,993366,C0C0C0,FF99CC,FFCC99,FFFF99,CCFFCC,CCFFFF,99CCFF,CC99FF,FFFFFF' ;

FCKConfig.FontNames		= 'Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana' ;
FCKConfig.FontSizes		= '1/xx-small;2/x-small;3/small;4/medium;5/large;6/x-large;7/xx-large' ;
FCKConfig.FontFormats	= 'p;div;pre;address;h1;h2;h3;h4;h5;h6' ;

FCKConfig.StylesXmlPath		= FCKConfig.EditorPath + 'fckstyles.xml' ;
FCKConfig.TemplatesXmlPath	= FCKConfig.EditorPath + 'fcktemplates.xml' ;

FCKConfig.SpellChecker			= 'ieSpell' ;	// 'ieSpell' | 'SpellerPages'
FCKConfig.IeSpellDownloadUrl	= 'http://www.iespell.com/rel/ieSpellSetup211325.exe' ;

FCKConfig.MaxUndoLevels = 15 ;

FCKConfig.DisableImageHandles = false ;
FCKConfig.DisableTableHandles = false ;

FCKConfig.LinkDlgHideTarget		= false ;
FCKConfig.LinkDlgHideAdvanced	= false ;

FCKConfig.ImageDlgHideLink		= false ;
FCKConfig.ImageDlgHideAdvanced	= false ;

FCKConfig.FlashDlgHideAdvanced	= false ;

// The following value defines which File Browser connector and Quick Upload 
// "uploader" to use. It is valid for the default implementaion and it is here
// just to make this configuration file cleaner. 
// It is not possible to change this value using an external file or even 
// inline when creating the editor instance. In that cases you must set the 
// values of LinkBrowserURL, ImageBrowserURL and so on.
// Custom implementations should just ignore it.
var _FileBrowserLanguage	= 'asp' ;	// asp | aspx | cfm | lasso | perl | php | py
var _QuickUploadLanguage	= 'asp' ;	// asp | aspx | cfm | lasso | php

// Don't care about the following line. It just calculates the correct connector 
// extension to use for the default File Browser (Perl uses "cgi").
var _FileBrowserExtension = _FileBrowserLanguage == 'perl' ? 'cgi' : _FileBrowserLanguage ;

FCKConfig.LinkBrowser = false ;
FCKConfig.LinkBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Connector=connectors/' + _FileBrowserLanguage + '/connector.' + _FileBrowserExtension ;
FCKConfig.LinkBrowserWindowWidth	= FCKConfig.ScreenWidth * 0.7 ;		// 70%
FCKConfig.LinkBrowserWindowHeight	= FCKConfig.ScreenHeight * 0.7 ;	// 70%

FCKConfig.ImageBrowser = false ;
FCKConfig.ImageBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Image&Connector=connectors/' + _FileBrowserLanguage + '/connector.' + _FileBrowserExtension ;
FCKConfig.ImageBrowserWindowWidth  = FCKConfig.ScreenWidth * 0.7 ;	// 70% ;
FCKConfig.ImageBrowserWindowHeight = FCKConfig.ScreenHeight * 0.7 ;	// 70% ;

FCKConfig.FlashBrowser = false ;
FCKConfig.FlashBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/' + _FileBrowserLanguage + '/connector.' + _FileBrowserExtension ;
FCKConfig.FlashBrowserWindowWidth  = FCKConfig.ScreenWidth * 0.7 ;	//70% ;
FCKConfig.FlashBrowserWindowHeight = FCKConfig.ScreenHeight * 0.7 ;	//70% ;

FCKConfig.LinkUpload = false ;
FCKConfig.LinkUploadURL = FCKConfig.BasePath + 'filemanager/upload/' + FCKConfig.QuickUploadLanguage + '/upload.' + _QuickUploadLanguage ;
FCKConfig.LinkUploadAllowedExtensions	= "" ;			// empty for all
FCKConfig.LinkUploadDeniedExtensions	= ".(php|php3|php5|phtml|asp|aspx|ascx|jsp|cfm|cfc|pl|bat|exe|dll|reg|cgi)$" ;	// empty for no one

FCKConfig.ImageUpload = false ;
FCKConfig.ImageUploadURL = FCKConfig.BasePath + 'filemanager/upload/' + FCKConfig.QuickUploadLanguage + '/upload.' + _QuickUploadLanguage + '?Type=Image' ;
FCKConfig.ImageUploadAllowedExtensions	= ".(jpg|gif|jpeg|png)$" ;		// empty for all
FCKConfig.ImageUploadDeniedExtensions	= "" ;							// empty for no one

FCKConfig.FlashUpload = false ;
FCKConfig.FlashUploadURL = FCKConfig.BasePath + 'filemanager/upload/' + FCKConfig.QuickUploadLanguage + '/upload.' + _QuickUploadLanguage + '?Type=Flash' ;
FCKConfig.FlashUploadAllowedExtensions	= ".(swf|fla)$" ;		// empty for all
FCKConfig.FlashUploadDeniedExtensions	= "" ;					// empty for no one

FCKConfig.SmileyPath	= FCKConfig.BasePath + 'images/smiley/taobao/' ;
FCKConfig.SmileyImages	= ['0.gif','1.gif','2.gif','3.gif','4.gif','5.gif','6.gif','7.gif','8.gif','9.gif','10.gif','11.gif','12.gif','13.gif','14.gif','15.gif','16.gif','17.gif','18.gif','19.gif','20.gif','21.gif','22.gif','23.gif','24.gif','25.gif','26.gif','27.gif','28.gif','29.gif','30.gif','31.gif','32.gif','33.gif','34.gif','35.gif','36.gif','37.gif','38.gif','39.gif','40.gif','41.gif','42.gif','43.gif','44.gif','45.gif','46.gif','47.gif','48.gif','49.gif','50.gif','51.gif','52.gif','52.gif','54.gif','55.gif','56.gif','57.gif','58.gif','59.gif','60.gif','61.gif','62.gif','63.gif','64.gif','65.gif','66.gif','67.gif','68.gif','69.gif','70.gif','71.gif','73.gif','75.gif','76.gif','77.gif','78.gif','79.gif','80.gif','81.gif','82.gif','83.gif','84.gif','85.gif'] ;
FCKConfig.SmileyColumns = 8 ;
FCKConfig.SmileyWindowWidth		= 650 ;
FCKConfig.SmileyWindowHeight	= 340 ;

if( window.console ) window.console.log( 'Config is loaded!' ) ;	// @Packager.Compactor.RemoveLine