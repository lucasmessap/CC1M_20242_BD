# Documentação do Banco de Dados do Sistema de Gestão de Projetos

## Visão Geral
Este documento descreve a estrutura atualizada do banco de dados para o Sistema de Gestão de Projetos, que lida com gerenciamento de funcionários, donatários, projetos, reuniões, editais e relatórios.

## Estrutura das Tabelas

### Funcionários
A tabela `funcionarios` armazena informações dos funcionários da organização:
- `id`: Identificador único para cada funcionário
- `nome`: Nome completo do funcionário
- `email`: Endereço de e-mail do funcionário (único)
- `senha`: Senha criptografada
- `cargo`: Cargo do funcionário na organização

### Donatários
A tabela `donatarios` armazena informações dos donatários:
- `id`: Identificador único para cada donatário
- `nome`: Nome completo do donatário
- `email`: Endereço de e-mail do donatário (único)
- `tipo`: Tipo de donatário (ex: pessoa física, empresa, ONG)

### Projetos
A tabela `projetos` gerencia informações dos projetos:
- `id`: Identificador único para cada projeto
- `titulo`: Título do projeto
- `descricao`: Descrição detalhada do projeto
- `status`: Status atual do projeto (rascunho/ativo/concluido/cancelado)
- `funcionario_id`: Referência ao funcionário responsável pelo projeto

### Reuniões
A tabela `reunioes` acompanha as reuniões do projeto:
- `id`: Identificador único para cada reunião
- `titulo`: Título da reunião
- `descricao`: Descrição detalhada da reunião
- `data_hora`: Data e hora da reunião
- `projeto_id`: Referência ao projeto associado

### Editais
A tabela `editais` gerencia informações sobre os editais:
- `id`: Identificador único para cada edital
- `titulo`: Título do edital
- `descricao`: Descrição detalhada do edital
- `data_publicacao`: Data de publicação do edital
- `data_encerramento`: Data de encerramento do edital
- `status`: Status atual do edital (rascunho/publicado/encerrado)
- `funcionario_id`: Referência ao funcionário responsável pelo edital

### Relatórios
A tabela `relatorios` armazena informações sobre os relatórios gerados:
- `id`: Identificador único para cada relatório
- `titulo`: Título do relatório
- `conteudo`: Conteúdo detalhado do relatório
- `data_criacao`: Data de criação do relatório
- `tipo`: Tipo de relatório (ex: mensal, trimestral, anual)
- `projeto_id`: Referência ao projeto associado ao relatório
- `funcionario_id`: Referência ao funcionário que criou o relatório


