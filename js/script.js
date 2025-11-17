  function lancarUsuario() 
{
    const form = document.forms['form'];
			if (!form.checkValidity()) {
				form.reportValidity(); 
				return; 
			}

		showConfirmation({ 
			confirmText: "OK", 
			cancelText: "Cancelar", 
			confirmColor: "#28a745",
			title: "Confirmação", 
			width: '500',
			html: "Deseja incluir este usuario? Esta operação é irreversível.", 
			onConfirm: () => { 
								form.action = "usuario-incluir-grava.asp"; 
								form.submit(); 
							},
			onCancel: () => {} 
		});
}


function somarvendas(formName) // Recebe o nome dinâmico do formulário
{
// 1. Usa o nome dinâmico para buscar o formulário correto
const form = document.forms[formName]; 
    if (!form.checkValidity()) {
        form.reportValidity(); 
        return; 
    }

showConfirmation({ 
    confirmText: "OK", 
    cancelText: "Cancelar", 
    confirmColor: "#28a745",
    title: "CONFIRMAÇÃO", 
    width: '500',
    html: "Confirma a inserção desse valor? Essa operação é irreversível.", 
    onConfirm: () => { 
                        form.action = "vendas.asp"; 
                        form.submit(); 
                    },
    onCancel: () => {} 
});

}


function subtrairvendas(formName) // Recebe o nome dinâmico do formulário
{
// 1. Usa o nome dinâmico para buscar o formulário correto
const form = document.forms[formName]; 
    if (!form.checkValidity()) {
        form.reportValidity(); 
        return; 
    }

showConfirmation({ 
    confirmText: "OK", 
    cancelText: "Cancelar", 
    confirmColor: "#28a745",
    title: "CONFIRMAÇÃO", 
    width: '500',
    html: "Confirma a subtração desse valor?Essa operação é irreversível.", 
    onConfirm: () => { 
                        form.action = "vendas.asp"; 
                        form.submit(); 
                    },
    onCancel: () => {} 
});

}



function limparhistorico() 
{

showConfirmation({ 
    confirmText: "OK", 
    cancelText: "Cancelar", 
    confirmColor: "#28a745",
    title: "CONFIRMAÇÃO", 
    width: '500',
    html: "Deseja limpar o histórico de vendas? Essa operação é irreversível.", 
    onConfirm: () => { 
                     window.location.href = "limparhistorico.asp";
                    },
    onCancel: () => {} 
});

}

function formatarvalor(campo) {
    let valorLimpo = campo.value.replace(/[^0-9,.]/g, "");
    
    campo.value = valorLimpo;
}