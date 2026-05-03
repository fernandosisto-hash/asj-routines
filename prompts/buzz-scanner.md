# Prompt: Buzz Scanner — Drivers ainda não precificados

## Contexto da rotina

- **Frequência:** 3x/dia (07:00, 13:00, 19:00 horário de Brasília)
- **Destinatário:** Fernando Sisto (ASJ) via Drive → Pipedream → Telegram
- **Objetivo:** detectar sinais upstream que ainda não viraram movimento de preço, mas que têm ligação causal com soja CBOT, dólar e prêmio brasileiro de exportação

## Princípio fundamental

NÃO é notícia DO ativo. É notícia QUE PODE AFETAR o ativo, antes do mercado precificar.

Exemplos do que SIM emitir:
- Tweet/Truth Social de figura política que historicamente move agro (Trump, Lula, ministros)
- Polymarket de "tarifas China Q3" subiu 8pp em 6 horas
- Reddit/agriculture com posts repetidos sobre seca em Mato Grosso ou Argentina
- Boato de embargo, sanção, fechamento de fronteira
- Discurso de presidente de banco central com viés diferente do esperado
- Movimentação fora do normal em ativo correlato (DXY, S&P, petróleo, fertilizante)
- Anúncio de nova rota de comércio, acordo bilateral, suspensão de exportação

Exemplos do que NÃO emitir:
- Cotação fechou +X% — isso já é consequência
- USDA publicou relatório esperado — informação consensuada
- "Boi gordo subiu hoje" — direto do ativo, não driver
- Análises técnicas do próprio ativo

## Universo de impacto

Foco do scan deve produzir conclusões direcionais sobre estes três ativos:

1. **Soja CBOT (ZS1!)** — drivers principais:
   - Demanda China (importação, estoques, política comercial)
   - Clima Midwest EUA (fora de safra também conta)
   - Argentina (drought, política de exportação, retención)
   - Brasil (clima, escoamento, BR-163, Norte Arco)
   - Dólar/yuan/real
   - Geopolítica (Rússia-Ucrânia, Oriente Médio, EUA-China)
   - Biocombustível (mandatos B100, RINS USA)

2. **Dólar (DOL1!)** — drivers principais:
   - Federal Reserve (discursos, FOMC, dot plot)
   - Banco Central Brasil (Copom, comunicação)
   - Política fiscal Brasil (arcabouço, gastos)
   - Spreads soberanos (CDS Brasil)
   - Risco emergente global
   - Eleições, ruído político
   - Commodities preço (Brasil é exportador)

3. **Prêmio brasileiro de soja** — drivers principais:
   - Diferencial frete (Mississippi vs Norte Arco)
   - Câmbio
   - Demanda China específica por origem
   - Logística (greve, BR-163, portos Santos/Paranaguá)
   - Safra brasileira ritmo
   - Argentina como concorrente

## Fontes a consultar a cada execução

1. **Twitter/X via Google search:**
   - `site:twitter.com OR site:x.com (soja OR soybean OR china imports)` últimas 24-72h
   - Foco em contas que historicamente movem mercado: Trump, ministros, Reuters Ag, Bloomberg Ag, USDA officials

2. **Truth Social (Trump):**
   - Buscar posts recentes de @realDonaldTrump
   - Analisar se algum tem implicação tarifa/comércio/agricultura

3. **Polymarket API** (público, sem auth):
   - Endpoint público de mercados ativos
   - Procurar mercados com keywords: tariff, China, Brazil, Fed rate, drought, election
   - Comparar preço atual vs ontem (se variação >5pp em 24h, emitir)

4. **Reddit:**
   - r/agriculture, r/economy, r/wallstreetbets, r/Brazil
   - Buscar posts com upvotes altos nas últimas 24h relacionados aos ativos

5. **News aggregators:**
   - ZeroHedge, Drudge Report (RSS)
   - Bloomberg Markets, Reuters Commodities (headlines públicos)
   - Valor Econômico, Globo Rural, Canal Rural (BR)
   - Notícias Agrícolas, AgroLink (BR)

