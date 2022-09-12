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
