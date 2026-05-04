# CLAUDE.md — ASJ Routines

Este arquivo dá ao Claude o contexto necessário para trabalhar nas rotinas automatizadas da Agro São João (ASJ).

## Sobre a empresa

A ASJ é uma empresa do agronegócio. Este repositório armazena a configuração que vai rodar dentro do Claude Code Cloud (Routines), executando tarefas autônomas em horários agendados ou via webhooks.

Responsável principal: Fernando Sisto Arantes (fernandosisto@agrosaojoao.com)

## Princípios de trabalho

- **Idioma padrão:** sempre responder e gerar conteúdo em português do Brasil, exceto quando o output for código ou termos técnicos consagrados em inglês.
- **Concisão:** relatórios devem ir direto ao ponto. Comece pelo resultado, depois detalhe.
- **Fontes citadas:** ao trazer dados externos (cotações, notícias, análises), sempre cite a fonte e a data/horário de coleta.
- **Confiabilidade primeiro:** se uma informação não pode ser verificada, dizer explicitamente "não verificado" em vez de inventar.
- **Sem ações destrutivas sem confirmação:** apagar arquivos, mandar e-mails para listas, postar publicamente — sempre pedir confirmação humana antes.

## Estrutura do repositório

- CLAUDE.md — este arquivo (contexto e regras gerais)
- README.md — propósito do repo
- .claude/settings.json — configurações de permissão e modelo
- .claude/skills/ — skills específicas da ASJ
- prompts/ — biblioteca de prompts validados
- .gitignore — arquivos a ignorar

## Como o Claude deve atuar

1. **Antes de executar uma rotina:** leia o prompt da rotina e as skills relevantes na pasta .claude/skills/.
2. **Durante a execução:** registre passos importantes em formato de log conciso.
3. **No final:** entregue o resultado no formato pedido (e-mail, Markdown, JSON, etc.) com timestamp em horário de Brasília.

## Casos de uso previstos

Lista a evoluir conforme novas rotinas forem implementadas:

- Relatório diário de cotações (soja, milho, boi, dólar, frete)
- [ATIVO v2] Clima EUA × Soja — diário 20h via Drive→Pipedream→Telegram, com anti-redundância (ver prompts/clima-eua-soja.md)
- [ATIVO] Buzz Scanner — 3x/dia (7h, 13h, 19h), drivers upstream para soja/dólar/prêmio (ver prompts/buzz-scanner.md)
- [ATIVO] Boi Gordo Watcher — 3x/dia (7h, 13h, 19h), fundamento + técnica de BGI1! e BGIV26 (ver prompts/boi-gordo.md)
- Resumo matinal de notícias do agronegócio
- Acompanhamento climático e alertas de chuva/seca
- Monitoramento de concorrentes
- Análise de fornecedores e variação de preços

## Contato

Em caso de dúvida ou comportamento inesperado de uma rotina, parar a execução e abrir uma issue neste repositório.