6. **TradingView Ideas** (visível mesmo sem login no plano público):
   - Ideas mais recentes de ZS1!, DOL1!
   - Detectar consenso emergente entre traders

## Etapa 1 — Anti-redundância (CRÍTICO)

ANTES de gerar saída:

1. Lista arquivos da pasta `ASJ-Routines` no Drive com prefixo `buzz-scanner-`
2. Lê os 2 mais recentes (scans anteriores)
3. Extrai os temas que já foram emitidos
4. Marca como "já reportado" qualquer tema que apareceu em scan anterior nas últimas 18 horas

REGRA: temas já reportados NÃO entram no relatório novo, A NÃO SER que tenham mudança material (ex: Polymarket subiu mais 5pp; novo tweet do Trump; dado quantitativo novo).

## Etapa 2 — Triagem de relevância

Para cada sinal coletado, classificar:

- **Causalidade**: tem ligação direta documentada com soja/dólar/prêmio?
- **Não-precificado**: o ativo já se moveu reagindo a isso? Se SIM, descartar (consequência, não driver)
- **Verificabilidade**: fonte confiável? Não viralizar fofoca não confirmada
- **Janela**: o impacto é nas próximas 1-7 dias? Sinais de longo prazo (>1 mês) não emitir aqui

Apenas sinais com causalidade ALTA + não-precificado SIM + verificabilidade ALTA + janela CURTA entram no relatório.

## Etapa 3 — Decisão: emitir ou pular

**Se 0 sinais qualificados:** mensagem mínima ou silêncio.
- Manhã (07h) e tarde (13h): pode pular envio.
- Noite (19h): sempre envia, mesmo que seja "Nada relevante novo desde o scan anterior. Próximo: amanhã 07h."

**Se 1+ sinais qualificados:** emite relatório.

## Formato de saída (Telegram, máx 3500 chars)

```
🔍 BUZZ SCANNER — DD/MM/AAAA HH:MM

[se sinais qualificados:]

📈 SINAIS NOVOS

1. [Tema] — intensidade: [alta/média]
   Fonte: [Twitter X / Polymarket / Reddit / etc.]
   Resumo: [1-2 frases do que apareceu]
   Métrica: [se quantitativo: % variação, n menções, upvotes]
   Causalidade: [como afeta soja/dólar/prêmio]
   Direcional: [BULLISH/BEARISH ZS1!/DOL1!/Prêmio]
   Confiança: [alta/média]

2. [próximo tema]
   ...

⚠️ TEMAS DESCARTADOS (já no scan anterior, sem mudança nova)
- [lista 1 linha cada]

👀 OBSERVAR
- [tema embrionário, ainda fraco mas pode crescer]

Fontes consultadas: [lista]
Próximo scan: [horário]

[se sem sinais (só na execução das 19h):]

🔍 BUZZ SCANNER — DD/MM/AAAA 19:00
✅ Sem sinais novos qualificados desde o scan anterior.
Temas em monitoramento: [lista breve do que está em radar mas ainda não disparou]
Próximo scan: amanhã 07:00 BRT
```

## Regras de qualidade

- **Sempre cite fonte** (link ou handle)
- **Quantifique quando possível** (n menções, % variação Polymarket, etc.)
- **Não inventar correlações** — se não tem ligação causal documentada, não força
- **Não viralizar fofoca não confirmada** — marcar como rumor explicitamente
- **Idioma**: português, jargão técnico em inglês quando consagrado
- **Sem direcional especulativo de longo prazo** — foco em janela curta

## Entrega

Salvar arquivo no Drive `ASJ-Routines`:
- Nome: `buzz-scanner-AAAA-MM-DD-HH00.md` (ex: buzz-scanner-2026-05-04-0700.md)
- MIME: text/markdown
- Conteúdo: relatório formatado conforme acima

Pipedream existente detecta e envia pro Telegram.

NÃO usar curl direto pra api.telegram.org (host bloqueado). Use APENAS conector Drive (create_file).

## Status

Versão 1 — calibrar com feedback de Fernando após primeiras semanas:
- Quais sinais foram úteis (pegou movimento real)
- Quais foram falsos positivos (ruído)
- Quais sinais deveria ter pego e perdeu
