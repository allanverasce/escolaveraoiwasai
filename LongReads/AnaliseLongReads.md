# Tutorial Escola Iwasai para LongReads:

Este tutorial guia você passo a passo para realizar a análise de genoma usando dados de long reads (ONT ou PacBio), incluindo:

- Download dos dados  
- Visualização da qualidade das leituras  
- Filtragem básica das leituras  
- Montagem do genoma com Raven  
- Avaliação da montagem  
- Anotação do genoma com Prokka  

---

## 📥 1. Download dos Dados

Baixe o arquivo `myco.fastq.gz` com as leituras long reads:

[Google Drive — Dados de sequenciamento](https://drive.google.com/file/d/1yz0sCLLzDSiTwI0jKQFJJzLmoXNf-4QJ/view?usp=drive_link)

Para baixar direto no terminal (é necessário ter o `gdown` instalado):

```bash
pip install gdown
gdown https://drive.google.com/uc?id=1yz0sCLLzDSiTwI0jKQFJJzLmoXNf-4QJ
```

---

## ⚙️ 2. Instalação das Ferramentas

### 2.1 Instalar Raven

```bash
conda install -c bioconda raven-assembler
```

### 2.2 (Opcional) Criar e ativar ambiente Python para NanoPlot e NanoFilt

```bash
python3 -m venv longreads_env
source longreads_env/bin/activate
pip install --upgrade pip
pip install NanoPlot NanoFilt
```

### 2.3 Instalar outras ferramentas

```bash
sudo apt install seqkit
conda install -c bioconda prokka
```

---

## 📊 3. Visualização da Qualidade das Leituras com NanoPlot

```bash
NanoPlot --fastq myco.fastq.gz -o nanoplot_output --N50
```

Abra o relatório interativo no navegador:

```bash
firefox nanoplot_output/NanoPlot-report.html
```

---

## 🧼 4. Filtragem das Leituras com NanoFilt

Filtrar para manter leituras com:
- Comprimento mínimo: 1000 bp
- Qualidade média mínima: 9

```bash
zcat myco.fastq.gz | NanoFilt -l 1000 -q 9 | gzip > myco.filtered.fastq.gz
```

Ver estatísticas das leituras filtradas:

```bash
seqkit stats myco.filtered.fastq.gz
```

---

## 🧬 5. Montagem do Genoma com Raven

```bash
raven myco.filtered.fastq.gz > assembly.fasta
```

---

## 📈 6. Avaliação da Montagem

Obtenha estatísticas do assembly:

```bash
seqkit stats assembly.fasta
```

Conte o número de contigs:

```bash
grep -c ">" assembly.fasta
```

---

## 📝 7. Anotação do Genoma com Prokka

```bash
prokka assembly.fasta --outdir prokka_output --prefix myco --cpus 4
```

**Parâmetros importantes:**
- `--outdir prokka_output`: pasta para salvar resultados
- `--prefix myco`: prefixo dos arquivos de saída
- `--cpus 4`: número de threads (ajuste conforme seu computador)

---

