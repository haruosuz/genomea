use strict;
use warnings;

use G;

my $file = shift;
my $gb = new G($file, 'no msg');
my $microbewiki = sprintf("https://microbewiki.kenyon.edu/index.php/%s_%s", $gb->{TAXONOMY}->{genus}, $gb->{TAXONOMY}->{species});
system("curl -s --insecure -L $microbewiki > $file.html");
my $content = `w3m -dump $file.html`;

my $start = "Description and significance";
my $end = "Genom.+ Structure";

foreach (split /\n/, $content) {
    if(/^$start/i../^$end/i) {
        if(!/($start)|($end)/ && length) {
            print "$_ ";
        }
    }
}
