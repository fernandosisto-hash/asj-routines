# Prompt: Relatório Diário de Cotações

## Objetivo
Gerar um relatório matinal com as principais cotações que afetam a operação da ASJ.

## Tarefas
1. Pesquisar cotação atual de:
   - Soja (CBOT em USD/bushel e Brasil em R$/saca)
   - Milho (CBOT em USD/bushel e Brasil em R$/saca)
   - Boi gordo (R$/arroba — referência B3/CEPEA)
   - Dólar (USD/BRL)
   - Frete rodoviário de grãos (índice ESALQ-LOG)
2. Comparar com o fechamento do dia anterior (variação % e absoluta).
3. Identificar fatores que estão movendo o mercado (notícias relevantes das últimas 24h).
4. Gerar tabela resumida + 3 a 5 bullets de análise.

## Formato de saída
- Tabela em Markdown com: Ativo | Cotação atual | Δ% | Δ absoluta | Fonte
- Seção "Destaques do dia" com até 5 bullets concisos
- Timestamp no final (data + hora de Brasília)

## Critérios de qualidade
- Sempre citar fonte de cada cotação
- Se não conseguir confirmar uma cotação, marcar "não verificado"
- Não inventar números

## Status
Rascunho — testar manualmente antes de agendar como rotina.
