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
// See https://github.com/ldc-developers/ldc/blob/9976807e0e1acf24edfb4ba35d28c19a3f0227f2/gen/runtime.cpp#L377-L379
private extern (C) void __assert_fail(const(char)* msg, const(char)* file, int line, const(char)* func)
{
    assert_print("assertion \"%s\" failed: file \"%s\", line %d (%s)\n", msg, file, line, func);
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