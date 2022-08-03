const std = @import("std");

extern "policy" fn opa_eval(c_int, c_int, c_int, c_int, c_int, c_int, c_int) usize;

// exported from "env"
// we get rid of the imports by stubbing them out
// the non-wasi imports also confuse wasmtime
export fn opa_builtin0(_: c_int) c_int { unreachable; }
export fn opa_builtin1(_: c_int, _: c_int) c_int { unreachable; }
export fn opa_builtin2(_: c_int, _: c_int, _: c_int) c_int { unreachable; }
export fn opa_builtin3(_: c_int, _: c_int, _: c_int, _: c_int) c_int { unreachable; }
export fn opa_builtin4(_: c_int, _: c_int, _: c_int, _: c_int, _: c_int) c_int { unreachable; }
export fn opa_abort(_: c_int)  void { unreachable; }

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const result = opa_eval(0, 0, 0, 0, 0, 0, 0); // These are just for demonstration purposes, obviously.
    const ptr = @intToPtr([*c]u8, result); // what's [c]?
    const s = std.mem.sliceTo(ptr, 0);
    try stdout.print("result: {s}", .{s});
}