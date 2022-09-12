 ##    ##   ##    ##   ##        ##   ## ##       ## ##      ##    ##   ##        ##   ##        ##   ## ## ##    ## ##    
 ##    ##   ##    ##   ## ##  ## ##   ##    ##    ##   ##    ##    ##   ## ##  ## ##   ## ##  ## ##   ##          ##   ##  
 ## ## ##   ##    ##   ##   ##   ##   ##     ##   ## ##      ##    ##   ##   ##   ##   ##   ##   ##   ## ## ##    ## ##    
 ##    ##   ##    ##   ##        ##   ##    ##    ##  ##     ##    ##   ##        ##   ##        ##   ##          ##   ##   
 ##    ##   ## ## ##   ##        ##   ## ##       ##    ##   ## ## ##   ##        ##   ##        ##   ## ## ##    ##    ##  
 ==    ==   == == ==   ==        ==   == ==       ==    ==   == == ==   ==        ==   ==        ==   == == ==    ==    ==    
 ==    ==   ==    ==   ==        ==   ==    ==    ==  ==     ==    ==   ==        ==   ==        ==   ==          ==   ==  
 == == ==   ==    ==   ==   ==   ==   ==     ==   == ==      ==    ==   ==   ==   ==   ==   ==   ==   == == ==    == ==    
 ==    ==   ==    ==   == ==  == ==   ==    ==    ==   ==    ==    ==   == ==  == ==   == ==  == ==   ==          ==   ==   
 ==    ==   ==    ==   ==        ==   == ==       == ==      ==    ==   ==        ==   ==        ==   == == ==    == ==  


# humdrummer
Convert minimap2 transcript alignments to GFF gene models for pleasant viewing in genome browsers like IGV.

# Current Version
0.0.2, 20220912

# Dependencies
- awk (this should be already available)
- perl (according to requirements of humming/convert.pl and gff3sort.pl)
- python3
- BEDtools ( this dependency can be done away with easily in the future as humdrummer only uses sortBed )

# Provided dependencies
- minimap2 ( can optionally install, or point humdrummer to your installation )
- gff3sort.pl
- convert.pl (from Humming)




# Installation
- All but the provided Minimap2 is ready to go.
- To install, simply do: 
```
bash install.sh
```
- Installing Minimap2 is optional. 
- However, note that HumDrummer looks to use the provided copy by default.
- If you do not install the provided Minimap2, you may provide a path to your copy ( -m /path/to/minimap2 ) or tell it to find it ( -m which ).



# Quick Start
	If you already have the transcript alignments in PAF format:
		`humdrummer -i /path/to/alignments.paf [-z] [-l] [-m]`

	If you have transcript FASTA (and genome FASTA):
		`humdrummer -t /path/to/transcripts.fasta -g /path/to/genome.fasta [-z] [-l] [-m]`


# Detailed Usage




```
	Options:

	-i	PAFMODE : Input PAF. Typically full-length transcripts aligned to a genome with Minimap2 (see example below). 
			  Can be any PAF though (e.g. long reads).
			  Not compatible with -t/-g.
	-t	FULLMODE: Transcript (query) sequences in FASTA format. Also need -g. Do not use -i.
	-g	FULLMODE: Genome (target/subject/reference) sequence in FASTA format. Also need -t. Do not use -i.
	-z	Optional. Save intermediate files.
	-l	Optional. Assume given transcript/query sequences are low quality. Tells minimap2 to use splice, not splice:hq.
	-m	Optional. Provide /Path/to/desired/minimap2. Use \"which\" to find it in env.



	Pipeline notes:
	- Minimap2 alignments of high quality transcript sequences.
		- minimap2 -y -c -x splice:hq genome.fasta transcripts.fasta > transcripts.paf
			- <y> Copy input FASTA/Q comments to output.
			- <c> Output CIGAR in PAF; also has the side-effect of improved alignments.
			- <x> preset; use splice:hq for high-quality transcript sequences, and splice for lower quality sequences or those from another species.
	- Hummdrummer outputs a GFF formatted such that the IGV genome browser shows the alignments as connected gene models to see gene structures.
		- humdrummer -i transcripts.paf
	

	Use cases:
	- Viewing transcript alignments as gene model structures in genome browsers:
	- High quality transcripts may be from:
		- De novo transcriptome assemblies.
		- A previous genome annotation, or annotation on a different genome assembly version.
		- High-accuracy long-read sequencing (PacBio-HiFi, Nanopore Q20/Q30).
	- Lower quality transcript sequences may be from:
		- Low quality transcriptome assemblies or sanger sequence reads
		- Lower-accuracy long reads.
		- High quality transcript sequences from a different species.
		- An annotation from an error-prone genome assembly.
	- Transcript alignment PAF files came from Minimap2 for the development of this script.
		- One should be able to use other tools though, so long as it gives a proper PAF file.

	Citation:
	- This script was developed to convert Illumina-based Trinity de novo transcriptome assembly Minimap2 alignments ...
		- ... to viewable gene models on various versions of the Bradysia coprophila genome (Bcop_v1, Bcop_v2, etc).
	- It is free to use, further develop, criticize, etc.
	- Feel free to cite this github repo if you find it helpful in your own research.



	Output:
		Default:	pre.gff	- Final sorted GFF with exon and transcript coordinates.
		Default:	pre.paf			- If PAF made as part of humdrummer, then it is also saved.

	Extra outputs with 'save intermediates' (-z) option:
		[1]		pre_01-init.gff		- Output of humming.
		[2]		pre_02-exons.gff	- Reformatted.
		[3]		pre_03-transcripts.gff	- Extrapolated from exons.
		[4]		pre_04-unsorted.gff	- Combined transcripts and exons before gff3sort.
```
