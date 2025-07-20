# Módulo 1: Preparação do Ambiente e Qualidade dos Dados Brutos
Este módulo foca na configuração do ambiente de trabalho e na avaliação da qualidade das leituras (reads) de sequenciamento.

## 1.1 Configuração Inicial
Objetivo: Preparar o ambiente Linux para as análises.

Ferramentas: apt, wget, git

Comandos:

```
sudo apt update
sudo apt upgrade -y
sudo apt install -y build-essential wget git unzip screen default-jre
```

Descrição: Atualiza o sistema, instala compiladores C/C++, `wget` para downloads, `git` para clonar repositórios, `unzip` para descompactar arquivos, `screen` para sessões persistentes no terminal e `Java` (JRE) para algumas ferramentas.

## 1.2 Download de Dados de Sequenciamento
Objetivo: Obter reads brutos de sequenciamento (FASTQ) de um organismo procarioto.

Ferramentas: wget ou fastq-dump (do SRA Toolkit)

Comandos (exemplo com wget para um arquivo público ou SRA Toolkit):

### Exemplo 1: Download direto de um link (substitua pelo seu link FASTQ)
```
mkdir raw_data
cd raw_data
wget https://ftp.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -xzf sratoolkit.current-ubuntu64.tar.gz
export PATH=$PATH:/caminho/para/sratoolkit.current-ubuntu64/bin
```

### Exemplo 2: Usando SRA Toolkit para baixar dados de um SRA Accession (e.g., SRR10461876)
```
fastq-dump --split-files SRR10461876
```
### Isso gerará SRR10461876_1.fastq e SRR10461876_2.fastq
