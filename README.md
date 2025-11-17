uma **solução de rastreamento de vendas** focada em **motivar e recompensar vendedores** em um ambiente de loja, utilizando tecnologias clássicas e componentes de interface modernos.

Com base na sua descrição e nos trechos de código, preparei um **template de README** detalhado para o seu projeto, incluindo uma descrição clara e a seção de tecnologias.

-----

## 🏆 Contador de Vendas | Desafio do Vendedor

### 📄 Descrição do Projeto

Este projeto é um sistema web desenvolvido para suprir a necessidade de lojas ou equipes de vendas de **rastrear e contabilizar as vendas** realizadas por cada funcionário em um determinado período. O objetivo principal é automatizar o cálculo e a identificação do **maior vendedor do dia/período**, facilitando a gestão da **comissão** ou a atribuição de **recompensas**.

A aplicação fornece uma interface simples para registrar novos funcionários, acompanhar o histórico de vendas (com a data e hora do registro) e realizar a inserção/subtração dos valores de venda de cada colaborador ativo.

### ✨ Funcionalidades Principais

  * **Cadastro de Usuários:** Permite registrar novos funcionários no sistema.
  * **Gestão de Ativação:** É possível definir quais funcionários estão **ativos** e participando da contagem de vendas.
  * **Registro de Vendas:** Lançamento simples e rápido do valor da venda por funcionário.
  * **Consulta de Histórico:** Lista detalhada de todas as vendas registradas (funcionário, valor, data e hora).
  * **Limpeza de Histórico:** Função para zerar o histórico de vendas e iniciar um novo período de competição/contagem.
  * **Notificações Interativas:** Uso de **SweetAlert2** e **Toastr** para confirmações e alertas visuais antes de operações irreversíveis.

-----

## 🛠️ Tecnologias Utilizadas

Este projeto utiliza uma pilha de tecnologias **Clássicas (Legacy)** para o *backend* e *frameworks* modernos para uma melhor experiência do usuário (UX) no *frontend*.

| Categoria | Tecnologia | Uso no Projeto |
| :--- | :--- | :--- |
| **Backend / Lógica** | **ASP Classic (Active Server Pages)** | Lógica de programação, processamento de formulários (`Request`), manipulação de dados e conexão com o banco de dados. |
| **Banco de Dados** | **MySQL** | Armazenamento de dados de funcionários e de todas as transações (vendas). |
| **Conectividade** | **MySQL ODBC 8.4 ANSI Driver** | *Driver* de conexão entre a aplicação ASP Classic e o banco de dados MySQL. |
| **Frontend / Estilo** | **CSS (AdminLTE 3)** | Estilização da interface de usuário, proporcionando um *design* responsivo e painel de administração moderno. |
| **Frontend / Interação** | **JavaScript** | Funções de validação de formulários, controle de eventos (cliques), e a lógica para exibir notificações e popups. |
| **Notificações** | **Toastr** | Exibir **Notificações de Página** no canto superior (*toasts*). |
| **Popups e Alertas** | **SweetAlert2** | Exibir **Popups Modais** de confirmação e informação de forma estilizada (substituindo o `alert()` padrão). |

-----

## 📂 Visão dos Arquivos e Funções

Seu projeto é modular, com arquivos `.asp` para a lógica de servidor e um conjunto de funções **JavaScript** para interatividade no cliente.

### 📜 Funções Chave (JavaScript)

| Função | Descrição | Componente Usado |
| :--- | :--- | :--- |
| `showPageNotification()` | Exibe notificações temporárias no canto superior da tela (sucesso, erro, info, aviso). | **Toastr** |
| `showPopup()` | Exibe um popup informativo simples com apenas o botão "OK". | **SweetAlert2** |
| `showConfirmation()` | Exibe um popup de confirmação com botões "Sim/OK" e "Cancelar" para operações críticas. **Usado em todas as ações irreversíveis.** | **SweetAlert2** |
| `showAlert()` | Função de *fallback* ou alternativa para o `alert()` padrão do navegador. | `alert()` nativo |
| `lancarUsuario()` | Executa a **inclusão de um novo usuário** (após confirmação). | `showConfirmation()` |
| `somarvendas()` / `subtrairvendas()` | Lançam ou subtraem valores de venda do funcionário (após confirmação). | `showConfirmation()` |
| `limparhistorico()` | Solicita **confirmação** antes de apagar **todo o histórico de vendas**. | `showConfirmation()` |
| `formatarvalor()` | Limpa a entrada do campo de valor, permitindo apenas números e ponto/vírgula. | --- |

### 🔑 Funções Chave (ASP Classic)

O trecho em ASP Classic mostra a base para a manipulação de dados:

  * **`abre_conexao()` / `fecha_conexao()`:** Abre e fecha a conexão com o banco de dados MySQL via **ODBC Driver**.
  * **`pega_data()`:** Coleta e formata a data (`wDataAtual`, `wDataAtualInvertida`) e hora (`wHoraAtual`, `wHoraAtualCompleta`) atuais do servidor, além de pegar o IP do cliente (`wIPAtual`). **Essencial** para registrar quando a venda foi feita.

### 🚨 Sobre os **Alerts e Popups**

A utilização de **SweetAlert2** (`showPopup`, `showConfirmation`) é uma excelente prática, pois:

1.  Substitui os **alerts nativos** do navegador, que são feios e pouco personalizáveis.
2.  Garante que o usuário **confirme** ações importantes e **irreversíveis** (como incluir um usuário, somar vendas ou, principalmente, **limpar o histórico**), protegendo contra erros acidentais.

-----

## 🚀 Instalação e Execução

### Pré-requisitos

  * Servidor web com suporte a **ASP Classic** (Ex: IIS no Windows).
  * Servidor de banco de dados **MySQL**.
  * **MySQL ODBC Driver** instalado no servidor ASP Classic (você mencionou a versão 8.4 ANSI).

### Passos

1.  **Configuração do Banco de Dados:**
      * Crie um banco de dados chamado `vendas` no seu servidor MySQL.
      * Crie as tabelas necessárias (ex: `funcionarios`, `vendas`).
2.  **Configuração da Conexão:**
      * No arquivo conexao.asp, altere as credenciais de conexão:
        ```asp
        conn.Open "Driver={MySQL ODBC 8.4 ANSI Driver};" & _
            "Server=localhost;" & _
            "Database=vendas;" & _
            "User=seu usuario aqui;" & _ 
            "Password= sua senha aqui;" 
        ```
        Substitua `seu usuario aqui` e `sua senha aqui` pelas credenciais corretas do seu MySQL.
3.  **Deploy:**
      * Publique os arquivos (`.asp`, `.css`, `.js`, etc.) em um diretório configurado no seu servidor web (IIS) para executar o ASP Classic.

-----

## 🙋‍♂️ Autor

  * [RAMON XAVIER] - [www.linkedin.com/in/ramon-xavier-dev]

-----

