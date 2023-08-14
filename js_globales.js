txt = [ "->      [ wilson.pauta@yahoo.com ]",
        "->      [ Dirección, Diseño y Desarrollo WEB: WILSON PAUTA ]",
	"->      [ ERP SoftLution ]",
	"->      [ K-SYSTEM ]" ];

var cnt = -1;
				   
function mensaje ()
{
	if (cnt < 2)
		cnt = cnt + 1;
	else
		cnt = 0;
		
	window.status = txt[cnt];
	setTimeout ("mensaje()", 3000);
}


function alinear (obj, ali)
{
	document.all[obj].style.textAlign = ali;
}


function enfoque (obj)
{
	document.all[obj].focus ();
}


function WFull ()
{
	_guivasa = open('logon.aspx','WinGuivasa','fullscreen=yes,scrollbars=no','bReplace=true');
}


function W800x600 (pTxt)
{
	switch (pTxt)
	{
		case 'LogOn':
			_guivasa = open('logon.aspx','WinGuivasa','toolbar=no,directories=no,menubar=no,status=yes,scrollbars=yes,width=790,height=512,resizable=yes,top=0,left=0','bReplace=true');
			break;	
		case 'System':
			_guivasa = open('sistema.htm','WinGuivasa','toolbar=no,directories=no,menubar=no,status=yes,scrollbars=yes,width=790,height=512,resizable=yes,top=0,left=0','bReplace=true');
			break;
	}
}

function W800x600_ (pVent)
{
switch (pVent)
	{
		case 'G':
			_rocio = open('www.google.com.ec/advanced_search?hl=es','WinRocio','toolbar=no,directories=no,menubar=no,status=yes,scrollbars=yes,width=790,height=512,resizable=yes,top=0,left=0','bReplace=true');
			break;	
		case 'A':
			_rocio = open('sistema.htm','WinRocio','toolbar=no,directories=no,menubar=no,status=yes,scrollbars=yes,width=790,height=512,resizable=yes,top=0,left=0','bReplace=true');
			break;
	}
}




/*
'Especificamos el servidor SMPT del correo y creamos el objeto
strHost = "smtp.midominio.com"
'debes especificar el servidor enviante no el entrante el entrante (pop)
Set Mail = Server.CreateObject("Persits.MailSender")
Mail.Host = strHost
Mail.From = "Tu nombre"
Mail.FromName = "Nombre del que le enviaras el mail"
Mail.AddAddress "E-mail de el que le enviaras el mail"
Mail.Subject = "Asunto"
Mail.IsHTML = True
Mail.Body = "Cuerpo del mensaje..."
strErr = ""
bSuccess = False
On Error Resume Next 'por si hay errores
Mail.Send ' send message
If Err &lt;&gt; 0 Then ' si hay un error que de una descripcion
	strErr = Err.Description
else
	bSuccess = True
End If
*/