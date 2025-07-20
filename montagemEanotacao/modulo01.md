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

Objetivo: Obter os reads brutos de sequenciamento (geralmente em formato FASTQ) que servirão como entrada para a montagem do genoma.

Ferramentas: wget ou fastq-dump (parte do SRA Toolkit)
Comandos (exemplo com fastq-dump para um SRA Accession):

```
# Instalar SRA Toolkit (verifique a versão mais recente no site do NCBI)
wget https://ftp.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -xzf sratoolkit.current-ubuntu64.tar.gz
export PATH=$PATH:$(pwd)/sratoolkit.current-ubuntu64/bin # Adiciona ao PATH temporariamente

# Criar diretório para os dados brutos
mkdir raw_data
cd raw_data

# Exemplo: Baixar dados de um SRA Accession (e.g., SRR10461876 para E. coli)
fastq-dump --split-files SRR10461876
# Isso gerará SRR10461876_1.fastq e SRR10461876_2.fastq (para reads pareados)
cd .. # Voltar ao diretório principal do curso
```
### Descrição Detalhada:

- SRA Toolkit: Este conjunto de ferramentas do NCBI (National Center for Biotechnology Information) é essencial para acessar dados de sequenciamento depositados no Sequence Read Archive (SRA), um dos maiores repositórios de dados genômicos.
  
- wget https://ftp.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz: Baixa o arquivo compactado do SRA Toolkit para sistemas Ubuntu de 64 bits. É importante verificar o link mais recente no site do NCBI, pois as versões são atualizadas.

- tar -xzf sratoolkit.current-ubuntu64.tar.gz: Descompacta o arquivo baixado. O x extrai, z descompacta com gzip, e f especifica o arquivo.

- export PATH=$PATH:$(pwd)/sratoolkit.current-ubuntu64/bin: Adiciona o diretório bin do SRA Toolkit à sua variável de ambiente PATH. Isso permite que você execute comandos como fastq-dump de qualquer lugar no terminal, sem precisar especificar o caminho completo para o executável. Esta adição é temporária para a sessão atual do terminal; para torná-la permanente, você precisaria adicioná-la ao seu arquivo .bashrc ou .profile.

- mkdir raw_data: Cria um diretório chamado raw_data para organizar os arquivos FASTQ brutos. Manter seus dados organizados é uma prática fundamental em bioinformática.

- cd raw_data: Entra no diretório raw_data.

- fastq-dump --split-files SRR10461876: Este é o comando principal para baixar os reads.

- fastq-dump: O programa do SRA Toolkit que converte dados do formato SRA para FASTQ.

- --split-files: Crucial para dados paired-end. Se os reads forem pareados (como é comum em sequenciamento Illumina), esta opção garante que os reads do forward (_1.fastq) e do reverse (_2.fastq) sejam salvos em arquivos separados. Isso é necessário para a maioria das ferramentas de montagem que esperam essa separação.

- SRR10461876: É o accession number (número de acesso) de um conjunto de dados no SRA. Você substituiria isso pelo accession do seu próprio conjunto de dados.

### 1.3 Avaliação da Qualidade dos Reads
Objetivo: Avaliar a qualidade dos reads brutos para identificar problemas como adaptadores de sequenciamento, bases de baixa qualidade, viés de GC e contaminação. Esta etapa é crítica para garantir que apenas dados de alta qualidade sejam usados na montagem.

Ferramentas: FastQC

Comandos:

```
sudo apt install -y fastqc
mkdir qc_raw
fastqc raw_data/*.fastq -o qc_raw/
```

Forma de Execução: Os relatórios HTML gerados em qc_raw/ devem ser abertos em um navegador web para inspeção visual. Você pode transferi-los para sua máquina local usando scp ou sftp se estiver em um servidor remoto, ou abri-los diretamente se estiver em uma máquina virtual com ambiente gráfico.

### Descrição Detalhada:

- sudo apt install -y fastqc: Instala a ferramenta FastQC.

