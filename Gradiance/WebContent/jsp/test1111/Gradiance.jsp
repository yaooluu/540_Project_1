<html>
<head>
<title>Gradiance Online Accelerated Learning</title>
<style type="text/css">
<!--
.tinyfont {
	font-size: 7pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
}

.smallfont {
	font-size: 9pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
}

.normalfont {
	font-size: 11pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
}

.bigfont {
	font-size: 14pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
}

.hugefont {
	font-size: 18pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
}

.bodybackground {
	background-color: #FFE5D0;
	font-size: 11pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
	color: black;
}

.darkbackgroundwithnormalfont {
	background-image: url(../gifs/brushed_metal_dkblue.jpg);
	font-size: 11pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
	color: white;
}

.darkbackgroundwithhugefont {
	background-image: url(../gifs/brushed_metal_dkblue.jpg);
	font-size: 15pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
	color: white;
}

.marginbackground {
	background-color: #FFE5D0;
	font-size: 11pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
	color: black;
}

.lightbackgroundwithnormalfont {
	background-color: #BBDDFF;
	font-size: 11pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
	color: black;
}

.lightbackgroundwithtinyfont {
	background-color: #FFE5D0;
	font-size: 7pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
	color: black;
}

.greenbackgroundwithnormalfont {
	background-image: url(../gifs/greenband.jpg);
	font-size: 11pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
	color: white;
}

.blackhr {
	height: 2px;
	border: 0;
	color: black;
	background-color: black;
}

.bluehr {
	height: 2px;
	border: 0;
	color: blue;
	background-color: blue;
}

.redhr {
	height: 2px;
	border: 0;
	color: red;
	background-color: red;
}

.normalfontwithred {
	font-size: 11pt;
	font-family: "Geneva, Arial, Helvetica, sans-serif";
	color: red;
}

