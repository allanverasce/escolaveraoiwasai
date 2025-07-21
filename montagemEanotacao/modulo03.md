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




