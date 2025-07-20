# Módulo 2: Montagem do Genoma
Este módulo aborda a reconstrução do genoma a partir dos reads curtos e a avaliação da qualidade da montagem.

# Objetivo do processo de Montagem juntamente com etapas

<img src="etapasM.png" alt="Etapas de Montagem" width="800" height="600" />



### 2.1 Montagem de Genomas (De Novo Assembly)
Objetivo: Juntar os reads filtrados e de alta qualidade para formar contigs (sequências contíguas) e, idealmente, scaffolds (contigs ordenados e orientados por informações de pareamento). A montagem de novo significa que não usamos um genoma de referência pré-existente.

Ferramentas: SPAdes (para genomas bacterianos e arqueais)

Comandos:
```
sudo apt install -y spades
mkdir assembly
spades.py --careful -o assembly/SRR10461876_assembly \
-1 trimmed_reads/SRR10461876_1_paired.fastq \
-2 trimmed_reads/SRR10461876_2_paired.fastq
```

### Descrição Detalhada:

- sudo apt install -y spades: Instala o montador de genomas SPAdes. O SPAdes (St. Petersburg Genome Assembler) é um dos montadores mais populares e robustos para genomas de procariotos, capaz de lidar com dados de Illumina, Ion Torrent e até mesmo reads híbridos (curtos e longos).

- mkdir assembly: Cria um diretório para armazenar os resultados da montagem.

- spades.py --careful -o assembly/SRR10461876_assembly: Executa o script principal do SPAdes.

- --careful: Esta opção ativa um modo de montagem mais rigoroso. Ele realiza um passo adicional de correção de erros e tenta reduzir o número de erros de montagem e quimeras (contigs que combinam sequências de regiões não adjacentes do genoma), o que é especialmente útil para dados com cobertura irregular ou contaminação. Embora possa aumentar o tempo de execução, geralmente resulta em uma montagem de maior qualidade.

- -o assembly/SRR10461876_assembly: Define o diretório de saída onde todos os arquivos gerados pelo SPAdes serão armazenados.

- -1 trimmed_reads/SRR10461876_1_paired.fastq: Especifica o arquivo de reads do forward pareados, que foram previamente trimados.

- -2 trimmed_reads/SRR10461876_2_paired.fastq: Especifica o arquivo de reads do reverse pareados, também trimados.

Saídas do SPAdes: O diretório de saída (assembly/SRR10461876_assembly/) conterá vários arquivos, sendo os mais importantes:

- contigs.fasta: Este é o arquivo principal, contendo todas as sequências contíguas (contigs) montadas. Para procariotos, o objetivo é ter o menor número possível de contigs, idealmente um único cromossomo circular.

- scaffolds.fasta: Se o SPAdes conseguir usar as informações de pareamento para ordenar e orientar contigs em fragmentos maiores, eles serão colocados neste arquivo.

- assembly_graph.gfa: O grafo de montagem no formato GFA (Graph Fragment Assembly). Pode ser visualizado com ferramentas como Bandage.

- params.txt: Arquivo com os parâmetros usados na montagem.

- log: Arquivo de log detalhado da execução do SPAdes.


Conceito de K-mers: Montadores de novo como o SPAdes funcionam construindo um grafo de De Bruijn. Eles quebram os reads em sub-sequências de comprimento fixo chamadas "k-mers". As sobreposições entre esses k-mers são usadas para construir o grafo, onde os nós são k-mers e as arestas representam sobreposições. Caminhos através do grafo representam as sequências do genoma. O SPAdes testa múltiplos tamanhos de k-mers automaticamente para encontrar a melhor montagem.

<img src="grafo.png" alt="Grafos" width="800" height="600" />

### 2.2 Avaliação da Qualidade da Montagem
Objetivo: Avaliar métricas importantes da montagem para determinar sua completude, contiguidade e acurácia. Esta etapa é crucial para entender a qualidade do genoma reconstruído.

Ferramentas: QUAST (Quality Assessment Tool for Genome Assemblies)

Comandos:

```
sudo apt install -y quast
mkdir quast_report
quast.py assembly/SRR10461876_assembly/contigs.fasta -o quast_report/
```






