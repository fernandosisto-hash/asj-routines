# Prompt: Clima EUA × Soja — Relatório Diário 20h

## Contexto da rotina

- **Frequência:** diária, às 20:00 (horário de Brasília)
- **Destinatário:** Fernando Sisto (ASJ) via Drive → Pipedream → Telegram
- **Por que 20h:** mercados de Chicago (CBOT) já fecharam; dados consolidados do dia disponíveis
- **Objetivo:** entender o que o clima nos EUA está fazendo com a soja e qual o impacto esperado nos preços

## Como o Claude deve atuar

### Etapa 1 — Verificar análise do dia anterior (anti-redundância)

ANTES de gerar o relatório novo:

1. Liste arquivos da pasta `ASJ-Routines` no Drive (use o conector Drive)
2. Encontre o arquivo mais recente com nome `clima-eua-soja-AAAA-MM-DD.md` (não o de hoje, o anterior)
3. Leia o conteúdo desse arquivo
4. Extraia da leitura: viés do dia (bullish/bearish/neutro), magnitude, fase atual, estados em alerta, notícia que moveu o dia anterior

Se não encontrar arquivo anterior, prossiga normalmente para a Etapa 2 (relatório completo).

### Etapa 2 — Coletar dados de hoje

Pesquise dados atualizados em:
- NOAA Climate Prediction Center (CPC) — previsões 6-10 e 8-14 dias
- US Drought Monitor (drought.gov/usdm) — atualizado quintas
- USDA NASS Crop Progress — atualizado segundas (apenas)
- USDA WASDE — mensal
- CBOT/Chicago — preços do dia
- Headlines de mercado (geopolítica, demanda China, exportações)

Sempre cite fonte e data/hora da informação consultada.

### Etapa 3 — Decisão: relatório completo ou mensagem curta?

Compare hoje × ontem usando estes critérios. **Se TODOS forem iguais ou quase iguais**, gerar mensagem curta. **Se ALGUM mudou**, gerar relatório completo.

**Critérios de "mudança relevante":**

1. **Viés mudou?** Bullish → bearish, bearish → bullish, ou magnitude saltou (pequeno → grande, ou vice-versa). Pequena oscilação dentro da mesma direção NÃO é mudança.
2. **Fase da safra mudou?** Plantio → emergência → vegetativo → floração → enchimento → maturação → colheita.
3. **Algum estado-chave entrou ou saiu de alerta climático?** (Iowa, Illinois, Minnesota, Indiana, Nebraska, Ohio, Missouri, Dakota do Sul, Kansas)
4. **Saiu Crop Progress hoje (segunda) e os números mudaram materialmente?** Diferença ≥5pp em condição boa/excelente, ou ritmo de plantio fora da expectativa.
5. **Saiu WASDE ou outro relatório USDA importante?**
6. **Notícia macro nova com impacto direto no preço?** Anúncio de tarifa, China, geopolítica, embargos, eventos climáticos extremos confirmados.

### Etapa 4a — Se NENHUM critério mudou: mensagem curta

Formato (até 800 caracteres):

```
🌾 CLIMA EUA × SOJA — DD/MM/AAAA

✅ Sem alterações relevantes desde ontem.
Análise mantida.

📅 Fase: [fase atual]
💰 Viés: [bullish/bearish/neutro] [magnitude]
🌡️ Drought Monitor: [estável | sem mudança esperada (próxima atualização: quinta)]

👀 Próxima janela de mudança esperada:
- [Ex: Crop Progress segunda 16h ET]
- [Ex: WASDE 12/05]
- [Ex: nova rodada de previsão NOAA quarta]

Coleta: HH:MM BRT
```

### Etapa 4b — Se algum critério mudou: relatório completo

Use o formato abaixo. Limite: 3500 caracteres.

```
🌾 CLIMA EUA × SOJA — DD/MM/AAAA

⚡ RESUMO (2 linhas)
[viés bullish/bearish/neutro + driver principal do dia]
[mudança em relação a ontem em 1 frase]

📅 Fase atual: [plantio/vegetativo/floração/enchimento/colheita]
Sensibilidade climática: [alta/média/baixa] para esta fase

🌡️ CONDIÇÕES CORRENTES
- Midwest: [tempo agora, anomalia vs normal]
- Drought Monitor: [% da área de soja em D1+]
- Estados em alerta: [listar até 3]

🔮 PREVISÃO 7 DIAS (NOAA CPC)
- Chuva: [acima/abaixo/normal]
- Temperatura: [acima/abaixo/normal]
- Eventos relevantes: [ondas de calor, frentes, etc.]

📊 LAVOURA (último Crop Progress)
- Plantio: X% (vs Y% média 5 anos)
- Condição boa/excelente: X% (vs Y% semana anterior)

💰 IMPLICAÇÃO PREÇO
- Viés: [bullish/bearish/neutro]
- Magnitude esperada: [pequena/média/grande]
- Razão em 1 frase

📰 MOVEU O DIA
- [headline curta + fonte]

👀 OBSERVAR AMANHÃ
- [1-2 itens críticos]

Fontes: NOAA, USDA, US Drought Monitor, CBOT
Coleta: HH:MM BRT
```

## Regras de qualidade

- **Nada de invenção:** se um dado não foi confirmado em fonte pública, marcar "não verificado" ou omitir.
- **Datas explícitas:** toda informação climática deve ter data de referência.
- **Sem opinião especulativa:** o relatório descreve cenário e implicações prováveis baseadas em correlações históricas, não dá ordem de compra/venda.
- **Idioma:** português do Brasil. Tecnicismos em inglês quando consagrados (CBOT, WASDE, R3, etc.).
- **Comparação BRA × EUA:** mencionar brevemente quando relevante.
- **Anti-redundância:** se nada mudou, mensagem curta. Não repetir o relatório completo só pra preencher.

## Notas de execução

- **Etapa 1 (ler arquivo anterior):** use o conector Drive (search_files com `folder='ASJ-Routines'` ou list_recent_files). Se mais de um arquivo, pegue o de data mais recente que NÃO seja a de hoje.
- **Sempre criar arquivo no Drive (mesmo no caso curto):** salva o histórico independente do conteúdo.
- **No Routines (nuvem):** as variáveis e conector Drive já estão disponíveis na rotina.

## Status

Versão 2 — adiciona lógica anti-redundância. Testar manualmente antes do próximo run agendado.
