#!/bin/bash
set -e
set -u
#set -o pipefail

if [ "$#" -lt 1 ]
  then
    echo "Usage: bash $0 <GenBank file>"
    echo "Example: bash $0 NC_000913.gbk"
    exit 1
fi

# Variables and Command Arguments
AC=$(basename $1 .gbk)

# Downloading a list of genome sequencing projects
if [ ! -e data/prokaryotes.txt ]; then curl ftp://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/prokaryotes.txt > data/prokaryotes.txt; fi

# Create directories
my_dir=analysis; mkdir -p $my_dir; cp $1 $my_dir; cd $my_dir; 

# Converting GenBank files to FASTA format with Biopython http://www2.warwick.ac.uk/fac/sci/moac/people/students/peter_cock/python/genbank2fasta/
python -c "from Bio import SeqIO; SeqIO.convert('$AC.gbk', 'genbank', '$AC.fna', 'fasta')"

# https://microbewiki.kenyon.edu/index.php/Legionella_pneumophila
Genus_Species_Strain=$(grep '^  ORGANISM  ' $AC.gbk | uniq | sed 's/  ORGANISM  //')
             Species=$(grep '^  ORGANISM  ' $AC.gbk | uniq | sed 's/  ORGANISM  //' | awk '{ print $2 }'); 
               Genus=$(grep '^  ORGANISM  ' $AC.gbk | uniq | sed 's/  ORGANISM  //' | awk '{ print $1 }'); 

grep -i '/product=' $AC.gbk | sort | uniq -c | sort -nr | head

# Generating Cover Letter
echo "
$(date "+%h %d, %Y")

Editorial Office  
Genome announcements

Dear Sir or Madam:

  We would like to submit the manuscript entitled 'Draft genome sequence of *$Genus_Species_Strain* isolated from deserts in Egypt.' by ***FIRST_AUTHOR*** et al. for publication in *Genome announcements*.  

  We determined the draft genome sequence of *$Genus_Species_Strain*. Estimated genome size and G+C content of the strain were close to those of a reference strain. The genome sequence data in this study will provide useful information for understanding the evolution of the *$Genus_Species_Strain*.  

  The manuscript has been seen and approved by all authors. We would be very grateful if you could consider this paper for publication in *Genome announcements*.

Yours sincerely,

***CORRESPONDING_AUTHOR***, Ph.D.  
Institute for Advanced Biosciences, Keio University  
Endo 5322, Fujisawa, Kanagawa, 252-8520, Japan  
Tel/Fax: +81-XXX-XX-XXXX  
E-mail: <orenomail@gmail.com>  
" > my_coverletter.md

