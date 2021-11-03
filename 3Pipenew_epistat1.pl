#!/usr/bin/perl	-w
use strict;


my @lines = @ARGV;



my $conscount =0;
my $temp;
for (my $i=0;$i<@lines;$i++)
	{	$conscount =0;
		chomp $lines[$i];
		#print "\n$lines[$i]\n";
		print "$lines[$i]\t";
		my $s1 = "./";
		my $fileepi = "$lines[$i]";
		
		$fileepi = join('',$s1,$lines[$i]);
		open FH,"$fileepi";
		my @linesj = <FH>;
		close FH;
		
		my %hash0;
		my %hash1;
		my %hash2;
		my %hash3;
		my %hash4;
		$hash1{'2019-12'} = "0";
		$hash1{'2020-01'} = "0";
		$hash1{'2020-02'} = "0";
		$hash1{'2020-03'} = "0";
		$hash1{'2020-04'} = "0";
		$hash1{'2020-05'} = "0";
		$hash1{'2020-06'} = "0";
		$hash1{'2020-07'} = "0";
		$hash1{'2020-08'} = "0";
		$hash1{'2020-09'} = "0";
		$hash1{'2020-10'} = "0";
		$hash1{'2020-11'} = "0";
		$hash1{'2020-12'} = "0";
		$hash1{'2021-01'} = "0";
		$hash1{'2021-02'} = "0";
		$hash1{'2021-03'} = "0";
		$hash1{'2021-04'} = "0";
		$hash1{'2021-05'} = "0";
		$hash1{'2021-06'} = "0";
		$hash1{'2021-07'} = "0";
		$hash1{'2021-08'} = "0";
		$hash1{'2021-09'} = "0";
		for(my $j=0;$j<@linesj;$j++)
		{
			my @tmp_1 = split (/\|/,$linesj[$j]);
			my $tmp_2 = $tmp_1[0];			#protien name
			if ($hash0{"$tmp_2"})
			{
				$hash0{"$tmp_2"}++;

			}else{ $hash0{"$tmp_2"} = "1" }

								#date

			my @tmp_date = split (/\-/,$tmp_1[2]);
			$tmp_2 = join('-',$tmp_date[0],$tmp_date[1]);
			
			if ($hash1{"$tmp_2"})
			{
				$hash1{"$tmp_2"}++;

			}else{ $hash1{"$tmp_2"} = "1" }

			$tmp_2 = $tmp_1[6];			#host
			if ($hash1{"$tmp_2"})
			{
				$hash1{"$tmp_2"}++;

			}else{ $hash1{"$tmp_2"} = "1" }
			if ($tmp_1[10])
			{
				$tmp_2 = $tmp_1[10];}else {$tmp_2 ="nocountry";}			#country
				chomp $tmp_2 ;
			if ($hash2{"$tmp_2"})
			{
				$hash2{"$tmp_2"}++;

			}else{ $hash2{"$tmp_2"} = "1" }
			
			if($linesj[$j] =~/\:$/)
			{
				$tmp_2 = pop @tmp_1;
				chomp $tmp_2;
			}else{next;}
			if ($hash4{"$tmp_2"})
			{
				$hash4{"$tmp_2"}++;

			}else{ $hash4{"$tmp_2"} = "1" }

		}
			print "\n";
			foreach my $key (sort keys %hash3){  print "$key\t$hash3{$key}\n";}
			
			foreach my $key (sort keys %hash0){  print "$key\t$hash0{$key}\n";}
		
			foreach my $key (sort keys %hash1){  print " $key\t$hash1{$key}\n";}

			foreach my $key (sort keys %hash4){  print " $key\t$hash4{$key}\n";}

			#foreach my $key (sort keys %hash2){  print "$key\t$hash2{$key}\n";}
			#print "\n";

		#my @aray1 = `awk -F \\| \'\{print\$1\}\' $lines[$i] \| sort \|uniq  `;
		




	}
