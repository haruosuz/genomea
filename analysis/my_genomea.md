
- [INSTRUCTIONS TO AUTHORS: Genome Announcements](http://genomea.asm.org/site/misc/ifora.xhtml)
 - [Announcement Format](http://genomea.asm.org/site/misc/journal-ita_org.xhtml#link01)

----------

# Title page

#### Title  
Draft genome sequence of *Legionella pneumophila* isolated from deserts in Egypt.  

#### Running title  
Genome sequence of *Legionella pneumophila*  

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
We report here the draft genome sequence of *Legionella pneumophila*. The genome sequence data in this study will provide useful information for understanding the evolution of the *Legionella pneumophila*.

# Main text
a brief report (limit of 500 words)

  ***INTRODUCTION.***
https://en.wikipedia.org/wiki/Legionella_pneumophila

The Legionellaceae are fastidious gram-negative bacteria that reside in aquatic environments all over the globe. In their natural environment, the Legionellaceae are intracellular parasites of free-living protozoa. These organisms may also inhabit man-made water distribution systems. The family Legionellaceae consists of a single genus, Legionella. More specifically, this genus includes the species Legionella pneumophila, which are non-encapsulated, aerobic bacilli. In addition to L. pneumophila, there are 41 other species in the genus and together these species divide into 64 serogroups. Within the species L. pneumophila, human infection is caused primarily (but not exclusively) by a limited number of serogroups—serogroups 1, 4, and 6. L. pneumophila is the most frequent cause of human legionellosis, better known as Legionnaire’s disease in the Legionellaceae family. It is also a relatively common cause of community-acquired and nosocomial pneumonia in adults. (1) And L. pneumophila serogroup 1 alone is responsible for 70-90% of cases. (2) The Legionellaceae were not documented until 1976, when a detrimental outbreak of pneumonia occurred in Philadelphia at an American Legion Convention. (Fraser et al., 1977; Tsai et al., 1979). Thirty four of the 221 people who became ill after exposure died within the first few weeks after the convention. The culprit, L. pneumophila, was isolated first by inoculation of postmortem lung tissue into guinea pigs and then by subculture into a rich artificial medium (McDade et al., 1977). Then by indirect immunofluorescent antibody assay, it was found that over 90% of those that fell ill had at least four times the concentration of antibody in the blood (fourfold rise in titer) against this organism. The same method was used to screen previously saved sera from earlier outbreaks of unexplained respiratory disease and they discovered that a number of them were associated with seroconversion to L. pneumophila, including a “rickettsia-like” organism, isolated by guinea pig inoculation from the blood of a feverish patient in 1947, which today is recorded as the earliest known isolate of L. pneumophila. (1) 

https://microbewiki.kenyon.edu/index.php/Legionella_pneumophila

To study the evolution of the *Legionella pneumophila*, we determine the draft genome sequence of *Legionella pneumophila*.  

  ***EXPERIMENTS.*** Chromosomal DNA was extracted from an overnight culture of *Legionella pneumophila* using the [DNeasy Blood & Tissue Kit - QIAGEN](https://www.qiagen.com/jp/shop/sample-technologies/dna/dna-preparation/dneasy-blood-and-tissue-kit/). Whole-genome sequencing was performed using paired-end sequencing on [Illumina MiSeq Kit v3](http://www.illumina.com/products/miseq-reagent-kit-v3.html). The sequencer produced 300-bp paired-end reads that were obtained from 550-bp inserts.  

  ***BIOINFORMATICS.*** The quality of the reads was checked using [FastQC](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/), and the raw sequences were trimmed to 250 bp using [FASTX-Toolkit](http://hannonlab.cshl.edu/fastx_toolkit/). De novo genome assembly was performed using [SPAdes version 3.5.0](http://bioinf.spbau.ru/spades). After removal of possible contaminant sequences, the resulting assembly contains 80 contigs consisting of 
3470989 bp, with a G+C content of 38.2 %.
Genome annotation was performed using [Prokka v1.11](http://www.vicbioinformatics.com/software.prokka.shtml), yielding 40 tRNA genes, 6 rRNA genes, and 3105 protein coding DNA sequences (CDS), of which 1004 are proteins of unknown function (putative, uncharacterized, or hypothetical).  

  ***CONCLUSION.*** The genome sequence data in this study will provide useful information for understanding the evolution of the *Legionella pneumophila*.  

  **Nucleotide sequence accession numbers.** The sequence has been deposited as a whole-genome shotgun project at DDBJ/EMBL/GenBank under the accession number [BBUG01](http://www.ncbi.nlm.nih.gov/Traces/wgs/?val=BBUG01).

# ACKNOWLEDGMENTS
This work was ***NOT*** supported by the National Institutes of Health, under grant number [AI084918-05](http://grantome.com/grant/NIH/R01-AI084918-05).
We thank Kazuharu Arakawa for his technical advice on the [G-language Genome Analysis Environment](http://www.g-language.org).

# REFERENCES
1. Pubmed ID for *Legionella pneumophila*: 15448271
15467720
17888731
20236513
20833813
21873199
22374950
23792742
23826259
24948769
25573935
25977442
26840151
- Chien M, Morozova I, Shi S, Sheng H, Chen J, Gomez SM, Asamani G, Hill K, Nuara J, Feder M, Rineer J, Greenberg JJ, Steshenko V, Park SH, Zhao B, Teplitskaya E, Edwards JR, Pampou S, Georghiou A, Chou IC, Iannuccilli W, Ulz ME, Kim DH, Geringer-Sameth A, Goldsberry C, Morozov P, Fischer SG, Segal G, Qu X, Rzhetsky A, Zhang P, Cayanis E, De Jong PJ, Ju J, Kalachikov S, Shuman HA, Russo JJ. 2004. The genomic sequence of the accidental pathogen Legionella pneumophila. Science. 305:1966-1968.
- Cazalet C, Rusniok C, Bruggemann H, Zidane N, Magnier A, Ma L, Tichit M, Jarraud S, Bouchier C, Vandenesch F, Kunst F, Etienne J, Glaser P, Buchrieser C. 2004. Evidence in the Legionella pneumophila genome for exploitation of host cell functions and high genome plasticity. Nat Genet. 36:1165-1173.
- Glockner G, Albert-Weissenberger C, Weinmann E, Jacobi S, Schunder E, Steinert M, Hacker J, Heuner K. 2008. Identification and characterization of a new conjugation/type IVA secretion system (trb/tra) of Legionella pneumophila Corby localized on two mobile genomic islands. Int J Med Microbiol. 298:411-428.
- D'Auria G, Jimenez-Hernandez N, Peris-Bondia F, Moya A, Latorre A. 2010. Legionella pneumophila pangenome reveals strain-specific virulence factors. BMC Genomics. 11:181.
- Schroeder GN, Petty NK, Mousnier A, Harding CR, Vogrin AJ, Wee B, Fry NK, Harrison TG, Newton HJ, Thomson NR, Beatson SA, Dougan G, Hartland EL, Frankel G. 2010. Legionella pneumophila strain 130b possesses a unique combination of type IV secretion systems and novel Dot/Icm secretion system effector proteins. J Bacteriol. 192:6001-6016.
- O'Connor TJ, Adepoju Y, Boyd D, Isberg RR. 2011. Minimization of the Legionella pneumophila genome reveals chromosomal regions involved in host range expansion. Proc Natl Acad Sci U S A. 108:14733-14740.
- Amaro F, Gilbert JA, Owens S, Trimble W, Shuman HA. 2012. Whole-genome sequence of the human pathogen Legionella pneumophila serogroup 12 strain 570-CO-H. J Bacteriol. 194:1613-1614.
- Ma J, He Y, Hu B, Luo ZQ. 2013. Genome Sequence of an Environmental Isolate of the Bacterial Pathogen Legionella pneumophila. Genome Announc. 1:.
- Khan MA, Knox N, Prashar A, Alexander D, Abdel-Nour M, Duncan C, Tang P, Amatullah H, Dos Santos CC, Tijet N, Low DE, Pourcel C, Van Domselaar G, Terebiznik M, Ensminger AW, Guyard C. 2013. Comparative Genomics Reveal That Host-Innate Immune Responses Influence the Clinical Prevalence of Legionella pneumophila Serogroups. PLoS One. 8:e67298.
- Okamoto A, Lee H, Yabutani M, Yamada K, Ohta M. 2014. Draft Genome Sequence of a Legionella pneumophila Serogroup 4 Strain Causing Legionellosis. Genome Announc. 2:.
- Morrison SS, Kozak-Muiznieks NA, Sammons S, Rowe LA, Frace M, Winchell JM. 2015. Draft Genome Sequence of Legionella pneumophila D-5864, a Serogroup 6 Strain. Genome Announc. 3:.
- Watanabe K, Suzuki H, Nakao R, Shimizu T, Watarai M. 2015. Draft Genome Sequences of Five Legionella pneumophila Strains Isolated from Environmental Water Samples. Genome Announc. 3:.
- Correia AM, Ferreira JS, Borges V, Nunes A, Gomes B, Capucho R, Goncalves J, Antunes DM, Almeida S, Mendes A, Guerreiro M, Sampaio DA, Vieira L, Machado J, Simoes MJ, Goncalves P, Gomes JP. 2016. Probable Person-to-Person Transmission of Legionnaires' Disease. N Engl J Med. 374:497-498.

----------

