const std = @import("std");

fn fizzBuzz(stop_at: u32) !void {
    var i: u32 = 1;
    while (i <= stop_at) : (i += 1) {
        if (i % 3 == 0) {
            std.debug.print("Fizz", .{});
        }

        if (i % 5 == 0) {
            std.debug.print("Buzz", .{});
        }

        if (!(i % 3 == 0) and !(i % 5 == 0)) {
            std.debug.print("{}", .{i});
        }

        std.debug.print("\n", .{});
    }
}

pub fn main() !void {
    const stop_at: u32 = 1000000;
    var timer = try std.time.Timer.start();
    try fizzBuzz(stop_at);
    const time = timer.read();

    const seconds = @as(f64, @floatFromInt(time)) / std.time.ns_per_s;
    std.debug.print("\nTime taken: {d:.6}s\n", .{seconds});
}

test "benchmark fizzbuzz" {
    const stop_at: u32 = 1000000;
    var timer = try std.time.Timer.start();
    try fizzBuzz(stop_at);
    const time = timer.read();

    const seconds = @as(f64, @floatFromInt(time)) / std.time.ns_per_s;
    std.debug.print("\nTest benchmark time: {d:.6}s\n", .{seconds});
}
