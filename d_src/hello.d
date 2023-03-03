extern (C):
@nogc:
nothrow:

pragma(printf)
int printf(scope const char* fmt, ...);

noreturn d_main()
 {
    string ldc = "LDC";
    printf("Hello from '%.*s'!\n", cast(int)ldc.length, ldc.ptr);
    while (true) {}
}