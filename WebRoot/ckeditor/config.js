/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.language = 'zh-cn';
//	config.filebrowserBrowseUrl = 'ckeditor/uploader/browse.jsp';
//	config.filebrowserImageBrowseUrl = 'ckeditor/uploader/browse.jsp?type=Images';
//	config.filebrowserFlashBrowseUrl = 'ckeditor/uploader/browse.jsp?type=Flashs';
	config.filebrowserUploadUrl = 'ckeditor/uploader/upload.jsp';
	config.filebrowserImageUploadUrl = 'ckeditor/uploader/upload.jsp?type=Images';
	config.filebrowserFlashUploadUrl = 'ckeditor/uploader/upload.jsp?type=Flashs';
	config.filebrowserWindowWidth = '640';
	config.filebrowserWindowHeight = '480';
	config.width = "650"; //文本域宽度
    config.height = "400";//文本域高度

	config.toolbar_A =
		[
			
			['Cut','Copy','Paste','PasteText','PasteFromWord'],
			['Undo','Redo','-','SelectAll','RemoveFormat'],
			'/',
			['Bold','Italic','Underline','Strike'],
			['NumberedList','BulletedList','-','Outdent','Indent'],
			['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			['Link','Unlink'],
			['Image','Table','HorizontalRule','Smiley','SpecialChar'],
			'/',
			['Styles','Format','Font','FontSize'],
			['TextColor','BGColor'],	
		];
	config.toolbar = 'A';
	config.toolbar_Basic =
		[
			['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','About']
		];
};
