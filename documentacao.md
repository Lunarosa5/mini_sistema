# 📄 Documentação Técnica — Sistema de Gestão de Alunos

## 1. Visão Geral do Sistema

O **Sistema de Gestão de Alunos** é uma aplicação web simples e funcional criada para facilitar o controle de cadastros escolares. Desenvolvido com **HTML, PHP e PostgreSQL**, o sistema permite gerenciar os dados dos estudantes (criar, ver, alterar e apagar) com a segurança de um controle de acesso que exige e-mail e senha para entrar.

---

## 2. Objetivos do Sistema
O objetivo principal da aplicação é resolver a gestão de alunos de forma centralizada e segura. Para isso, o sistema foi feito para cumprir as seguintes tarefas:

1. **Garantir a segurança:** Liberar as telas de cadastro e relatório apenas para usuários logados no sistema.
2. **Criar contas de acesso:** Permitir que novos operadores do sistema criem seu próprio e-mail e senha para entrar.
3. **Cadastrar alunos:** Inserir novos estudantes no banco de dados com dados como nome, turma, data de nascimento, e-mail e status da matrícula.
4. **Listar todos os alunos:** Mostrar um relatório completo com todas as pessoas cadastradas na escola.
5. **Buscar aluno específico:** Localizar rapidamente os dados de um único estudante utilizando o seu número de identificação (`ID`).
6. **Atualizar dados:** Permitir alterar as informações de um aluno quando algo mudar (como trocar de turma ou de e-mail).
7. **Excluir cadastros:** Remover um aluno do banco de dados quando for necessário.
8. **Desconectar com segurança:** Oferecer a opção de sair da conta (logout) para impedir que outras pessoas usem o sistema sem autorização.

---

## 3. Como os Arquivos Estão Organizados

Para deixar o código limpo e fácil de mexer, o projeto foi dividido em pastas bem definidas:

### 3.1 Tela e Segurança de Login (`login/`)
* **`cadastrar.php`:** Tela com formulário para registrar um novo usuário com e-mail e senha no sistema.
* **`login.php`:** Tela que pede e-mail e senha, confere se as informações estão certas no banco e libera o acesso.
* **`logout.php`:** Fecha a conta do usuário e o manda de volta para a página inicial.
* **`verifica_user.php`:** O "porteiro" do site. Ele roda antes das páginas principais para garantir que ninguém entre sem fazer login primeiro.

### 3.2 Gerenciamento dos Alunos (`app/`)
* **`create.php`:** Salva o novo aluno digitado no formulário dentro do banco PostgreSQL.
* **`select.php`:** Busca todos os alunos salvos no banco e monta a lista do relatório.
* **`select_where.php`:** Busca no banco e mostra na tela apenas o aluno que corresponde ao `ID` pesquisado.
* **`update.php`:** Salva as alterações feitas nos dados de um aluno já existente.
* **`delete.php`:** Apaga o cadastro do aluno do banco usando o número do `ID`.

### 3.3 Conexão e Funções Principais (`database/` e `includes/`)
* **`database/connect.php`:** Arquivo que faz a ponte de comunicação entre o PHP e o banco PostgreSQL.
* **`includes/functions.php`:** Concentra os comandos SQL de salvar, buscar, editar e excluir. É aqui que o trabalho pesado do banco é feito.
* **`includes/header.php` e `includes/footer.php`:** O cabeçalho (com o menu de navegação) e o rodapé que aparecem em todas as páginas para manter o visual padronizado.

---

## 4. Estrutura do Banco de Dados

O banco de dados do projeto se chama **`escola`** e trabalha com duas tabelas simples:

### Tabela `usuarios` (Quem pode acessar o sistema)
* **`id`**: Número único gerado automaticamente para cada usuário.
* **`email`**: E-mail usado para fazer o login.
* **`senha`**: Senha de acesso da conta.

### Tabela `alunos` (Dados dos estudantes)
* **`id`**: Número identificador do aluno no sistema.
* **`nome`**: Nome completo do estudante.
* **`turma`**: Código ou nome da turma do aluno.
* **`nascimento`**: Data de nascimento do aluno.
* **`ativo`**: Informa se a matrícula está ativa (`True`) ou inativa (`False`).
* **`email`**: E-mail de contato do estudante.

---

## 5. Como o Usuário Navega pelo Sistema

1. **Entrada:** O usuário entra no site (`index.php`). Caso ele clicar em qualquer opção do menu sem estar logado, o sistema o manda para a tela de login (`login/login.php`).
2. **Acesso:** Na tela de login, ele coloca seu e-mail e senha (ou cria uma conta nova em `login/cadastrar.php`).
3. **Uso do Sistema:** Com a sessão iniciada, ele navega pelo menu superior para cadastrar novos alunos, visualizar relatórios, buscar um cadastro por `ID`, atualizar dados ou apagar um registro.
4. **Saída:** Ao terminar suas tarefas, o usuário clica em **Sair** (`login/logout.php`) para fechar a sua conta com total segurança.
