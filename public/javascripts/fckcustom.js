// CHANGE FOR APPS HOSTED IN SUBDIRECTORY
FCKRelativePath = '';

// DON'T CHANGE THESE
FCKConfig.LinkBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Connector='+FCKRelativePath+'/fckeditor/command';
FCKConfig.ImageBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Image&Connector='+FCKRelativePath+'/fckeditor/command';
FCKConfig.FlashBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Flash&Connector='+FCKRelativePath+'/fckeditor/command';

FCKConfig.LinkUploadURL = FCKRelativePath+'/fckeditor/upload';
FCKConfig.ImageUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Image';
FCKConfig.FlashUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Flash';
FCKConfig.SpellerPagesServerScript = FCKRelativePath+'/fckeditor/check_spelling';
FCKConfig.AllowQueryStringDebug = false;
FCKConfig.SpellChecker = 'WSC' ;	// 'WSC' | 'SpellerPages' | 'ieSpell'

//FCKConfig.Plugins.Add( 'easyUpload', 'es' ) ;		// easyUpload translated to spanish
FCKConfig.Plugins.Add( 'easyUpload', 'de,en' ) ;
FCKConfig.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;

// ONLY CHANGE BELOW HERE

FCKConfig.CustomStyles =
{
	'Red Title'	: { Element : 'h3', Styles : { 'color' : 'Red' } },
	'o_box' : { Element : 'div', Attributes : { 'class' : 'o_box' } }
};

FCKConfig.EditorAreaStyles = 'body { background: transparent url(/images/news_box_bg.png) top left repeat; font-size: 15px; color: rgb(102, 102, 102); font-family: "StrangeBreath" !important;} body, td { font-size: 15px; color: rgb(102, 102, 102); font-family: "StrangeBreath" !important; }';

// FCKConfig.FontNames		= 'StrangeBreath;Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana' ;
FCKConfig.FontNames		= 'StrangeBreath;Arial;Comic Sans MS;Courier New;Tahoma;Verdana' ;

// FCKConfig.FontSizes		= '12px;13px;15px;18px;smaller;larger;xx-small;x-small;small;medium;large;x-large;xx-large' ;
FCKConfig.FontSizes		= '12px;13px;15px;18px' ;

FCKConfig.StylesXmlPath		= FCKConfig.EditorPath + 'fckstyles.xml' ;
FCKConfig.TemplatesXmlPath	= FCKConfig.EditorPath + 'fcktemplates.xml' ;
FCKConfig.FontFormats	= 'p;h1;h2;h3;h4;h5;h6;pre;address;div' ;

FCKConfig.FontColors = '000000,993300,333300,003300,003366,000080,333399,333333,800000,FF6600,808000,808080,008080,0000FF,666699,808080,FF0000,FF9900,99CC00,339966,33CCCC,3366FF,800080,999999,FF00FF,FFCC00,FFFF00,00FF00,00FFFF,00CCFF,993366,C0C0C0,FF99CC,FFCC99,FFFF99,CCFFCC,CCFFFF,99CCFF,CC99FF,FFFFFF' ;


FCKConfig.ToolbarLocation = 'In' ;
FCKConfig.BodyId = 'FCK_AREA_Body' ;

FCKConfig.DefaultLanguage		= 'de' ;

FCKConfig.Plugins.Add( 'googlemaps', 'de,en,es,fr,it,nl,no,zh') ;
FCKConfig.Plugins.Add( 'imgmap', 'de,en,es') ;

FCKConfig.GoogleMaps_Key = 'ABQIAAAAgp5iG6N_MddKQ1J5-z-AnBTCJnVLqoFUPAhNdh2wl2i0bLSJvhStUQVQz1AfgdkEYvRDUOwuw2nsGw' ;

// Only inline elements are valid.
FCKConfig.RemoveFormatTags = 'b,big,code,del,dfn,em,font,i,ins,kbd,q,samp,small,span,strike,strong,sub,sup,tt,u,var' ;

// Attributes that will be removed
FCKConfig.RemoveAttributes = 'class,style,lang,width,height,align,hspace,valign' ;

FCKConfig.FillEmptyBlocks	= true ;


FCKConfig.ForcePasteAsPlainText	= true ;


FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/famfamfamAluminum/';

FCKConfig.ToolbarSets["Easy"] = [
        ['Bold','Italic','Underline','StrikeThrough','-'],
        ['OrderedList','UnorderedList','-'],
        ['FontSize'], ['TextColor','BGColor'],
        ['easyImage', 'easyLink', 'Unlink']
] ;

FCKConfig.ToolbarSets["Simple"] = [
	['Save','NewPage','Preview','-','Templates'],
	['-','Image','-','-','ImageButton','-'],
	['Undo','Redo','-','RemoveFormat'],
	['Link','Unlink','Anchor'],
	['-','googlemaps','-'],
	['-','imgmapPopup','-'],
	['Image','Flash','Table','SpecialChar'],
	['Bold','Italic','Underline','StrikeThrough'],
	['OrderedList','UnorderedList','-','Outdent','Indent','CreateDiv'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Style','FontFormat'],
	['TextColor','BGColor'],
	['Source','-','ShowBlocks']
	 // No comma for the last row.
] ;

FCKConfig.ToolbarSets["Default"] = [
	['Source','DocProps','-','Save','NewPage','Preview','-','Templates'],
	['Cut','Copy','Paste','PasteText','PasteWord','-','Print','SpellCheck'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],
	'/',
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent','Blockquote','CreateDiv'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor'],
	['Image','Flash','Table','Rule','Smiley','SpecialChar','PageBreak'],
	'/',
	['Style','FontFormat','FontName','FontSize'],
	['TextColor','BGColor'],
	['easyImage','easyFile','easyLink'],
	['FitWindow','ShowBlocks','-','About']		// No comma for the last row.
] ;

FCKConfig.ToolbarSets["Basic"] = [
	['Bold','Italic','-','OrderedList','UnorderedList','-','Link','Unlink','-','About']
] ;

FCKConfig.EnterMode = 'p' ;			// p | div | br
FCKConfig.ShiftEnterMode = 'br' ;	// p | div | br
