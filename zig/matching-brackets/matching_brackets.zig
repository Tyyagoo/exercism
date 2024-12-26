const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var stack = std.ArrayList(u8).init(allocator);
    defer stack.deinit();

    for (s) |b| {
        switch (b) {
            '(', '{', '[' => try stack.append(b),
            ')', '}', ']' => if (!isMatching(stack.popOrNull(), b)) return false,
            else => {},
        }
    }

    return stack.items.len == 0;
}

fn isMatching(opening: ?u8, closing: u8) bool {
    return (opening == '(' and closing == ')') or
           (opening == '{' and closing == '}') or
           (opening == '[' and closing == ']');
}
