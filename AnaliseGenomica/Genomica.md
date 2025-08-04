# Análise de Funções Genômicas: antiSMASH e Resistência a Antibióticos

## Introdução

A análise genômica moderna permite identificar e caracterizar genes responsáveis pela produção de metabolitos secundários e resistência a antibióticos. Esta aula abordará duas ferramentas fundamentais: antiSMASH para descoberta de compostos bioativos e análises de genes de resistência.

## 1. antiSMASH Online - Descoberta de Metabolitos Secundários

### O que é o antiSMASH?

O antiSMASH (**anti**biotics & **S**econdary **M**etabolite **A**nalysis **SH**ell) é uma ferramenta computacional que identifica, anota e analisa clusters de genes de metabolitos secundários em genomas microbianos.

![Metabolitos secundarios](https://ars.els-cdn.com/content/image/1-s2.0-S2667064X22000707-gr1.jpg)

![Metabolitos secundarios 2](https://encyclopedia.pub/media/common/202303/mceclip0-640ac0aeb41b4.png)

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

![antiSMASH Web](https://docs.antismash.secondarymetabolites.org/img/region_display.png)

### Módulos Disponíveis na Interface Web

- **Gene cluster detection**: Detecção de clusters
- **Cluster comparison**: Comparação com banco de dados
- **Subclusters**: Análise de subclusters
- **Active site finder**: Localização de sítios ativos
- **Cluster blast**: Comparação por homologia


##4. ResFinder

![Genes de resistencia](https://www.researchgate.net/publication/340266119/figure/fig1/AS:874472089337856@1585501801246/Antibiotic-resistance-dissemination-mechanisms-and-pathways-A-Schematic-overview-of.png)

- Ferramenta específica para resistência
- Interface: https://cge.cbs.dtu.dk/services/ResFinder/
- Identifica genes de resistência conhecidos
