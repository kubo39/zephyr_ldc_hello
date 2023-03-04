@nogc:
nothrow:

extern (C)
{
    pragma(printf)
    int printf(scope const char* fmt, ...);

    pragma(printf)
    void assert_print(scope const char* fmt, ...);

    void abort();
}

// Due to multiple definition __assert error, we use musl target here.
// See https://github.com/dlang/dmd/blob/d1b4eec3134e2798d3935ef8d8d1622a8255cfc0/compiler/src/dmd/e2ir.d#L6942
extern (C) void __assert_fail(const(char)* msg, const(char)* file, int line, const(char)* func)
{
    assert_print("assertion \"%s\" failed: file \"%s\", line %d\n", msg, file, line);
    abort();
}

extern (C) noreturn d_main()
 {
    string ldc = "LDC";
    printf("Hello from '%.*s'!\n", cast(int)ldc.length, ldc.ptr);
    int[2] arr;
    int x;
    foreach (i; 0..3)
        x = arr[i];
    while (true) {}
}