extern (C):
@nogc:
nothrow:

pragma(printf)
void printk(scope const char* fmt, ...);

noreturn main()
 {
    string ldc = "LDC";
    printk("Hello from '%.*s'!\n", cast(int)ldc.length, ldc.ptr);
    while (true) {}
}