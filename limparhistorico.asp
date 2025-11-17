<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#INCLUDE file="conexao.asp" -->
<!--#INCLUDE file="alert.asp" -->


<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="dist/css/hfb.css">
<title>HFB WEB | Prescrição Incluir</title>
</head>
<body >
<div class="wrapper">
    <%
    abre_conexao()

    sqlstmt = "TRUNCATE TABLE vendas"

    conn.execute(sqlstmt)


    AndGoTo "index.asp"
    %>
</body>
</html>