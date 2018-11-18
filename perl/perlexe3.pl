#!/usr/bin/perl
open(OUTFILE,">>combine.pl");
print OUTFILE "#!/usr/bin/perl\n";
foreach $file (`ls *.pl`){
	chop($file);
	open(INFILE,"$file");
	if (-x $file){	
	print OUTFILE "#".$file."combined by perlexe3.pl\n";
	while($_=<INFILE>){
		print OUTFILE if ($_ !~/^#!/);
	}
	}	
	close(INFILE);
}
close(OUTFILE);
