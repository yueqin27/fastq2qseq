#!/share/apps/bin/perl

use strict;


if ( ( scalar @ARGV ) eq 0 && ( -t STDIN ) )
    {
        die "'fastq2qseq.pl < fastq file >' OR '| fastq2qseq.pl'\n";
    }


while (<>)
    {
        s/^@//; chomp;
        my $Seq = <>; chomp $Seq;
        <>;
        my $Qual = <>; chomp $Qual;

	$_=~s/\s+/:/g;
        my@line=split/:/,$_;
#	print $_,"\t",foreach(@line);
#	print "$Seq\t$Qual\t1\n";
	print "$line[0]\t$line[1]\t$line[3]\t$line[4]\t$line[5]\t$line[6]\t$line[10]\t$line[7]\t$Seq\t$Qual\t1\n";
    }
