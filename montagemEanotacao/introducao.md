# Origem dos dados utilizados na Bioinformática

## 1. Do sequenciamento ao dado digital

- Extração do material genético: inicia-se com a extração de DNA ou RNA da amostra biológica.

- Preparação da biblioteca: fragmentação, adição de adaptadores e quantificação (ex: Qubit, qPCR).

- Amplificação e/ou clonagem: em algumas plataformas, ocorre amplificação por PCR ou bridge amplification.

- Sequenciamento: uso de plataformas que convertem moléculas biológicas em leituras digitais (reads).

- Formato de saída: arquivos como FASTQ (sequências + qualidade), SAM/BAM

## 2. Principais plataformas de sequenciamento
### Illumina (Sequencing by Synthesis – SBS)

- Amplamente utilizada, com alta acurácia (> 99 %) e alto throughput. Modalidades incluem NovaSeq, MiSeq, NextSeq 550

- Leitura curta (short reads) de até ~300 bp por extremidade. Ideal para RNA‑seq, exoma, re‑seq, estudos populacionais

Exemplos:

<img src="imgs/nextseq-1000-2000.png" alt="nextseq" width="200" height="150" /> <img src="imgs/novaseq-6000.png" alt="novaseq" width="200" height="150" /> <img src="imgs/MiSeq.png" alt="MiSeq" width="200" height="150" />

### Pacific Biosciences (PacBio – SMRT e HiFi reads)
- Sequenciamento de molécula única em tempo real, com leituras longas (até dezenas de kb) e alta acurácia na versão HiFi (~99,9 %)
- Excelente para montagem de novo de genomas, detecção de variantes estruturais e epigenoma

Exemplos:

<img src="imgs/pacbio-rs-ii-3896577-400x300.jpg" alt="pacbiorsII" width="200" height="150" /> <img src="imgs/pacbio-sequel-iie-system.webp" alt="pacbiorssequel" width="200" height="150" /> 

### Oxford Nanopore Technologies (ONT – nanopore sequencing)
- Detecta alterações na corrente elétrica à medida que a molécula de DNA/RNA passa por um nanoporo. Permite leituras ultralongas (muitas centenas de kb a Mb) e sequenciamento em tempo real.

Exemplos:

<img src="imgs/nanopore.jpg" alt="Nanopore" width="800" height="600" /> 


</br>

### Plataformas
<img src="imgs/platforms.jpeg" alt="Plataformas" width="800" height="600" />




## 3. Formato do Dado

<img src="imgs/fastq_fig.jpg" alt="FASTQ" width="800" height="600" />





