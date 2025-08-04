#/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y build-essential wget git unzip screen default-jre
wget https://ftp.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -xzf sratoolkit.current-ubuntu64.tar.gz
chmod -R 777 sratoolkit.3.2.1-ubuntu64
cd sratoolkit.3.2.1-ubuntu64/bin
export PATH=$PATH:/home/monitor/dataiwasai/sratoolkit.3.2.1-ubuntu64/bin
cd /home/monitor/dataiwasai
sudo apt install -y fastqc
wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip
unzip Trimmomatic-0.39.zip
cd Trimmomatic-0.39
sudo apt install -y spades
conda create -n busco -c conda-forge -c bioconda busco
conda activate busco
wget https://busco-data.ezlab.org/v10/data/lineages/bacteria_odb10.2020-09-10.tar.gz
tar -xzf bacteria_odb10.2020-09-10.tar.gz
conda install matplotlib seaborn pandas
cd /home/monitor/dataiwasai
wget https://sanger-pathogens.github.io/Artemis/artemis.jar
git clone https://github.com/fenderglass/Flye
cd Flye
make
sudo apt install prokka
