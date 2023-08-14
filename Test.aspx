<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script src="ig_ui/js/infragistics.js" type="text/javascript"></script>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
  <title>jQueryUI Dialog Demo (alert)</title> 
  <script type="text/javascript">
      function fnRandom(iModifier)
      {
          return parseInt(Math.random() * iModifier);
      }

      function fnSetValues()
      {
          var iHeight = oForm.oHeight.options[oForm.oHeight.selectedIndex].text;

          if (iHeight.indexOf("Random") > -1) { iHeight = fnRandom(document.body.clientHeight); }
          var sFeatures = "dialogHeight: " + iHeight + "px;";
          return sFeatures;
      }

      function fnOpen()
      {
          var sFeatures = fnSetValues();
          window.showModalDialog("loguser.aspx", "", sFeatures)
      }

      var oPopup = window.createPopup();

      function window_onload() {
          var oPopupBody = oPopup.document.body;
          oPopupBody.style.backgroundColor = "WhiteSmoke";
          oPopupBody.style.border = "solid black 1px";
          oPopupBody.innerHTML = "SOFTLUTION <b>html</b> here.";
          oPopup.show(0, 0, 400, 400, document.body);
      }
    </script>

    <link href="ig_ui/themes/base/ig.ui.min.css" rel="stylesheet" type="text/css" />
	<link href="ig_ui/themes/min/ig/jquery.ui.custom.min.css" rel="stylesheet" type="text/css" />
	
	<script src="ig_ui/scripts/jquery.min.js" type="text/javascript"></script>
	<script src="ig_ui/scripts/jquery-ui.min.js" type="text/javascript"></script>
	<script src="ig_ui/js/combined/min/ig.ui.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(window).load(function () {
            $("#player1").igVideoPlayer({
                sources: [
					"http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.h264.mp4",
					"http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.webmvp8.webm",
					"http://dl.infragistics.com/pg/2011-1/web/shared/videoplayer/videos/Infragistics_Presentation_lowRes_1.theora.ogv"
					],
                width: 720,
                height: 270,
                fullscreen: false,
                browserControls: false,
                autoplay: false,
                title: 'Title',
                muted: false,
                autohide: true
            })
        });
	
	</script>
</head>
<body onload="window_onload();">
    <form id="form1" runat="server">
	Dialog Height 
      <select name="oHeight">
        <option>-- Random --</option>
        <option>150</option>
        <option>200</option>
        <option>250</option>
        <option>300</option>
      </select> 
	    Create Modal Dialog Box
      <input type="button" value="Push To Create" onclick="fnOpen()">
    <div>
        <ig:WebVideoPlayer ID="WebVideoPlayer1" runat="server">
        <Sources>
            <ig:VideoPlayerSource Source="./videos/Ventas_AtenderAlCliente.mp4" />
            <ig:VideoPlayerSource Source="./videos/crm_actitud.mp4" />
            <ig:VideoPlayerSource Source="./Naturaleza.wmv" />
        </Sources>
        </ig:WebVideoPlayer>
    </div>
        <telerik:RadListBox ID="RadListBox1" runat="server">
        </telerik:RadListBox>
    </form>
    </body>
</html>
