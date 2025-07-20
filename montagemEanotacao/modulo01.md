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
wget https://ftp.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz: Baixa o arquivo compactado do SRA Toolkit para sistemas Ubuntu de 64 bits. É importante verificar o link mais recente no site do NCBI, pois as versões são atualizadas.

- tar -xzf sratoolkit.current-ubuntu64.tar.gz: Descompacta o arquivo baixado. O x extrai, z descompacta com gzip, e f especifica o arquivo.

- export PATH=$PATH:$(pwd)/sratoolkit.current-ubuntu64/bin: Adiciona o diretório bin do SRA Toolkit à sua variável de ambiente PATH. Isso permite que você execute comandos como fastq-dump de qualquer lugar no terminal, sem precisar especificar o caminho completo para o executável. Esta adição é temporária para a sessão atual do terminal; para torná-la permanente, você precisaria adicioná-la ao seu arquivo .bashrc ou .profile.

- mkdir raw_data: Cria um diretório chamado raw_data para organizar os arquivos FASTQ brutos. Manter seus dados organizados é uma prática fundamental em bioinformática.

- cd raw_data: Entra no diretório raw_data.

- fastq-dump --split-files SRR10461876: Este é o comando principal para baixar os reads.

- fastq-dump: O programa do SRA Toolkit que converte dados do formato SRA para FASTQ.

- --split-files: Crucial para dados paired-end. Se os reads forem pareados (como é comum em sequenciamento Illumina), esta opção garante que os reads do forward (_1.fastq) e do reverse (_2.fastq) sejam salvos em arquivos separados. Isso é necessário para a maioria das ferramentas de montagem que esperam essa separação.

- SRR10461876: É o accession number (número de acesso) de um conjunto de dados no SRA. Você substituiria isso pelo accession do seu próprio conjunto de dados.





