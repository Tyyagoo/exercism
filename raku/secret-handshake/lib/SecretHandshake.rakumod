unit module SecretHandshake;

sub handshake ($n) is export {
    my @actions = "wink", "double blink", "close your eyes", "jump";
    my @filtered = @actions.kv.grep(-> $i, $v { ($n +> $i) +& 1 }).map(*[1]);
    return ($n +> 4) +& 1 ?? @filtered.reverse !! @filtered;
}