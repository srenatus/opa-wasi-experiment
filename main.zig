const std = @import("std");
extern "policy" fn opa_eval(c_int, c_int, c_int, c_int, c_int, c_int, c_int) usize;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const result = opa_eval(0, 0, 0, 0, 0, 0, 0);
    const ptr = @intToPtr([*c]u8, result); // what's [c]?
    const s = std.mem.sliceTo(ptr, 0);
    try stdout.print("result: {s}", .{s});
}