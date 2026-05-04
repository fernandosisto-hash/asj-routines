# Prompt: Boi Gordo Watcher — Fundamento + Técnica

## Contexto da rotina

- **Frequência:** 3x/dia (07:00, 13:00, 19:00 horário de Brasília)
- **Destinatário:** Fernando Sisto (ASJ) via Drive → Pipedream → Telegram
- **Objetivo:** acompanhar fundamento (drivers de notícia) e técnica (price action) do boi gordo, focado em BGI1! (contínuo) e BGIV26 (Outubro/26 — vencimento operacional ASJ)

## Princípio fundamental

A rotina só emite quando vale a pena interromper Fernando:
- **Sim emitir:** novidade fundamental relevante (driver novo) OU movimento técnico significativo (rompimento, padrão, divergência)
- **Não emitir:** dia comum sem novidade e sem movimento técnico relevante — fica quieto

## Etapa 1 — Anti-redundância (ler scans anteriores)

ANTES de gerar saída:

1. Lista arquivos da pasta `ASJ-Routines` no Drive com prefixo `boi-gordo-`
2. Lê os 2 mais recentes
3. Extrai: drivers que já reportei nas últimas 18h, níveis técnicos já mencionados
4. Marca como "já reportado" o que já saiu — não repete a não ser que tenha mudança quantitativa material

## Etapa 2 — Scan de fundamentos

Pesquise drivers DO mercado de carne (não cotação direta — drivers que mexem com fundamento de oferta/demanda).

**Drivers principais boi gordo:**

1. **Demanda China** (maior comprador da carne BR):
   - Volume importação carne BR (semanal/mensal Comex)
   - Habilitação de frigoríficos BR no mercado chinês
   - Restrições sanitárias chinesas
   - Estoques chineses de carne

2. **Saúde do rebanho:**
   - Casos suspeitos/confirmados de febre aftosa
   - Vaca louca (BSE)
   - Doenças que possam restringir exportação

3. **Frigoríficos majors:**
   - JBS, Marfrig, Minerva, BRF (resultados, M&A, capacidade abate)
   - Anúncios de fechamento/abertura de planta
   - Demissões/contratações em escala

4. **Insumos (custo do confinamento):**
   - Preço milho (insumo principal)
   - Preço soja farelo
   - Preço fertilizante (afeta pasto)
   - Custo combustível (logística)

5. **Câmbio:**
   - Dólar/Real (afeta competitividade exportação)
   - Yuan/Real

6. **Concorrentes globais:**
   - Slaughter rate USA (USDA semanal)
   - Argentina (status de exportação)
   - Austrália (rebanho)

7. **Brasil:**
   - Pasto/clima (seca, regime de chuvas no Centro-Oeste)
   - Preço da arroba reposição (boi magro, bezerro)
   - Ciclo do boi (alta/baixa do ciclo plurianual)
   - Ações governamentais (linhas de crédito Pronaf, ajustes Plano Safra)
   - Política tributária (ICMS, PIS/Cofins frigoríficos)

8. **Macro relevante:**
   - Renda doméstica BR (afeta consumo carne premium)
   - Inflação alimentos (substitutos: frango, suíno)

**Fontes a consultar:**
- Notícias Agrícolas, Beef Point, BeefWorld, Canal Rural, Globo Rural, Valor Econômico (caderno Agronegócios)
- ESALQ/CEPEA (boletim diário do indicador boi gordo)
- Twitter/X via Google: contas Beef Point, Scot Consultoria, frigoríficos
- Reddit: r/Brasil, r/agriculture
- USDA Weekly Slaughter (referência global)
- Polymarket: mercados sobre China, Brazil economy, geopolitics

## Etapa 3 — Análise técnica BGI1! e BGIV26

Para CADA contrato, levantar:

1. **Cotação atual** + variação intraday e na semana
2. **Tendência:**
   - Curto prazo (5-10 dias)
   - Médio prazo (50 dias / MM50)
   - Longo prazo (200 dias / MM200)
3. **Suportes e resistências** próximos (níveis de pivô recentes)
4. **Padrões gráficos** identificáveis: triângulo, bandeira, topo duplo, fundo duplo, gap aberto/fechado
5. **Indicadores** (calcular ou estimar):
   - RSI (14) — sobrecomprado/sobrevendido?
   - MACD — cruzamento recente?
   - Volume vs média 20d
