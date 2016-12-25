----------

Hidetoshi Itaya, Shohei Nagata, Haruo Suzuki  

Last Update: 2016-03-17  

----------

# Genome Announcement Project
Project started 2016-03-14 at [BH15.15](http://wiki.lifesciencedb.jp/mw/BH15.15).  

We developed a pipeline that uses GenBank format files (`.gbk`) as input data and automatically generates journal-formatted manuscripts and cover letters for submission to [Genome Announcements](http://genomea.asm.org).

## Project directories

    genomea/
     README.md: project documentation
     data/: contains sequence data in GenBank format
     scripts/: contains Shell, Perl, and Python scripts
     analysis/: contains results of data analyses

## Data

Draft genome sequence for *Legionella pneumophila* Bnt314 was downloaded on 2016-03-16 from <http://www.ncbi.nlm.nih.gov/Traces/wgs/?val=BBUG01> into `data/`, using:  

    AC='BBUG01'; wget -nv http://www.ncbi.nlm.nih.gov/Traces/wgs/?download=$AC.1.gbff.gz; 
    gunzip *.gz; mv index.html?download=$AC.1.gbff data/$AC.gbk

## Scripts

The Shell script `scripts/run_gbk2genomea.sh` automatically carries out the entire steps: creating directories, downloading data, and running the Perl and Python scripts (`scripts/automatic_introduction_maker.pl` and `scripts/pmid2ref.py`).

Let's run the driver script in the project's main directory `genomea/` with:

    bash scripts/run_gbk2genomea.sh data/BBUG01.gbk

This generates Genome Announcements formatted manuscript `analysis/my_genomea.md` and cover letter `analysis/my_coverletter.md`.

## Run environment

    Platform: x86_64-apple-darwin13.4.0 (64-bit)
    Running under: OS X 10.9.5 (Mavericks)
    perl 5, version 16, subversion 2 (v5.16.2) 
    Python 3.5.1 :: Anaconda 2.5.0 (x86_64)

## References
- [Genome Announcements](http://genomea.asm.org)
 - [INSTRUCTIONS TO AUTHORS: Genome Announcements](http://genomea.asm.org/site/misc/ifora.xhtml)
 - [Draft Genome Sequences of Five Legionella pneumophila Strains Isolated from Environmental Water Samples](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4432348/)
  - [TABLE 1. Accession no.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4432348/table/tab1/)

----------

## Steps

### Terminal
- Terminal.app の Settings > Advanced > Set locale environment variables on startup
- iTerm

### biopython
Installing [biopython](http://biopython.org) for `scripts/reannotate_gbk_mp.py`.

    pip install biopython

### w3m
Installing [w3m](http://www.g-language.org/wiki/) for `scripts/automatic_introduction_maker.pl`.

    brew install w3m

### G
Installing [G-language Genome Analysis Environment v.1.9.1](http://www.g-language.org/wiki/) on OS X.

    cd g-language-1.9.1
    
    $perl Makefile.PL
    # Please install 'gnuplot' seperately and try again.
    brew install gnuplot
    # Please install 'display' seperately and try again.
    brew install ImageMagick

    perl Makefile.PL
    make
    make test
    sudo make install

    $G
    # Can't locate GD.pm in @INC (@INC contains: 
    brew search cpanminus
    brew install cpanminus
    cpanminus GD
    cpanm GD
    sudo cpanm --force GD

### Prokka
Installing [Prokka through Homebrew](https://github.com/tseemann/prokka/blob/master/README.md#homebrew) on OS X.

    brew tap homebrew/science
    brew update
    brew install prokka > log.txt 2>&1 &
    cp log.txt log.brew_install_prokka.txt

[Test](https://github.com/tseemann/prokka/blob/master/README.md#test)

    prokka
    prokka --version
    prokka --listdb

[Invoking Prokka](https://github.com/tseemann/prokka/blob/master/README.md#invoking-prokka)

1st trial of running Prokka generated error:

    You have BioPerl 1.006001
    Please install BioPerl 1.006002 or higher

[Installing BioPerl](http://www.bioperl.org/wiki/Installing_BioPerl)
[From Git](http://www.bioperl.org/wiki/Using_Git) using:

    # check out the code into $HOME/src
    cd ~; mkdir src; cd src/
    git clone git://github.com/bioperl/bioperl-live.git

    # set this in `~/.bashrc`
    export PERL5LIB="$HOME/src/bioperl-live:$PERL5LIB"

    # test the version of BioPerl # 1.006925
    perl -MBio::Perl -le 'print Bio::Perl->VERSION;'

2nd trial of running Prokka generated error:

    Looking for 'minced' - found /usr/local/bin/minced
    Could not determine version of minced - please install version 1.6 or higher

Installing [MINCED (find CRISPRs)](https://github.com/ctSkennerton/minced/tree/master)

    cd ~/src/
    git clone https://github.com/ctSkennerton/minced.git
    cd minced/
    make

    echo 'export PATH=$HOME/src/minced:$PATH' >> ~/.bashrc

    rm /usr/local/bin/minced

[Download Java for Mac OS X](http://www.java.com/en/download/mac_download.jsp)
installed (Version 8 Update 73)

3rd trial of running Prokka generated error:

    Contig ID must <= 20 chars long: gnl|IAB|TY2482_contig000001
    Please rename your contigs or use --centre XXX to generate clean contig names.

I edited `/usr/local/Cellar/prokka/1.11_1/bin/prokka` as follows:

    cd /usr/local/Cellar/prokka/1.11_1/bin
    cp prokka prokka-2015-02-14 # backup Torsten Seemann's original script
    grep -n '${contigprefix}' prokka # before sed
    sed 's/${contigprefix}//' prokka > prokka-$(date +%F)
    chmod +x prokka-$(date +%F)
    rm prokka
    ln -s prokka-$(date +%F) prokka

    $diff prokka-2015-02-14 prokka-2016-03-11 
    423c423
    <     $seq->id( sprintf "gnl|$centre|${contigprefix}contig%06d", $ncontig );
    ---
    >     $seq->id( sprintf "gnl|$centre|contig%06d", $ncontig );

4th trial of running Prokka completed successfully.

----------