# Generating Journal-Formatted Manuscript
echo "
- [INSTRUCTIONS TO AUTHORS: Genome Announcements](http://genomea.asm.org/site/misc/ifora.xhtml)
 - [Announcement Format](http://genomea.asm.org/site/misc/journal-ita_org.xhtml#link01)

----------

# Title page

#### Title  
Draft genome sequence of *$Genus_Species_Strain* isolated from deserts in Egypt.  

#### Running title  
Genome sequence of *$Genus_Species_Strain*  

#### Authors  
***CORRESPONDING_AUTHOR - #a, Taichi Hiraga-Keaton - bc, Jonathan Joestar - d, Joseph Joestar - d, Jotaro Kujo - d, and Dio Brando - d***

#### Affiliation  
a - Institute for Advanced Biosciences, Keio University, Japan.  
b - British Army, United Kingdom.  
c - University of Oxford, United Kingdom.  
d - WRYYYYYYY, MUDA MUDA, WEEKLY SHONEN JUMP, SHUEISHA Inc., Japan.  

#### Correspondent footnote  
\#Corresponding author. Mailing address: Institute for Advanced Biosciences, Keio University. Endo 5322, Fujisawa, Kanagawa, 252-8520, Japan. E-mail: <orenomail@gmail.com>.  

----------

# Abstract.
We report here the draft genome sequence of *$Genus_Species_Strain*. The genome sequence data in this study will provide useful information for understanding the evolution of the *$Genus_Species_Strain*.

# Main text
a brief report (limit of 500 words)

  ***INTRODUCTION.***
https://en.wikipedia.org/wiki/${Genus}_${Species}

$(perl ../scripts/automatic_introduction_maker.pl $AC.gbk)

https://microbewiki.kenyon.edu/index.php/${Genus}_${Species}

To study the evolution of the *$Genus_Species_Strain*, we determine the draft genome sequence of *$Genus_Species_Strain*.  

  ***EXPERIMENTS.*** Chromosomal DNA was extracted from an overnight culture of *$Genus_Species_Strain* using the [DNeasy Blood & Tissue Kit - QIAGEN](https://www.qiagen.com/jp/shop/sample-technologies/dna/dna-preparation/dneasy-blood-and-tissue-kit/). Whole-genome sequencing was performed using paired-end sequencing on [Illumina MiSeq Kit v3](http://www.illumina.com/products/miseq-reagent-kit-v3.html). The sequencer produced 300-bp paired-end reads that were obtained from 550-bp inserts.  

  ***BIOINFORMATICS.*** The quality of the reads was checked using [FastQC](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/), and the raw sequences were trimmed to 250 bp using [FASTX-Toolkit](http://hannonlab.cshl.edu/fastx_toolkit/). De novo genome assembly was performed using [SPAdes version 3.5.0](http://bioinf.spbau.ru/spades). After removal of possible contaminant sequences, the resulting assembly contains $(grep -c '^>' $AC.fna) contigs consisting of 
$(cat $AC.fna | perl -lane 'print join("\n", split(//)) if !/^>/' | sort | uniq -c | perl -lane '$F{$2}=$1 if/(\d+) (\w)/}{printf "%d bp, with a G+C content of %.1f %.", $F{A}+$F{T}+$F{G}+$F{C}, 100*($F{G}+$F{C})/($F{A}+$F{T}+$F{G}+$F{C})')
Genome annotation was performed using [Prokka v1.11](http://www.vicbioinformatics.com/software.prokka.shtml), yielding $(grep -c '^     tRNA            ' $AC.gbk) tRNA genes, $(grep -c '^     rRNA            ' $AC.gbk) rRNA genes, and $(grep -c '^     CDS             ' $AC.gbk) protein coding DNA sequences (CDS), of which $(grep -ci '\(putative\|uncharacterized\|hypothetical\).protein' $AC.gbk) are proteins of unknown function (putative, uncharacterized, or hypothetical).  

  ***CONCLUSION.*** The genome sequence data in this study will provide useful information for understanding the evolution of the *$Genus_Species_Strain*.  

  **Nucleotide sequence accession numbers.** The sequence has been deposited as a whole-genome shotgun project at DDBJ/EMBL/GenBank under the accession number [$AC](http://www.ncbi.nlm.nih.gov/Traces/wgs/?val=$AC).

# ACKNOWLEDGMENTS
This work was ***NOT*** supported by the National Institutes of Health, under grant number [AI084918-05](http://grantome.com/grant/NIH/R01-AI084918-05).
We thank Kazuharu Arakawa for his technical advice on the [G-language Genome Analysis Environment](http://www.g-language.org).

# REFERENCES
1. Pubmed ID for *$Genus $Species*: $(grep ${Genus}.${Species} ../data/prokaryotes.txt | cut -f25 | tr ',' '\n' | grep -v '-' | sort | uniq)
$(for PMID in $(grep ${Genus}.${Species} ../data/prokaryotes.txt | cut -f25 | tr ',' '\n' | grep -v '-' | sort | uniq); do echo -n '- '; echo $PMID | python ../scripts/pmid2ref.py; echo; done)

----------
" > my_genomea.md

echo "[$(date)] $0 has been successfully completed.

Genome Announcements formatted manuscript ($my_dir/my_genomea.md) and cover letter ($my_dir/my_coverletter.md)
"




