#!/usr/bin/perl	-w
use strict;
chomp $ARGV[0];
open FH,$ARGV[0];			####epitopefile
my @lines = <FH>;
close FH;

open FH,$ARGV[1];			#####multi fasta one line proteinfile
my @lines2 = <FH>;
close FH;
my $conscount =0;
my $temp;
my $temp1;
for (my $i=0;$i<@lines;$i++)
	{	$conscount =0;
		my$conscount1 =0;
		chomp $lines[$i];
		close FH;
		open FH,">temp1.txt";
		print FH $lines[$i];
		close FH;
		open FH,">$lines[$i]";
		close FHu;
		my $fileepiUn = join ('_',$lines[$i],"u");
		open FHu,">$fileepiUn";
		for (my $j=0;$j<@lines2;$j++)
		{
	
			if ($lines2[$j] =~ /^>/)
			{
#				print "\n$lines2[$i]";
				next;
			}

			if ($lines2[$j]=~ /$lines[$i]/)
			{
				my $bj = $j-1;
	#			print FH "$lines2[$bj]\n$lines2[$j]\n$lines[$i]";
				print FH "$lines2[$bj]";
				$conscount =$conscount+1;	
				$temp = $lines2[$bj]
			}
			else
			{
				my $bnot = $j-1;
				$conscount1 =$conscount1+1;
	#			print FH "$lines2[$bj]\n$lines2[$j]\n$lines[$i]";
				print FHu "$lines2[$bnot]";
				$temp1 = $lines2[$bnot];
			}

			

		}print "$conscount\t$lines[$i]\t$temp";
		print "UN\t$conscount1\t$lines[$i]\t$temp";
		system ("perl 2setup_moredetails.pl temp1.txt >> resultonlyfly.txt");
		system ("rm temp1.txt");
	}
