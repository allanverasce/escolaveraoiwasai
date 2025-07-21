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

Exemplo de um produto gênico anotado (formato GFF3): É possível identificar em qual contig foi encontrado o produto, quais as coordenadas do mesmo e por fim uma inferência sobre sua função.

`contig_1  Prodigal  CDS  105  978  .  +  0  ID=cds00001;product=hypothetical protein `

### 2.2 Identificação de RNAs
A identificação de RNAs não codificantes é uma etapa essencial da anotação genômica, principalmente em organismos procariotos. Os principais tipos são:

- rRNAs (RNA ribossômico)

- tRNAs (RNA transportador)

- sRNAs (pequenos RNAs reguladores)

### rRNAs (RNA ribossômico) O que são ?
São componentes essenciais do ribossomo. Em procariotos, os principais genes rRNA são:

- 16S rRNA

- 23S rRNA

- 5S rRNA

### Ferramentas principais:

1. Barrnap
Rápido e confiável para rRNAs em genomas de bactérias e arqueias.

Exemplo de uso:

```
barrnap --kingdom bac <genome.fasta> > rRNA.gff
```

- --kingdom bac: específico para bactérias (arc para arqueias).

- Output no formato .gff, que pode ser integrado em pipelines de anotação.

Fonte: https://github.com/tseemann/barrnap

2. RNAmmer

Ferramenta considerada antiga, mas bastante precisa, atualmente menos atualizada, inclusive o serviço de atualização vem sendo descontinuado pelo desenvolvedor.

Requer instalação via Perl e banco de dados próprio.

Comando:
```
rnammer -S bac -m tsu,ssu,lsu -gff rnammer_output.gff < genome.fasta
```
fonte: https://services.healthtech.dtu.dk/services/RNAmmer-1.2/

3. Infernal + Rfam
Detecta RNAs estruturais com base em modelos de covariância (RNA secondary structure + sequence conservation).

Exemplo de uso com Infernal + Rfam:
```
cmscan --tblout rRNA.tblout --fmt 2 --noali -o rRNA.out Rfam.cm genome.fasta
```

- Rfam.cm: banco de modelos de RNAs do Rfam

- Resultados incluem vários tipos de RNAs, incluindo rRNAs e sRNAs.

Fonte: Infernal: http://eddylab.org/infernal/
