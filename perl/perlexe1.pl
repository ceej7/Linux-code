#!/usr/bin/perl
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
