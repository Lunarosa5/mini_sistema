# 🎓 Sistema de Gestão de Alunos

[![PHP Version](https://img.shields.io/badge/PHP-8.x-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16%2B-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)

> Sistema web simples desenvolvido em PHP e PostgreSQL para gerenciamento cadastral de alunos e controle de autenticação de usuários, desenvolvido durante uma aula no SENAI.

---

## 📌 Sumário
- [Sobre o Projeto](#-sobre-o-projeto)
- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Modelagem do Banco de Dados](#-modelagem-do-banco-de-dados)
- [Como Executar o Projeto Localmente](#-como-executar-o-projeto-localmente)
- [Guia de Utilização](#-guia-de-utilização)

---

## 💻 Sobre o Projeto

Este projeto é um sistema escolar bem simples feito para cadastrar, ver, alterar e apagar dados de alunos (CRUD). Ele também tem uma área para criar uma conta de usuário e fazer login, garantindo que só quem tem conta consiga acessar as páginas do sistema.

---

## 🛠️ Tecnologias Utilizadas

- **PHP**: Cria as páginas e faz o sistema funcionar por trás dos panos.
- **PostgreSQL**: O banco de dados onde todas as informações ficam salvas.
- **HTML**: Para criar os formulários, botões e telas do sistema.

---

## 📂 Estrutura do Projeto

Veja abaixo como as pastas e arquivos estão organizados e o que cada um faz:

```plaintext
mini_sistema/
│
├── app/                          # Pasta para a gestão de alunos
│   ├── create.php                # Tela com formulário para cadastrar um novo aluno
│   ├── delete.php                # Tela para apagar um aluno usando o número do ID dele
│   ├── select.php                # Relatório que mostra a lista com todos os alunos
│   ├── select_where.php          # Tela para buscar e mostrar apenas 1 aluno pelo ID
│   └── update.php                # Tela para editar e atualizar os dados de um aluno
│
├── database/                     # Pasta de conexão com o banco
│   └── connect.php               # Arquivo que conecta o PHP com o PostgreSQL
│
├── includes/                     # Partes visuais e códigos que se repetem no site
│   ├── footer.php                # O rodapé fixo que aparece embaixo em todas as telas
│   ├── functions.php             # Arquivo com todos os comandos que conversam com o banco
│   └── header.php                # O menu superior para navegar entre as páginas
│
├── login/                        # Pasta que cuida da segurança e dos acessos
│   ├── cadastrar.php             # Tela para criar um novo usuário (e-mail e senha)
│   ├── login.php                 # Tela para entrar no sistema com seu e-mail e senha
│   ├── logout.php                # Botão/link para sair da sua conta
│   └── verifica_user.php         # Arquivo que checa se você está logado para liberar a página
│
├── escola.sql                    # Arquivo que cria a estrutura do banco de dados no PostgreSQL
└── index.php                     # Página inicial de boas-vindas do sistema
```
---

## 🗄️ Modelagem do Banco de Dados
O banco de dados se chama escola e possui duas tabelas principais (usuarios e alunos).
```
erDiagram
    USUARIOS {
        int id PK "SERIAL - Código do Usuário"
        varchar email "E-mail de Login"
        varchar senha "Senha de Acesso"
    }

    ALUNOS {
        int id PK "SERIAL - Código do Aluno"
        varchar nome "Nome do Aluno"
        varchar turma "Turma do Aluno"
        date nascimento "Data de Nascimento"
        boolean ativo "Status da Matrícula (Ativo/Inativo)"
        varchar email "E-mail do Aluno"
    }

    USUARIOS ||--o{ ALUNOS : "gerencia"
```
---

## 🚀 Como Executar o Projeto Localmente
Siga o passo a passo abaixo para rodar o projeto no seu computador:

- 📋 Pré-requisitos
  - PHP (versão 8.0 ou superior) instalado.
  - PostgreSQL instalado.
  - Extensão pdo_pgsql habilitada no arquivo php.ini.

1️ Baixar o projeto
  - Clone este repositório ou baixe os arquivos para o seu computador:
```bash
git clone https://github.com/Lunarosa5/mini_sistema.git
```

2️⃣ Configurar o Banco de Dados
  - Abra o terminal do PostgreSQL ou um programa como MobaXterm.
  - Crie o banco de dados chamado escola:
```sql
CREATE DATABASE escola;
```
  - Importe a estrutura e dados usando o arquivo escola.sql fornecido:
```sql
psql -U postgres -d escola -f escola.sql
```

3️⃣ Ajustar as Credenciais de Conexão
  - Abra o arquivo database/connect.php e atualize o endereço, usuário e senha para corresponderem às configurações da sua máquina:
```php
$host = "localhost";      // Ou o IP do seu servidor de banco
$dbname = "escola";       // Nome do banco de dados
$user = "postgres";       // Seu usuário do PostgreSQL
$pass = "sua_senha";      // Sua senha do PostgreSQL
```

4️⃣ Iniciar o Servidor PHP
  - Abra o terminal dentro da pasta raiz do projeto e execute:
```bash
php -S localhost:8000
```

5️⃣ Abrir no Navegador
  - Abra o seu navegador (Chrome, Edge, Firefox, etc.) e acesse:
```
http://localhost:8000/index.php
```
---

## 📖 Guia de Utilização
Siga os passos abaixo para testar o fluxo completo do sistema:

- Cadastrar uma Conta de Usuário:
  - No menu superior, acesse Entrar e depois vá para a opção de cadastro de conta (/login/cadastrar.php).
  - Informe seu e-mail e uma senha para se cadastrar.

- Realizar o Login:
  - Acesse a tela de login (/login/login.php), preencha com as credenciais criadas e clique em Entrar.
  - Uma sessão será iniciada e o acesso às áreas restritas do sistema estará liberado.

- Cadastrar um Aluno:
  - Clique na opção Cadastrar no menu superior.
  - Preencha as informações do aluno (Nome, Turma, Data de Nascimento e E-mail) e clique no botão de envio.

- Visualizar e Consultar Alunos:
  - Relatório: Clique em Relatório para ver a lista com todos os alunos cadastrados e verificar seus respectivos números de ID.
  - Consultar: Clique em Consultar e digite o ID de um aluno específico para visualizar apenas os dados dele.

- Atualizar ou Excluir Registros:
  - Atualizar: Na aba Atualizar, insira o ID do aluno e preencha os novos dados para alterar o registro.
  - Excluir: Na aba Excluir, informe o ID do aluno desejado para removê-lo do banco de dados.

- Encerrar a Sessão (Logout):
  - Ao finalizar o uso, clique na opção Sair no menu para encerrar a sessão com segurança.
---

> ✨ Projeto desenvolvido no **SENAI** como parte do meu aprendizado em PHP e Banco de Dados. Obrigado por visitar!