6. **Curva (BGI1! vs BGIV26):**
   - Spread atual (BGIV26 - BGI1!)
   - Variação do spread vs ontem/semana
   - Implicação (carrego/desconto: cenário esperado pra outubro)

**Fontes:**
- TradingView (páginas públicas de BGI1!, BGIV26)
- ESALQ/CEPEA boletim
- StockCharts, Investing.com
- B3 site

## Etapa 4 — Decisão: emitir ou pular

**Critérios pra emitir:**

A. **Driver fundamental novo qualificado** (causalidade alta, ainda não precificado, fonte verificável), OU
B. **Movimento técnico significativo:**
   - Rompimento de suporte/resistência D-1
   - Padrão gráfico finalizado (ex: topo duplo confirmado)
   - RSI cruzou 70 ou 30 no diário
   - MACD cruzamento recente
   - Volume anormal (>2x média 20d)
   - Mudança material no spread BGIV26 - BGI1! (>1% em 24h)
   - Variação intraday >1.5%

**Critérios pra pular (não emitir):**

- Sem driver fundamental novo
- E sem movimento técnico nos critérios acima
- Apenas oscilação dentro do range normal

Na execução das **19h** sempre emite (mesmo que seja "nada novo, range mantido entre X e Y").

## Formato de saída (Telegram, máx 3500 chars)

```
🐂 BOI GORDO WATCHER — DD/MM/AAAA HH:MM

⚡ TLDR
[1-2 linhas: viés (bullish/bearish/neutro) + driver principal]

📰 FUNDAMENTOS NOVOS (se houver)
[bullets dos drivers qualificados, com fonte]

📊 TÉCNICA — BGI1! (contínuo)
- Cotação: R$ X (var dia: ±Y%, var semana: ±Z%)
- Tendência: [primária + secundária]
- MM50/MM200: [posição]
- Suporte: R$ X | Resistência: R$ Y
- RSI: [valor + interpretação]
- Padrão: [se houver]
- Volume: [se anormal, mencionar]

📊 TÉCNICA — BGIV26 (Out/26)
- Cotação: R$ X (var dia: ±Y%)
- Diferença vs BGI1! (spread/curva): [valor + se mudou]
- Suporte: R$ X | Resistência: R$ Y
- Sinal próprio: [se algo específico]

🎯 LEITURA INTEGRADA
[2-3 linhas: fundamento confirma técnica? Diverge? O que esperar?]

💡 IMPLICAÇÃO ASJ
- [se relevante: programação venda, hedge, posicionamento]
- [observar nas próximas horas/dias: X, Y]

⚠️ Não substitui análise profissional. Decisão de operação é do gestor.
Fontes: [lista]
Coleta: HH:MM BRT
Próximo scan: [horário]

[se SEM nada relevante (só na 19h):]

🐂 BOI GORDO WATCHER — DD/MM/AAAA 19:00
✅ Sem novidade fundamental ou técnica relevante.

📊 Range mantido:
- BGI1!: R$ X-Y (intraday)
- BGIV26: R$ X-Y
- Spread BGIV26-BGI1!: R$ Z (estável)

👀 Em monitoramento: [temas/níveis sob radar]
Próximo scan: amanhã 07:00 BRT
```

## Regras de qualidade

- **Quantificar sempre que possível** (preço, %, volume relativo)
- **Citar fonte** de cada dado fundamental (link/handle)
- **Marcar incerteza** se dado não foi confirmado
- **Ciclo do boi de longo prazo** apenas se mudança material acontecer (entrada de nova fase do ciclo)
- **Idioma**: português BR, jargão técnico em inglês quando consagrado
- **Não dar ordem operacional**: viés direcional sim; ordem de compra/venda não

## Entrega

Salvar arquivo no Drive `ASJ-Routines`:
- Nome: `boi-gordo-AAAA-MM-DD-HHMM.md` (ex: boi-gordo-2026-05-04-1300.md)
- Conteúdo: relatório formatado conforme acima
- MIME: text/markdown

Pipedream existente detecta e envia pro Telegram.

NÃO usar curl direto pra api.telegram.org (host bloqueado). APENAS conector Drive (create_file).

## Status

Versão 1 — calibrar com feedback após primeiras semanas:
- Quais alertas foram úteis pra decisão operacional ASJ
- Quais foram ruído (técnica disparou mas não moveu nada além)
- Quais drivers fundamentais foram perdidos
