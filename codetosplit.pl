#!/usr/bin/perl	-w
use strict;
chomp $ARGV[0];
open FH,$ARGV[0];			####epitopefil
chomp $ARGV[1];
my @lines = <FH>;
close FH;
my $tmprryfile = "fil_tem.txt";


for (my $i=0;$i<@lines;$i++)
	{
		open FH,">$tmprryfile";
		print FH "$lines[$i]";	
		my @temp = split(/\s+/,$lines[$i]);	
		close FH;
		$temp[0] =~ s/>/P/;
		system ("perl /media/food/DATADRIVE2/gisaid/datanalysis/codes/fastaextractfromidandlength.pl  fil_tem.txt $ARGV[1] > $temp[0]");
		system ("rm fil_tem.txt");

	}

