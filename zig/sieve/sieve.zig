const std = @import("std");

pub fn primes(buffer: []u32, comptime limit: u32) []u32 {
    if (limit < 2) return &.{};
    var prime_count: usize = 0;

    var set = std.StaticBitSet(limit).initFull();

    for (2..(limit + 1)) |i| {
        if (!set.isSet(i - 2)) continue;
        buffer[prime_count] = @intCast(i);
        prime_count += 1;

        var j = i * i;
        while (j <= limit) {
            set.unset(j - 2);
            j += i;
        }
    }

    return buffer[0..prime_count];
}
