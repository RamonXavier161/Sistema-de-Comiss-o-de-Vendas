let historico = [];
let vendas = [];

// Carrega o histórico e valores de vendas do localStorage, se existirem
if (localStorage.getItem('historico')) {
    historico = JSON.parse(localStorage.getItem('historico'));
}

if (localStorage.getItem('vendas')) {
    vendas = JSON.parse(localStorage.getItem('vendas'));
    vendas.forEach((valor, index) => {
        document.querySelectorAll('.vendas')[index].textContent = valor;
    });
}

document.querySelectorAll('.adicionar').forEach((btn, index) => {
    btn.addEventListener('click', () => {
        var valor = prompt("Digite o valor a adicionar:");
        if (valor && !isNaN(valor)) {
            var vendasElem = document.querySelectorAll('.vendas')[index];
            let novoValor = parseFloat(vendasElem.textContent) + parseFloat(valor);
            vendasElem.textContent = novoValor;

            // Atualiza o array de vendas
            vendas[index] = novoValor;

            // Adiciona ao histórico
            let horario = new Date().toLocaleString();
            let nomeFuncionario = document.querySelectorAll('.funcionaria h2')[index].textContent;
            historico.push(`${nomeFuncionario} vendeu R$ ${valor} em ${horario}.`);

            // Salva o histórico e vendas no localStorage
            localStorage.setItem('historico', JSON.stringify(historico));
            localStorage.setItem('vendas', JSON.stringify(vendas));
        }
    });
});

document.querySelectorAll('.subtrair').forEach((btn, index) => {
    btn.addEventListener('click', () => {
        var valor = prompt("Digite o valor a subtrair:");
        if (valor && !isNaN(valor)) {
            var vendasElem = document.querySelectorAll('.vendas')[index];
            let novoValor = parseFloat(vendasElem.textContent) - parseFloat(valor);
            vendasElem.textContent = novoValor;

            // Atualiza o array de vendas
            vendas[index] = novoValor;

            // Adiciona ao histórico
            let horario = new Date().toLocaleString();
            let nomeFuncionario = document.querySelectorAll('.funcionaria h2')[index].textContent;
            historico.push(`${nomeFuncionario} subtraiu R$ ${valor} em ${horario}.`);

            // Salva o histórico e vendas no localStorage
            localStorage.setItem('historico', JSON.stringify(historico));
            localStorage.setItem('vendas', JSON.stringify(vendas));
        }
    });
});

document.getElementById('ver-historico').addEventListener('click', () => {
    let listaHistorico = document.getElementById('lista-historico');
    listaHistorico.innerHTML = "";

    historico.forEach(item => {
        let li = document.createElement('li');
        li.textContent = item;
        listaHistorico.appendChild(li);
    });

    // Mostra o histórico
    document.getElementById('historico').style.display = 'block';
});
