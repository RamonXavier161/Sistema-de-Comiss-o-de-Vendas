<%
    sub showAlert(message)
        response.Write("<script>")
        response.Write("window.alert ('" & message & "');")
        response.Write("</script>")
    end sub

    sub showAlertAndGoTo(message, locationHref)
        response.Write("<script>")
        response.Write("window.alert ('" & message & "');")
        response.Write("window.location.href='" & locationHref & "';")
        response.Write("</script>")
    end sub

    sub AndGoTo(locationHref)
        response.Write("<script>")
        response.Write("window.location.href='" & locationHref & "';")
        response.Write("</script>")
    end sub

    sub showAlertAndReturn(message)
        response.Write("<script>")
        response.Write("window.alert ('" & message & "');")
		response.Write("window.history.go(-1);")
        response.Write("</script>")
    end sub

    sub showAlertWithoutScriptTagAndGoTo(message, locationHref, includeTag)
        ' Verifica se includeTag foi passado, caso contrário, define como True
        if IsMissing(includeTag) then
            includeTag = True
        end if

        if includeTag = True then
            response.Write("<script>")
        end if
        response.Write("window.alert ('" & message & "');")
        response.Write("window.location.href='" & locationHref & "';")
        if includeTag = True then
            response.Write("</script>")
        end if
    end sub

    Sub showSweetAlert(icon, title, text, timer)
        ' Gera o código JavaScript para exibir um alerta SweetAlert2
        Response.Write("<script>")
        Response.Write("Swal.fire({")
        Response.Write("  icon: '" & icon & "',")
        Response.Write("  title: '" & title & "',")
        Response.Write("  text: '" & text & "',")
        Response.Write("  showConfirmButton: false,")
        Response.Write("  timer: " & timer) ' Fecha automaticamente após o tempo especificado
        Response.Write("});")
        Response.Write("</script>")
    End Sub
%>