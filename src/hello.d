import ldc.attributes : cold;

@nogc:
nothrow:

// newlib
extern (C)
{
    pragma(printf)
    int printf(scope const char* fmt, ...);
}

void scope_test()
{
    scope(exit) printf("from scope(exit).\n");
}

extern (C) noreturn d_main()
 {
    // using standard C library functions.
    printf("Hello from 'LDC'!\n");

    // using scope(exit).
    scope_test();

    // get typeinfo.
    int[2] arr;
    string typeinfo = typeof(arr).stringof;
    printf("TypeInfo arr: '%.*s'\n", cast(int) typeinfo.length, typeinfo.ptr);

    // double.
    printf("double value: %lf\n", 2.0 - 1.8);

    // arrayboundscheck.
    foreach (i; 0..3)
        arr[i]++;  // assertion "array index out of bounds" failed!

    while (true) {}
}
