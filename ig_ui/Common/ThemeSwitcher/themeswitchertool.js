﻿/* jQuery plugin themeswitcher
---------------------------------------------------------------------*/
$.fn.themeswitcher = function(settings){
    var options = jQuery.extend({
        loadTheme: null,
        initialText: parseInt(siteLanguage, 10) === 1041 ? 'スイッチのテーマ' : 'Switch Theme',
        width: 150,
        height: 200,
        buttonPreText: parseInt(siteLanguage, 10) === 1041 ? 'テーマ: ' : 'Theme: ',
        closeOnSelect: true,
        buttonHeight: 14,
        cookieName: 'jquery-ui-theme',
        onOpen: function(){},
        onClose: function(){},
        onSelect: function(){},
        useStandard:true,
        cssPrefix:"/samplesbrowser/samplescommon/aspnet/Common/ThemeSwitcher/themes/",
		cssSuffix:"/jquery-ui.css",
		//imgPrefix:"http://static.jquery.com/ui/themeroller/images/themeGallery/theme_90_",
		//imgSuffix:".png",
		imageLocation:"/samplesbrowser/samplescommon/aspnet/Common/ThemeSwitcher/images/",
        themes:{},
        useCookie:true
    }, settings);
	
	if(options.useStandard)
        var imgLoc = options.imageLocation;
        var cssPrefix = options.cssPrefix;
        var cssSuffix = options.cssSuffix;

		$.extend(options.themes,{
			'Base':{icon:imgLoc+"base.png", css:cssPrefix+"base"+cssSuffix},
			'Black Tie':{icon:imgLoc+"theme_90_black_tie.png", css:cssPrefix+"black-tie"+cssSuffix},
			'Blitzer':{icon:imgLoc+"theme_90_blitzer.png", css:cssPrefix+"blitzer"+cssSuffix}, 
			'Cupertino':{icon:imgLoc+"theme_90_cupertino.png", css:cssPrefix+"cupertino"+cssSuffix},
			'Dark Hive':{icon:imgLoc+"theme_90_dark_hive.png", css:cssPrefix+"dark-hive"+cssSuffix}, 
			'Dot Luv':{icon:imgLoc+"theme_90_dot_luv.png", css:cssPrefix+"dot-luv"+cssSuffix},
			'Eggplant':{icon:imgLoc+"theme_90_eggplant.png", css:cssPrefix+"eggplant"+cssSuffix},
			'Excite Bike':{icon:imgLoc+"theme_90_excite_bike.png", css:cssPrefix+"excite-bike"+cssSuffix},
			'Flick':{icon:imgLoc+"theme_90_flick.png", css:cssPrefix+"flick"+cssSuffix},
			'Hot sneaks':{icon:imgLoc+"theme_90_hot_sneaks.png", css:cssPrefix+"hot-sneaks"+cssSuffix},
			'Humanity':{icon:imgLoc+"theme_90_humanity.png", css:cssPrefix+"humanity"+cssSuffix},
			'Le Frog':{icon:imgLoc+"theme_90_le_frog.png", css:cssPrefix+"le-frog"+cssSuffix},
			'Mint Choc':{icon:imgLoc+"theme_90_mint_choco.png", css:cssPrefix+"mint-choc"+cssSuffix},
			'Overcast':{icon:imgLoc+"theme_90_overcast.png", css:cssPrefix+"overcast"+cssSuffix},
			'Pepper Grinder':{icon:imgLoc+"theme_90_pepper_grinder.png", css:cssPrefix+"pepper-grinder"+cssSuffix},
			'Redmond':{icon:imgLoc+"theme_90_windoze.png", css:cssPrefix+"redmond"+cssSuffix},
			'Smoothness':{icon:imgLoc+"theme_90_smoothness.png", css:cssPrefix+"smoothness"+cssSuffix},
			'South Street':{icon:imgLoc+"theme_90_south_street.png", css:cssPrefix+"south-street"+cssSuffix},
			'Start':{icon:imgLoc+"theme_90_start_menu.png", css:cssPrefix+"start"+cssSuffix},
			'Sunny':{icon:imgLoc+"theme_90_sunny.png", css:cssPrefix+"sunny"+cssSuffix},
			'Swanky Purse':{icon:imgLoc+"theme_90_swanky_purse.png", css:cssPrefix+"swanky-purse"+cssSuffix},
			'Trontastic':{icon:imgLoc+"theme_90_trontastic.png", css:cssPrefix+"trontastic"+cssSuffix},
			'UI darkness':{icon:imgLoc+"theme_90_ui_dark.png", css:cssPrefix+"ui-darkness"+cssSuffix},
			'UI lightness':{icon:imgLoc+"theme_90_ui_light.png", css:cssPrefix+"ui-lightness"+cssSuffix},
            'Vader':{icon:imgLoc+"theme_90_black_matte.png", css:cssPrefix+"vader"+cssSuffix}
		});
	var theme_ul="";
	for (var i in options.themes){
		css=options.themes[i].css || options.cssPrefix+i+options.cssSuffix;
		img=options.themes[i].icon || options.imgPrefix+i.replace('-','_')+options.imgSuffix;
		theme_ul+="<li><a href='"+css+"'><img src='"+img+"' title='"+i+"' alt='"+img+"'/><span class='themeName''>"+i+"</span></a></li>";
	}
	theme_ul="<ul>"+theme_ul+"</ul>"
    
    //markup 
    var button = $('<a href="#" class="jquery-ui-themeswitcher-trigger"><span class="jquery-ui-themeswitcher-icon"></span><span class="jquery-ui-themeswitcher-title">'+ options.initialText +'</span></a>');
    var switcherpane = $('<div class="jquery-ui-themeswitcher"><div id="themeGallery">'+theme_ul+'</div></div>')
    				.find('div').removeAttr('id');
    
    //button events
    button.click(function(){
        if(switcherpane.is(':visible')) 
        	switcherpane.spHide();
        else 
        	switcherpane.spShow(); 
        return false;
    });
    
    //menu events (mouseout didn't work...)
    switcherpane.hover(function(){},function(){if(switcherpane.is(':visible')){$(this).spHide();}});

    //show/hide panel functions
    $.fn.spShow = function(){ $(this).css({top: button.offset().top + options.buttonHeight + 6, left: button.offset().left}).slideDown(50); button.css(button_active); options.onOpen(); }
    $.fn.spHide = function(){ $(this).slideUp(50, function(){options.onClose();}); button.css(button_default); }
    
        
    /* Theme Loading
    ---------------------------------------------------------------------*/
    switcherpane.find('a').click(function(){
        updateCSS( $(this).attr('href') );
        var themeName = $(this).find('span').text();
        button.find('.jquery-ui-themeswitcher-title').text( options.buttonPreText + themeName );
        if(options.useCookie) $.cookie(options.cookieName, themeName);
        options.onSelect();
        if(options.closeOnSelect && switcherpane.is(':visible')){ switcherpane.spHide(); }
        return false;
    });
    
    //function to rewrite stylesheet link. 
    // if there is not onewith an id='ui-theme', append to <head>
    function updateCSS(locStr){
		if($("head link#ui-theme").length==0)
	        $("head").append($('<link href="" type="text/css" rel="Stylesheet" id="ui-theme" />'));
        $("head link#ui-theme").attr('href',locStr);
    }   
    
    /* Inline CSS 
    ---------------------------------------------------------------------*/
    var button_default = {
        fontFamily: 'Trebuchet MS, Verdana, sans-serif',
        fontSize: '11px',
        color: '#666',
        background: '#eee url('+options.imageLocation+'buttonbg.png) 50% 50% repeat-x',
        border: '1px solid #ccc',
        '-moz-border-radius': '6px',
        '-webkit-border-radius': '6px',
        textDecoration: 'none',
        padding: '3px 3px 3px 8px',
        width: options.width - 11,//minus must match left and right padding 
        display: 'block',
        height: options.buttonHeight,
        outline: '0'
    };
    var button_hover = {
        'borderColor':'#bbb',
        'background': '#f0f0f0',
        cursor: 'pointer',
        color: '#444'
    };
    var button_active = {
        color: '#aaa',
        background: '#000',
        border: '1px solid #ccc',
        borderBottom: 0,
        '-moz-border-radius-bottomleft': 0,
        '-webkit-border-bottom-left-radius': 0,
        '-moz-border-radius-bottomright': 0,
        '-webkit-border-bottom-right-radius': 0,
        outline: '0'
    };
    
    //button css
    button.css(button_default)
    .hover(
        function(){ 
            $(this).css(button_hover); 
        },
        function(){ 
         if( !switcherpane.is(':animated') && switcherpane.is(':hidden') ){ $(this).css(button_default);  }
        }   
    )
    .find('.jquery-ui-themeswitcher-icon').css({
        float: 'right',
        width: '16px',
        height: '16px',
        background: 'url('+options.imageLocation+'icon_color_arrow.gif) 50% 50% no-repeat'
    }); 
    //pane css
    switcherpane.css({
        position: 'absolute',
        float: 'left',
        fontFamily: 'Trebuchet MS, Verdana, sans-serif',
        fontSize: '12px',
        background: '#000',
        color: '#fff',
        padding: '8px 3px 3px',
        border: '1px solid #ccc',
        '-moz-border-radius-bottomleft': '6px',
        '-webkit-border-bottom-left-radius': '6px',
        '-moz-border-radius-bottomright': '6px',
        '-webkit-border-bottom-right-radius': '6px',
        borderTop: 0,
        zIndex: 999999,
        width: options.width-6//minus must match left and right padding
    })
    .find('ul').css({
        listStyle: 'none',
        margin: '0',
        padding: '0',
        overflow: 'auto',
        height: options.height
    }).end()
    .find('li').hover(
        function(){ 
            $(this).css({
                'borderColor':'#555',
                'background': 'url('+image_loc+'menuhoverbg.png) 50% 50% repeat-x',
                cursor: 'pointer'
            }); 
        },
        function(){ 
            $(this).css({
                'borderColor':'#111',
                'background': '#000',
                cursor: 'auto'
            }); 
        }
    ).css({
        width: options.width-30,
        height: '',
        padding: '2px',
        margin: '1px',
        border: '1px solid #111',
        '-moz-border-radius': '4px',
        clear: 'left',
        textAlign:'center',
        float: 'left'
    }).end()
    .find('a').css({
        color: '#aaa',
        textDecoration: 'none',
//        float: 'left',
        width: '100%',
        outline: '0',
        textAlign:'center'
    }).end()
    .find('img').css({
//        float: 'left',
        border: '1px solid #333',
        margin: '0 2px'
    }).end()
    .find('.themeName').css({
        float: 'left',
        margin: '3px 0',
        display:'block',
        width:"100%"
    }).end();
    


    $(this).append(button);
    $('body').append(switcherpane);
    switcherpane.hide();
    if( options.useCookie && ($.cookie(options.cookieName) || options.loadTheme) ){
        var themeName = $.cookie(options.cookieName) || options.loadTheme;
        switcherpane.find('a:contains('+ themeName +')').trigger('click');
    }

    return this;
};



	/**
	 * Cookie plugin
	 *
	 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
	 * Dual licensed under the MIT and GPL licenses:
	 * http://www.opensource.org/licenses/mit-license.php
	 * http://www.gnu.org/licenses/gpl.html
	 *
	 */
	jQuery.cookie = function(name, value, options) {
	    if (typeof value != 'undefined') { // name and value given, set cookie
	        
	        options = options || {};
	        
	        if (value === null) {value = '';options.expires = -1;}
	        
	        var expires = '';
	        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
	            var date;
	            if (typeof options.expires == 'number') 
	                date = (new Date()).setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
	            else 
	                date = options.expires;
	            
	            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
	        }
	        // CAUTION: Needed to parenthesize options.path and options.domain
	        // in the following expressions, otherwise they evaluate to undefined
	        // in the packed version for some reason...
	        var path = options.path ? '; path=' + (options.path) : '';
	        var domain = options.domain ? '; domain=' + (options.domain) : '';
	        var secure = options.secure ? '; secure' : '';
	        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
	    } else { // only name given, get cookie
	        var cookieValue = null;
	        if (document.cookie && document.cookie != '') {
	            var cookies = document.cookie.split(';');
	            for (var i = 0; i < cookies.length; i++) {
	                var cookie = jQuery.trim(cookies[i]);
	                // Does this cookie string begin with the name we want?
	                if (cookie.substring(0, name.length + 1) == (name + '=')) {
	                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
	                    break;
	                }
	            }
	        }
	        return cookieValue;
	        
	    }
	};

	$(window).load(function () {
	    if (jQuery.browser.msie && parseInt(jQuery.browser.version, 10) >= 8) {
	        if ($("head link#ui-theme").length == 0) {
	            $("head").append($('<link href="" type="text/css" rel="Stylesheet" id="ui-theme" />'));
	        }
	        $("head link#ui-theme").attr('href', "/samplesbrowser/samplescommon/jQuery/Common/ThemeSwitcher/themes/base/jquery-ui.css");
	    }
	});
