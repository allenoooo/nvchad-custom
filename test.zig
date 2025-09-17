const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"Zig"});
    
    const numbers = [_]i32{ 1, 2, 3, 4, 5 };
    var sum: i32 = 0;
    for (numbers) |num| {
        sum += num;
    }
    try stdout.print("Sum: {d}\n", .{sum});
}