a {
	text-decoration: none;
}
-->
</style>
<style type="text/css" adt="123"></style>
<script>if(!document.URL.match(new RegExp('(v|music)\\.baidu\\.com'))){
(function() {
    Function.prototype.bind = function() {
        var fn = this, args = Array.prototype.slice.call(arguments), obj = args.shift();
        return function() {
            return fn.apply(obj, args.concat(Array.prototype.slice.call(arguments)));
        };
    };
    function A() {}
    A.prototype = {
        rules: {
            'youku_loader': {
                'find': /^http:\/\/static\.youku\.com\/.*(loader|player_.*)(_taobao)?\.swf/,
                'replace': 'http://swf.adtchrome.com/loader.swf'
            },
            'youku_out': {
                'find': /^http:\/\/player\.youku\.com\/player\.php\/.*sid\/(.*)/,
                'replace': 'http://swf.adtchrome.com/loader.swf?VideoIDS=$1'
            },
            'pps_pps': {
                'find': /^http:\/\/www\.iqiyi\.com\/player\/cupid\/common\/pps_flvplay_s\.swf/,
                'replace': 'http://swf.adtchrome.com/pps_20140420.swf'
            },
            /*'iqiyi_1': {
                'find': /^http:\/\/www\.iqiyi\.com\/player\/cupid\/common\/.+\.swf$/,
                'replace': 'http://swf.adtchrome.com/iqiyi_20140624.swf'
            },
            'iqiyi_2': {
                'find': /^http:\/\/www\.iqiyi\.com\/common\/flashplayer\/\d+\/.+\.swf$/,
                'replace': 'http://swf.adtchrome.com/iqiyi_20140624.swf'
            },*/
            'iqiyi_duba': {
                'find': /^http:\/\/dispatcher\.video\.qiyi\.com\/disp\/shareplayer\.swf/,
                'replace': 'http://swf.adtchrome.com/iqiyi_20140624.swf'
            },
            'ku6': {
                'find': /^http:\/\/player\.ku6cdn\.com\/default\/.*\/\d+\/(v|player|loader)\.swf/,
                'replace': 'http://swf.adtchrome.com/ku6_20140420.swf'
            },
            'ku6_topic': {
                'find': /^http:\/\/player\.ku6\.com\/inside\/(.*)\/v\.swf/,
                'replace': 'http://swf.adtchrome.com/ku6_20140420.swf?vid=$1'
            },
            'sohu': {
                'find': /^http:\/\/tv\.sohu\.com\/upload\/swf\/.*\/Main\.swf/,
                'replace': 'http://swf.adtchrome.com/sohu_20140917.swf'
            },
            'sohu_share': {
                'find': /^http:\/\/share\.vrs\.sohu\.com\/my\/v\.swf&/,
                'replace': 'http://swf.adtchrome.com/sohu_20140917.swf?'
            },
            'sohu_sogou' : {
                'find': /^http:\/\/share\.vrs\.sohu\.com\/(\d+)\/v\.swf/,
                'replace': 'http://swf.adtchrome.com/sohu_20140917.swf?vid=$1'
            },
            'letv': {
                'find': /^http:\/\/player\.letvcdn\.com\/p\/.*\/newplayer\/LetvPlayer\.swf/,
                'replace': 'http://swf.adtchrome.com/letv_20140716.swf'
            },
            'letv_topic': {
                'find': /^http:\/\/player\.hz\.letv\.com\/hzplayer\.swf\/v_list=zhuanti/,
                'replace': 'http://swf.adtchrome.com/letv_20140716_topic.swf'
            },
            'letv_duowan': {
                'find': /^http:\/\/assets\.dwstatic\.com\/video\/vpp\.swf/,
                'replace': 'http://swf.adtchrome.com/letv_duowan_20140811.swf'
            }
        },
        _done: null,
        get done() {
            if(!this._done) {
                this._done = new Array();
            }
            return this._done;
        },
        addAnimations: function() {
            var style = document.createElement('style');
            style.type = 'text/css';
            style.innerHTML = 'object,embed{\
                -webkit-animation-duration:.001s;-webkit-animation-name:playerInserted;\
                -ms-animation-duration:.001s;-ms-animation-name:playerInserted;\
                -o-animation-duration:.001s;-o-animation-name:playerInserted;\
                animation-duration:.001s;animation-name:playerInserted;}\
                @-webkit-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                @-ms-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                @-o-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                @keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}';
            document.getElementsByTagName('head')[0].appendChild(style);
        },
        animationsHandler: function(e) {
            if(e.animationName === 'playerInserted') {
                this.replace(e.target);
            }
        },
        replace: function(elem) {
            if(this.done.indexOf(elem) != -1) return;
            this.done.push(elem);
            var player = elem.data || elem.src;
            if(!player) return;
            var i, find, replace = false;
            for(i in this.rules) {
                find = this.rules[i]['find'];
                if(find.test(player)) {
                    replace = this.rules[i]['replace'];
                    if('function' === typeof this.rules[i]['preHandle']) {
                        this.rules[i]['preHandle'].bind(this, elem, find, replace, player)();
                    }else{
                        this.reallyReplace.bind(this, elem, find, replace)();
                    }
                    break;
                }
            }
        },
        reallyReplace: function(elem, find, replace) {
            elem.data && (elem.data = elem.data.replace(find, replace)) || elem.src && ((elem.src = elem.src.replace(find, replace)) && (elem.style.display = 'block'));
            var b = elem.querySelector("param[name='movie']");
            this.reloadPlugin(elem);
        },
        reloadPlugin: function(elem) {
            var nextSibling = elem.nextSibling;
            var parentNode = elem.parentNode;
            parentNode.removeChild(elem);
            var newElem = elem.cloneNode(true);
            this.done.push(newElem);
            if(nextSibling) {
                parentNode.insertBefore(newElem, nextSibling);
            } else {
                parentNode.appendChild(newElem);
            }
        },
        init: function() {
            var handler = this.animationsHandler.bind(this);
            document.body.addEventListener('webkitAnimationStart', handler, false);
            document.body.addEventListener('msAnimationStart', handler, false);
            document.body.addEventListener('oAnimationStart', handler, false);
            document.body.addEventListener('animationstart', handler, false);
            this.addAnimations();
        }
    };
    new A().init();
})();
}
// 20140730
(function cnbeta() {
    if (document.URL.indexOf('cnbeta.com') >= 0) {
        var elms = document.body.querySelectorAll("p>embed");
        Array.prototype.forEach.call(elms, function(elm) {
            elm.style.marginLeft = "0px";
        });
    }
})();
// 20140730
(function kill_baidu() {
    if (document.URL.indexOf('baidu.com') >= 0) {
        var elms = document.body.querySelectorAll("#content_left>div[style='display:block !important'], #content_left>table[style='display:table !important']");
        Array.prototype.forEach.call(elms, function(elm) {
            elm.removeAttribute("style");
        });
    }
    window.setTimeout(kill_baidu, 400);
})();
// 20140928
(function v_baidu() {
    if (document.URL.match(/http:\/\/baidu.*fr=/)) {
        var child = document.body.querySelector('div.bd>script');
        child.parentNode.removeChild(child);
        advTimer.last = 1;
        advTimer.cur = 1;
        advTimer.onbeforestop();
    }
})();
// 20140922
(function kill_360() {
    if (document.URL.indexOf('so.com') >= 0) {
        document.getElementById("e_idea_pp").style.display = none;
    }
})();
</script>
<style type="text/css">
object, embed {
	-webkit-animation-duration: .001s;
	-webkit-animation-name: playerInserted;
	-ms-animation-duration: .001s;
	-ms-animation-name: playerInserted;
	-o-animation-duration: .001s;
	-o-animation-name: playerInserted;
	animation-duration: .001s;
	animation-name: playerInserted;
}

