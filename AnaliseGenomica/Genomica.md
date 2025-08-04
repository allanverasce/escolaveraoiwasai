# Análise de Funções Genômicas: antiSMASH e Resistência a Antibióticos

## Introdução

A análise genômica moderna permite identificar e caracterizar genes responsáveis pela produção de metabolitos secundários e resistência a antibióticos. Esta aula abordará duas ferramentas fundamentais: antiSMASH para descoberta de compostos bioativos e análises de genes de resistência.

## 1. antiSMASH Online - Descoberta de Metabolitos Secundários

### O que é o antiSMASH?

O antiSMASH (**anti**biotics & **S**econdary **M**etabolite **A**nalysis **SH**ell) é uma ferramenta computacional que identifica, anota e analisa clusters de genes de metabolitos secundários em genomas microbianos.

![antiSMASH Interface](https://antismash.secondarymetabolites.org/images/antismash_logo.svg)

### Tipos de Metabolitos Secundários Detectados

- **PKS** (Polyketide Synthases) - Policetídeos
- **NRPS** (Non-Ribosomal Peptide Synthetases) - Peptídeos não-ribossomais
- **Terpenos** - Compostos terpenóides
- **RiPPs** (Ribosomally synthesized and Post-translationally modified Peptides)
- **Outros** - Lantibióticos, bacteriocinas, sideróforos

## 2. Arquivos de Entrada Aceitos

### Formato GenBank (.gbk)
O formato GenBank contém sequências nucleotídicas com anotações detalhadas.

![Exemplo arquivo GBK](https://user-images.githubusercontent.com/53004506/61376046-3a698500-a898-11e9-98e9-b8edabe052e1.png)

**Características do formato GBK:**
- Contém metadados completos
- Inclui anotações de genes
- Informações de localização dos features
- Ideal para análises completas

### Formato EMBL (.embl)
Similar ao GenBank, usado principalmente na Europa.

### Formato FASTA (.fasta/.fa)
Formato mais simples, contendo apenas sequências.

![Exemplo arquivo FASTA](https://i0.wp.com/bioinformaticamente.com/wp-content/uploads/2021/01/Schermata-del-2021-01-16-15-20-40.png?resize=616%2C268&ssl=1)

**Características do formato FASTA:**
- Apenas sequência nucleotídica
- Header com identificador
- Requer predição de genes pelo antiSMASH


## 3. Interface Web do antiSMASH

### Passo a Passo para Análise Online

1. **Acesse**: https://antismash.secondarymetabolites.org/
2. **Upload do arquivo**: Formatos aceitos (.gbk, .embl, .fasta)
3. **Configurações**:
   - Selecionar taxon (bacteria/fungi)
   - Escolher módulos de análise
   - Definir parâmetros de rigor

![antiSMASH Web Interface](https://antismash.secondarymetabolites.org/images/antismash_overview.png)

### Módulos Disponíveis na Interface Web

- **Gene cluster detection**: Detecção de clusters
- **Cluster comparison**: Comparação com banco de dados
- **Subclusters**: Análise de subclusters
- **Active site finder**: Localização de sítios ativos
- **Cluster blast**: Comparação por homologia


##4. ResFinder

![Genes de resistencia](https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sciencedirect.com%2Ftopics%2Fengineering%2Fantibiotic-resistance-genes&psig=AOvVaw3vMyqr8wWmdwrJi-_qldPg&ust=1754435830205000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPDG9fik8o4DFQAAAAAdAAAAABAE)

- Ferramenta específica para resistência
- Interface: https://cge.cbs.dtu.dk/services/ResFinder/
- Identifica genes de resistência conhecidos
