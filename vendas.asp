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
    pega_data()

    aumentar = request.form("aumentar")
    diminuir = request.form("diminuir")
    cod_usuario = request.form("cod_usuario")

    aumentar = Replace(aumentar, ".", "") 
    diminuir = Replace(diminuir, ".", "") 
    
    aumentar = Replace(aumentar, ",", ".")
    diminuir = Replace(diminuir, ",", ".")
    
    if aumentar <> "" and aumentar <> "0" then

    Tipo_Operecao = "SOMA"

    sqlstmt = "insert into vendas (cod_usuario, valor, data, hora, status ) values ('" & cod_usuario & "', '" & aumentar & "', '" & wDataAtual & "', '" & wHoraAtual & "', '" & Tipo_Operecao & "' )"
        'response.write sqlstmt
    else    

    Tipo_Operecao = "SUBTRAI"

    sqlstmt = "insert into vendas (cod_usuario, valor, data, hora, status ) values ('" & cod_usuario & "', '" & diminuir & "', '" & wDataAtual & "', '" & wHoraAtual & "', '" & Tipo_Operecao & "' )"
    'response.write sqlstmt
    end if


        conn.Execute sqlstmt

        AndGoTo "index.asp"
	

	' Fechar conexão com o banco de dados
    fecha_conexao()
%>
</body>
</html>