<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Comissão</title>
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!--#include file="conexao.asp"-->
<%
abre_conexao()
%>
</head>
<body>
    <header>
        <a href="index.asp" class="nav-link">
           <img src="./assets/img/logo.png" alt="Logo">
        </a>
    </header>
    <div>
        <form name="form" method="post">
            <div >
                <label for="nome">NOME</label><br>
                <input id="nome" type="text" class="rcbfocus form-control" placeholder="Digite o nome do colaborador" name="nome" required/>
            <div >
                <button type="button" onclick="lancarUsuario();">Incluir</button>
            </div>
        </form>
    </div>
    <div class="lista">
        <table>
            <thead>
                <tr>
                    <th>COD</th>
                    <th>NOME</th>
                    <th>DETALHES</th>
                </tr>
            </thead>
            <tbody>
                <% 
                sqlstmt= "SELECT * FROM usuarios "
                set rsquery=conn.execute(sqlstmt)
                
                while not rsquery.eof 

                if rsquery("status") = "ATIVO" then
                    cor = "green"
                    statu = "INATIVO"
                else
                    cor = "red"
                    statu = "ATIVO"
                end if
                %>
                <tr>
                    <td><%response.write rsquery("codigo")%></td>
                    <td><%response.write rsquery("nome")%></td>
                    <td>
                        <a href="usuario-alterar.asp?codigo=<%response.write rsquery("codigo")%>&status=<%response.write statu%>" style="color:<%response.write cor%>;"><i class="fas fa-circle"></i></a>
                    </td>
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
