#!/usr/bin/perl	-w
use strict;
chomp $ARGV[0];
open FH,$ARGV[0];
my @lines = <FH>;
close FH;


my $conscount =0;
my $temp;
	my $jin = "u";
	my $prefixCs = "cs";
	my $prefixUs = "us";
		my %hash0;
		my %hash1;
for (my $i=0;$i<@lines;$i++)
	{
		chomp $lines[$i];	
		print "$lines[$i]\t";
		my $jin2= join('_',$lines[$i],$jin);
		my $prefixCs1= join('_',$lines[$i],$prefixCs);
		my $prefixUs1= join('_',$lines[$i],$prefixUs);
		system ("perl 3Pipenew_epistat1.pl $lines[$i] > $prefixCs1");
		system ("rm  $lines[$i]");
		open FH,"$prefixCs1";
		my @lines1 = <FH>;
		close FH;
		for (my $i1=1;$i1<@lines1;$i1++)
		{
			my @temp1 = split (/\t/,$lines1[$i1]);
			my $scler1 = $temp1[0];
			my $scler2 =$temp1[1];
			 chomp $scler2;
	#		print "$scler1\t$scler2\n";
			$hash0{"$scler1"} = $scler2;
			

			
		}
		system ("perl 3Pipenew_epistat1.pl $jin2 > $prefixUs1");
		#system ("rm  $jin2");
		open FH,"$prefixUs1";
		@lines1 = <FH>;
		close FH;		
		for (my $i1=1;$i1<@lines1;$i1++)
		{
			my @temp1 = split (/\t/,$lines1[$i1]);
			my $scler1 = $temp1[0];
			my $scler2 =$temp1[1];
			 chomp $scler2;
		#	print "$scler1\t$scler2\n";
			$hash1{"$scler1"} = $scler2;
			

			
		}


		my @common = ();
		foreach (keys %hash0) 
		{
			push(@common, $_);
		

		}
		my @aray = sort (@common);
		for (my $i1=0;$i1<@aray;$i1++)
		{
			my $scler1=$aray[$i1];
			my $conservation;
			my $scler2 = $hash0{"$scler1"};
			my$scler3=0;
			if ($hash1{"$scler1"})
			{$scler3 = $hash1{"$scler1"};}
			else
			{$scler3 = 0;$hash1{"$scler1"}=0;}
			if($scler2){
				$conservation = $scler2 /($scler2 + $scler3);
			#if ($scler1 =~/>/){print"TotalPresence=$scler2 ($scler3)\t";}
			print "$scler1=$conservation (($scler2//$scler3))\t ";}
			else {print "$scler1=0 (($scler2//$scler3))\t ";}
			delete $hash0{"$scler1"};
			delete $hash1{"$scler1"};
		}print"~~~";
		foreach my $key (sort keys %hash0){  print "~$key=$hash0{$key}\t";}
		foreach my $key (sort keys %hash1){  print "~$key=$hash1{$key}\t";}
undef %hash0;
undef %hash1;
#system ("rm Ptempfile.txt");
#system ("rm Ptempfile1.txt");
print"\n";
	}
