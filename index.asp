<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Comissão</title>

    <!-- Bootstrap CSS FALTANDO -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet" href="./assets/css/styles.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!--#include file="conexao.asp"-->
<%
abre_conexao()
%>
</head>

<body>
<header class="topo">
    <img src="./assets/img/logo.png" alt="Logo" class="logo">

    <div class="acoes">
        <a href="usuario.asp" class="nav-link">
            <button class="cadastrar">usuarios</button>
        </a>
    </div>
</header>

  
<div id="funcionarias">

<%
slqt = "SELECT * FROM usuarios WHERE status = 'ATIVO' ORDER BY nome DESC"
set rsquery = conn.Execute(slqt)

While Not rsquery.eof

    codUser = rsquery("codigo")

    sqlSoma = "SELECT SUM(CAST(REPLACE(valor, ',', '.') AS DECIMAL(10,2))) AS totalSoma " & _
              "FROM vendas WHERE cod_usuario = " & codUser & " AND status = 'SOMA'"
    
    Set rsSoma = conn.Execute(sqlSoma)

    If IsNull(rsSoma("totalSoma")) Then
        totalSoma = 0
    Else
        totalSoma = CDbl(rsSoma("totalSoma"))
    End If

    sqlSub = "SELECT SUM(CAST(REPLACE(valor, ',', '.') AS DECIMAL(10,2))) AS totalSub " & _
             "FROM vendas WHERE cod_usuario = " & codUser & " AND status = 'SUBTRAI'"
    
    Set rsSub = conn.Execute(sqlSub)


    If IsNull(rsSub("totalSub")) Then
        totalSub = 0
    Else
        totalSub = CDbl(rsSub("totalSub"))
    End If


    totalFinal = totalSoma - totalSub
    totalVendas = Replace(FormatNumber(totalFinal, 2), ".", ",")
%>


    <div class="funcionaria">
        <h2><%= rsquery("nome") %></h2>
        <p>Vendas: R$ <span class="vendas"><%= totalVendas %></span></p>

        <button style="cursor: pointer;" class="btn btn-info" data-toggle="modal" data-target="#modal-default-<%response.write rsquery("codigo")%>">Adicionar</button>
        <button style="cursor: pointer;" class="btn btn-info" data-toggle="modal" data-target="#modal-default1-<%response.write rsquery("codigo")%>">Subtrair</button>
        
        <div class="modal fade" id="modal-default1-<%response.write rsquery("codigo")%>">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <form name="subtrair-<%response.write rsquery("codigo")%>" method="post">
                    <input type="hidden" name="cod_usuario" value="<%response.write rsquery("codigo")%>">
                        <div class="modal-header">
                            <h4 class="modal-title w-100 text-left">Subtrair</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row align-items-end">
                                <div class="col-md-8">
                                    <label>Valor</label>
                                    <input type="text"  class="form-control" oninput="formatarvalor(this)" name="diminuir" placeholder="Digite o valor" />
                                </div>
                                <div class="col-md-4 text-right">
                                    <button type="button" class="btn btn-danger mt-4" onclick="subtrairvendas('subtrair-<%response.write rsquery("codigo")%>')"> <i class="fa fa-minus"></i> Subtrair</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal-default-<%response.write rsquery("codigo")%>">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <form name="somar-<%response.write rsquery("codigo")%>" method="post">
                    <input type="hidden" name="cod_usuario" value="<%response.write rsquery("codigo")%>">
                        <div class="modal-header">
                            <h4 class="modal-title w-100 text-left">Somar</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row align-items-end">
                                <div class="col-md-8">
                                    <label>Valor</label>
                                    <input type="text" class="form-control" oninput="formatarvalor(this)" name="aumentar" placeholder="Digite o valor" />
                                </div>
                                <div class="col-md-4 text-right">
                                    <button type="button" class="btn btn-success mt-4" onclick="somarvendas('somar-<%response.write rsquery("codigo")%>');"><i class="fa fa-plus"></i> Somar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<%
rsquery.movenext
Wend
%>

</div>

    
    <div class="lista" Ver Histórico>
        <table>
            <thead>
                <tr>
                    <th>COD</th>
                    <th>NOME</th>
                    <th>valor</th>
                    <th>Tipo De Opereçao</th>
                    <th>DATA</th>
                    <th><button onclick="limparhistorico();" class="btn btn-info limpar">limpar</button></th>

                </tr>
            </thead>
            <tbody>
                <% 
                sqlstmt= "SELECT V.codigo, V.valor, V.status, V.data, V.hora, U.nome"
                sqlstmt = sqlstmt & " FROM vendas V "
                sqlstmt = sqlstmt & " LEFT JOIN usuarios U on V.cod_usuario = U.codigo where U.status = 'ATIVO'"
                sqlstmt = sqlstmt & " ORDER BY concat(mid(V.data,7,4),mid(V.data,4,2),mid(V.data,1,2)) desc, V.hora desc"

                set rsquery=conn.execute(sqlstmt)
                
                while not rsquery.eof 
                %>
                <tr>
                    <td><%response.write rsquery("codigo")%></td>
                    <td><%response.write rsquery("nome")%></td>
                    <td><%response.write rsquery("valor")%></td>
                    <td><%response.write rsquery("status")%></td>
                    <td><%response.write rsquery("data")%>-<%response.write rsquery("hora")%></td>

                </tr>
                <%
                rsquery.movenext
                Response.Flush 
                Response.clear 
                wend 
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="./js/common.js"></script>
    <script src="./js/script.js"></script>

</body>
</html>