- mkdir qc_raw: Cria um diretório dedicado para armazenar os relatórios de qualidade dos reads brutos.

- fastqc raw_data/*.fastq -o qc_raw/: Executa o FastQC em todos os arquivos .fastq dentro do diretório raw_data e direciona a saída (relatórios HTML e arquivos ZIP contendo os dados brutos do relatório) para o diretório qc_raw/.

### O que é Qualidade (Escala Phred): A qualidade de uma base em um read de sequenciamento é geralmente expressa usando a escala Phred. Um valor Phred (Q) é uma medida logarítmica da probabilidade de erro de uma base.

- `Q=−10`
- log_10(P), onde P é a probabilidade de a base estar incorreta.

- Um Q20 significa que a probabilidade de erro é de 1 em 100 (P=0.01), ou 99% de acurácia.

- Um Q30 significa que a probabilidade de erro é de 1 em 1000 (P=0.001), ou 99.9% de acurácia.

- Em geral, reads com qualidade Phred abaixo de Q20 (especialmente nas extremidades) são considerados de baixa qualidade e devem ser removidos ou trimados.

| Qualidade Phred (Q) | Probabilidade de Erro (P) | Precisão da Base (%) |
|---------------------|---------------------------|-----------------------|
| 10                  | 1 em 10                   | 90%                  |
| 20                  | 1 em 100                  | 99%                  |
| 30                  | 1 em 1.000                | 99,9%                |
| 40                  | 1 em 10.000               | 99,99%               |
| 50                  | 1 em 100.000              | 99,999%              |
| 60                  | 1 em 1.000.000            | 99,9999%             |


# Avaliação de Qualidade - FASTQC

Abaixo está uma imagem de exemplo de um gráfico de avaliação da qualidade das leituras (Per Base Sequence Quality) gerado pelo FastQC:

![Avaliação de Qualidade - FastQC](escolaveraoiwasai/blob/main/montagemEanotacao/AVQ.png)


### Interpretação dos Gráficos do FastQC:

Per Base Sequence Quality:

- Mostra a qualidade média de cada posição de base ao longo dos reads.

- Padrão ideal: A caixa de bigodes deve estar acima de Q30 (linha verde) em todas as posições, com pouca variação.

- Problemas: Quedas na qualidade nas extremidades 3' dos reads são comuns e esperadas. Qualidade baixa no início do read ou flutuações significativas indicam problemas no sequenciamento.

Per Sequence Quality Scores:

- Mostra a distribuição da qualidade média para cada read.

- Padrão ideal: Um pico alto em valores de alta qualidade (Q30+).

- Problemas: Um pico em valores de baixa qualidade indica muitos reads problemáticos.

Per Base Sequence Content:

- Mostra a porcentagem de cada base (A, T, C, G) em cada posição do read.

- Padrão ideal: Linhas planas e paralelas, indicando uma distribuição aleatória de bases.

- Problemas: Desvios significativos, especialmente no início dos reads, podem indicar contaminação por adaptadores ou problemas de sequenciamento.

Per Sequence GC Content:

- Mostra a distribuição do conteúdo de GC para todos os reads.

- Padrão ideal: Uma curva gaussiana (normal) centrada no conteúdo de GC esperado para o organismo.

- Problemas: Múltiplos picos podem indicar contaminação por outras espécies ou DNA de hospedeiro.

Sequence Length Distribution:

- Mostra a distribuição dos comprimentos dos reads.

- Padrão ideal: Um único pico no comprimento esperado dos reads (e.g., 150 bp para Illumina).

- Problemas: Múltiplos picos ou uma distribuição ampla podem indicar degradação da amostra ou problemas na biblioteca.

Adapter Content:

- Detecta a presença de sequências de adaptadores de sequenciamento.

- Padrão ideal: Linhas planas na parte inferior do gráfico (sem adaptadores detectados).

- Problemas: Curvas ascendentes indicam que adaptadores estão presentes e precisam ser removidos.


