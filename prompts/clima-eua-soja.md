# Prompt: Clima EUA × Soja — Relatório Diário 20h

## Contexto da rotina

- **Frequência:** diária, às 20:00 (horário de Brasília)
- **Destinatário:** Fernando Sisto (ASJ) via Telegram
- **Por que 20h:** mercados de Chicago (CBOT) já fecharam; dados consolidados do dia disponíveis
- **Objetivo:** entender o que o clima nos EUA está fazendo com a soja e qual o impacto esperado nos preços

## O que o Claude deve fazer

### 1. Identificar a fase do calendário

Consultar a data corrente e classificar o estágio das lavouras de soja nos EUA. Referência:

- **Abril–Maio:** plantio
- **Junho:** emergência e desenvolvimento vegetativo
- **Julho:** floração (R1–R3) — sensível a calor
- **Agosto:** enchimento de grãos (R4–R6) — **fase mais crítica para produtividade**
- **Setembro–Outubro:** maturação e colheita

A análise deve ser focada nas variáveis climáticas que mais importam para o estágio atual.

### 2. Coletar dados das fontes oficiais

Buscar (via web search ou fetch) as informações mais recentes em:

- **NOAA Climate Prediction Center (CPC):** previsões de 6–10 dias e 8–14 dias para precipitação e temperatura no Midwest
- **US Drought Monitor (drought.gov/usdm):** índice semanal de seca por estado
- **USDA NASS Crop Progress:** plantio %, emergência %, condição da lavoura % (publicado segundas durante a safra)
- **National Weather Service (weather.gov):** previsões locais para Iowa, Illinois, Indiana, Minnesota, Nebraska
- **USDA WASDE:** estimativas mais recentes de oferta/demanda (mensal)

Sempre citar fonte e data/hora da informação consultada.

### 3. Mapear os principais estados produtores

Foco analítico em ordem de importância (top 9 produtores de soja dos EUA):

1. Illinois
2. Iowa
3. Minnesota
4. Indiana
5. Nebraska
6. Ohio
7. Missouri
8. Dakota do Sul
9. Kansas

Para cada estado relevante: chuva acumulada recente, anomalia de temperatura, status no Drought Monitor, previsão de 7 dias.

### 4. Avaliar impacto de mercado

Cruzar condição climática × estágio da cultura × posição especulativa atual para concluir:

- **Viés bullish (alta de preço):** seca em estados-chave durante R3–R5, geadas precoces, atrasos significativos de plantio em vasta área
- **Viés bearish (queda de preço):** chuvas regulares no Midwest durante enchimento, melhora ampla nas condições de lavoura, plantio adiantado
- **Neutro:** clima dentro da normalidade

Ser explícito sobre **incerteza**: se a previsão tem alta variância entre modelos (GFS vs ECMWF), mencionar.

## Formato do output (mensagem Telegram)

A mensagem final deve caber em até 3500 caracteres. Estrutura sugerida:

```
🌾 CLIMA EUA × SOJA — DD/MM/AAAA

⚡ RESUMO (2 linhas)
[viés bullish/bearish/neutro + driver principal do dia]

📅 Fase atual: [plantio/vegetativo/floração/enchimento/colheita]
Sensibilidade climática: [alta/média/baixa] para esta fase

🌡️ CONDIÇÕES CORRENTES
- Midwest: [tempo agora, anomalia vs normal]
- Drought Monitor: [% da área de soja em D1+]
- Estados em alerta: [listar até 3]

🔮 PREVISÃO 7 DIAS
- Chuva: [acima/abaixo/normal]
- Temperatura: [acima/abaixo/normal]
- Eventos relevantes: [ondas de calor, sistemas frontais, etc.]

📊 LAVOURA (último Crop Progress)
- Plantio: X% (vs Y% média 5 anos)
- Condição boa/excelente: X% (vs Y% semana anterior)

💰 IMPLICAÇÃO PREÇO
- Viés: [bullish/bearish/neutro]
- Magnitude esperada: [pequena/média/grande]
- Razão em 1 frase: [explicar]

📰 NOTÍCIA QUE MOVEU O DIA
- [headline curta + fonte]

👀 OBSERVAR AMANHÃ
- [1-2 itens críticos pra acompanhar]

Fontes: NOAA, USDA, US Drought Monitor
Hora de coleta: HH:MM BRT
```

Use emojis para legibilidade. Markdown simples (negrito ocasional). Evite tabelas — não renderizam bem no Telegram.

## Regras de qualidade

- **Nada de invenção:** se um dado não foi confirmado em fonte pública, marcar "não verificado" ou omitir.
- **Datas explícitas:** toda informação climática deve ter data de referência.
- **Sem opinião especulativa:** o relatório descreve cenário e implicações prováveis baseadas em correlações históricas, não dá ordem de compra/venda.
- **Idioma:** português do Brasil. Tecnicismos em inglês quando consagrados (CBOT, WASDE, R3, etc.).
- **Comparação BRA × EUA:** mencionar brevemente quando relevante (ex.: "enquanto BR encerrou colheita em abril com 169 mt").

## Envio

Ao final, enviar a mensagem formatada para o canal Telegram configurado no Routines (chat_id do destinatário ASJ).

## Status

Versão 1 — testar manualmente antes de agendar.

## Notas de execução

- **No Routines (nuvem):** as variáveis `TELEGRAM_BOT_TOKEN` e `TELEGRAM_CHAT_ID` ficam disponíveis como secrets configurados na rotina. O script `scripts/notify-telegram.sh` detecta automaticamente.
- **Manual (local no Mac):** lê de `~/.config/asj/telegram-token`. Mesmo script funciona.
- **Comando final do Claude:** após gerar o relatório, executar `echo "<relatório>" | bash scripts/notify-telegram.sh`
