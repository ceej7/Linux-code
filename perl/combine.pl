#!/usr/bin/perl
#perlexe1.plcombined by perlexe3.pl
$i=0;
while (<>) {
	chomp($_);
	@temp=split(//,$_);
	for ($j=0;$j<=$#temp;$j++) {
		if ($temp[$j] eq "(") {
		push(@line,$i);
		push(@num,$j);
		push(@pare,1);
		}
		elsif ($temp[$j] eq ")") {
			if($pare[$#pare-1]==1) {
				pop(@pare);
				print("matching parentheses appear at line ".pop(@line)." column ".pop(@num)." and line $i column $j\n");
			}
			else {
				push(@line,$i);
				push(@num,$j);
				push(@pare,0);
			}		
		}	
	}
	$i=$i+1;
}
foreach (@pare){	
	print("unmatching parenthese appreas at line ".pop(@line)." colunm ".pop(@num)."\n"); 
}
#perlexe2.plcombined by perlexe3.pl

print("Please input a list of binary numbers:\n");
$input=<STDIN>;
@list=split(/\s+/,$input);
chomp(@list);
foreach (@list) {
	if($_=~ /^[0-1]*\.?[0-1]+$/){
		$dnum=&compute($_);				
		printf("$_ \'s dec number is %.5f\n",$dnum);
	}
	else{
		print("$_ is not a binary number\n");
	}
}	

sub compute {
	my @num=split(//,@_[0]);
	my $len=$#num;
	my $i=index(@_[0],".");
	if ($i == -1){
		for ($j=0;$j<=$len;$j++){
			$sum+=$num[$j]*(2**($len-$j));
		}
	}
	else {
		for ($j=0;$j<$i;$j++){
			$sum+=$num[$j]*(2**($i-$j-1));
		}
		for ($p=($i+1);$p<=$len;$p++){
			$sum+=$num[$p]*((0.5)**($p-$i));
		}
	}
	return $sum;
}
			
		

#perlexe3.plcombined by perlexe3.pl
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
