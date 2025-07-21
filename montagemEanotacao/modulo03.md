# Anotação Genômica
A anotação genômica é o processo de identificar elementos genéticos (genes, RNAs, regiões regulatórias) em uma montagem genômica e atribuir funções biológicas a esses elementos. Esse processo é fundamental para entender o conteúdo funcional de um genoma bacteriano ou arqueano.

## 1. Fases da Anotação Genômica
### 1.1. Anotação Estrutural
Identifica a localização e estrutura dos genes e elementos genéticos no DNA.

Inclui:

- Genes codificadores de proteínas (CDS)

- RNAs ribossômicos (rRNAs) e transportadores (tRNAs)

- Genes hipotéticos

- Elementos móveis (como IS, transposases)

- Regiões promotoras (opcional)

Ferramentas:
`Prokka, Bakta, PGAP, GeneMarkS, Glimmer, Barrnap, tRNAscan-SE`

### 1.2. Anotação Funcional
Atribui funções biológicas conhecidas aos elementos identificados na fase estrutural, comparando com bancos de dados funcionais.

Inclui:

Nome da proteína

Atribuição a vias metabólicas (KEGG, MetaCyc)

Atribuição a famílias (Pfam, TIGRFAM, COG)

Detecção de genes de resistência ou virulência

Ferramentas:

InterProScan, HMMER, eggNOG-mapper, Blastp, AMRFinderPlus, RAST


# 2. Etapas Detalhadas da Anotação Estrutural
## 2.1. Previsão de Genes Codificadores (CDS)
A maioria dos genes bacterianos não possui íntrons, tornando o processo mais direto.
Ferramentas como Prokka usam internamente Prodigal ou GeneMarkS.

Exemplo de um gene anotado (formato GFF3):
`contig_1  Prodigal  CDS  105  978  .  +  0  ID=cds00001;product=hypothetical protein `
