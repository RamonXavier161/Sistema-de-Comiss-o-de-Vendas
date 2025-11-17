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
    ' Abrir conexão com o banco de dados
    abre_conexao()

    nome = request.form("nome")

    statu = "ATIVO"

        sqlstmt = "insert into usuarios (status, nome) values ('" & statu & "','" & nome & "')"
        conn.Execute sqlstmt

        AndGoTo "usuario.asp"
	

	' Fechar conexão com o banco de dados
    fecha_conexao()
%>
</body>
</html>