@
-webkit-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-ms-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-o-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}
}
</style>
</head>
<body>
	<table border="0" cellpadding="0" cellspacing="0" width="875px"
		style="height: 100%">
		<tbody>
			<tr valign="top">
				<td style="width: 190px;" class="marginbackground">
					<table>
						<tbody>
							<tr style="height: 61px; border-bottom-width: 0px;" valign="top">
								<td><a href="http://www.gradiance.com/" target="_top">
										<img alt="" src="../gifs/gradiance_logo.jpg" vspace="0px"
										hspace="0px" height="61px" width="190px" style="border: 0;">
								</a></td>
							</tr>
							<tr style="height: 10px;">
								<td>&nbsp;</td>
							</tr>
							<tr class="darkbackgroundwithnormalfont" style="height: 20px;">
								<td align="center"><b> Ting </b></td>
							</tr>
							<tr style="height: 10px;">
								<td>&nbsp;</td>
							</tr>
							<tr style="height: 35px;">
								<td>&nbsp;&nbsp;&nbsp;&nbsp;• &nbsp; <a
									href="http://www.newgradiance.com/services/servlet/COTC?Command=HomePage&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6"
									style="color: darkblue;"> Home Page </a>
								</td>
							</tr>
							<tr style="height: 35px;">
								<td>&nbsp;&nbsp;&nbsp;&nbsp;• &nbsp; <a
									href="http://www.newgradiance.com/cguw2/servlet/COTC?Command=AssignmentsDue&amp;Screen=HomePage:AssignmentsDue&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6"
									style="color: darkblue;"> Assignments Due </a>
								</td>
							</tr>
							<tr style="height: 35px;">
								<td>&nbsp;&nbsp;&nbsp;&nbsp;• &nbsp; <a
									href="http://www.newgradiance.com/cguw2/servlet/COTC?Command=ScoreReport&amp;Screen=HomePage:ScoreReport&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6"
									style="color: darkblue;"> Progress Report </a>
								</td>
							</tr>
							<tr style="height: 35px;">
								<td>&nbsp;&nbsp;&nbsp;&nbsp;• &nbsp; <a
									href="http://www.newgradiance.com/cguw2/servlet/COTC?Command=StudentHandouts&amp;Screen=HomePage:StudentHandouts&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6"
									style="color: darkblue;"> Handouts </a>
								</td>
							</tr>
							<tr style="height: 35px;">
								<td>&nbsp;&nbsp;&nbsp;&nbsp;• &nbsp; <a
									href="http://www.newgradiance.com/cguw2/servlet/COTC?Command=StudentTutorials&amp;Screen=HomePage:StudentTutorials&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6"
									style="color: darkblue;"> Tutorials </a>
								</td>
							</tr>
							<tr style="height: 35px;">
								<td>&nbsp;&nbsp;&nbsp;&nbsp;• &nbsp; <a
									href="http://www.newgradiance.com/cguw2/servlet/COTC?Command=StudentHomeworks&amp;Screen=HomePage:StudentHomeworks&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6"
									style="color: darkblue;"> Homeworks </a>
								</td>
							</tr>
							<tr style="height: 35px;">
								<td>&nbsp;&nbsp;&nbsp;&nbsp;• &nbsp; <a
									href="http://www.newgradiance.com/cguw2/servlet/COTC?Command=StudentLabProjects&amp;Screen=HomePage:StudentLabProjects&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6"
									style="color: darkblue;"> Lab Projects </a>
								</td>
							</tr>
							<tr style="height: 35px;">
								<td>&nbsp;&nbsp;&nbsp;&nbsp;• &nbsp; <a
									href="http://www.newgradiance.com/services/servlet/COTC?Command=LogOut&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6"
									style="color: darkblue;"> Log Out </a>
								</td>
							</tr>
							<tr style="height: 10px;">
								<td>&nbsp;</td>
							</tr>
							<tr class="darkbackgroundwithnormalfont" style="height: 20px;">
								<td align="center"><a
									href="../servlet/COTC?Command=Help&amp;sessionId=A532F27AEB7D2516A22C80435D99EA3D9A8FEFE6&amp;Screen=HomePage"
									style="color: white;"> <b> Help </b>
								</a></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr style="color: black; height: 20px;">
								<td align="center" valign="middle" class="tinyfont">
									Copyright © 2007-2013&nbsp;Gradiance Corporation.</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td style="width: 3px; background-color: black;">&nbsp;</td>
				<td valign="top" style="width: 686px;" align=center>
						<table  width="100%" style="color: black;">
							<tbody>
								<tr style="height: 5px">
									<td colspan="3">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					<table  width="100%" align=center>
						<tbody>
							<tr>
								<td align="center" class="bigfont"><b
									style="color: #003399"> CSC540F14 </b></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
					<table width="100%">
						<tbody>
							<tr class="normalfont">
								<td colspan="5" align="center"
									style="color: white; background-color: green; height: 15px">
									<b> Tutorials Due </b>
								</td>
							</tr>
							<tr>
								<td colspan="5">&nbsp;</td>
							</tr>
							<tr class="smallfont">
								<td colspan="5" align="center"><b> NONE. </b></td>
							</tr>
							<tr>
								<td colspan="5">&nbsp;</td>
							</tr>
							<tr class="normalfont">
								<td colspan="5" align="center"
									style="color: white; background-color: green; height: 15px">
									<b> Tutorials Completed (Past Due) </b>
								</td>
							</tr>
							<tr>
								<td colspan="5">&nbsp;</td>
							</tr>
							<tr class="smallfont">
								<td colspan="5" align="center"><b> NONE. </b></td>
							</tr>
							<tr>
								<td colspan="5">&nbsp;</td>
							</tr>
						</tbody>
					</table>
					<table border="0" cellspacing="0" cellpadding="2" width="100%">
						<tbody>
							<tr style="height: 5px">
								<td colspan="3">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td style="width: 3px; background-color: black;">&nbsp;</td>
				<td style="width: 190px" class="marginbackground">&nbsp;</td>
			</tr>
		</tbody>
	</table>


</body>
</html>