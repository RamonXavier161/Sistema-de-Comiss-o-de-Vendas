
<%
Dim conn
Dim wDataAtual, wHoraAtual, wHoraAtualCompleta, wDataAtualInvertida, wIPAtual

function abre_conexao()


set conn = server.createobject("adodb.connection") 
	conn.Open "Driver={MySQL ODBC 8.4 ANSI Driver};" & _
          "Server=localhost;" & _
          "Database=vendas;" & _
          "User=seu usuario aqui;" & _
          "Password= sua senha aqui;" 

Conn.CommandTimeout = 2000

end function


function fecha_conexao()
Conn.close
set Conn = nothing
end function


sub pega_data()
	Data = Now()
	Hora = Hour(Data)
	Hora = Right("0" & Hora, 2)
	Min = Minute(Data)
	Min = Right("0" & Min, 2)
	wHoraAtual = Hora & ":" & Min
	Segundo = Second(Data)
	wHoraAtualCompleta = Hora & ":" & Min & ":" & Segundo

	sData = Date()
	sData = Split(sData, "/", -1, 1)
	sData(0) = Right("0" & sData(0), 2)
	sData(1) = Right("0" & sData(1), 2)
	wDataAtual = sData(0) & "/" & sData(1) & "/" & sData(2)
	wDataAtualInvertida = sData(2) & "/" & sData(1)& "/" & sData(0)
	
	wIPAtual=Request.ServerVariables("REMOTE_ADDR")
end sub	


%>