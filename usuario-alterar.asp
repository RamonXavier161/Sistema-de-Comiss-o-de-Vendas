<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="conexao.asp" -->
<!--#INCLUDE file="alert.asp" -->
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HFB  WEB  | Prescrição Incluir</title>

</head>
<body class=" <% response.Write(environment) %> hold-transition sidebar-mini">
<div class="wrapper">
<%
	abre_conexao()

	codigo = request("codigo")
	statu = request("status")


    sqlstmt = "UPDATE usuarios SET status= '" & statu & "' "
    sqlstmt = sqlstmt & " WHERE codigo= " & codigo
	response.write sqlstmt & "<br>"
	set rsquery = conn.execute(sqlstmt)
	
	AndGoTo "usuario.asp"	


fecha_conexao()
%>
</body>
</html>