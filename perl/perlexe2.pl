#!/usr/bin/perl

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
			
		

