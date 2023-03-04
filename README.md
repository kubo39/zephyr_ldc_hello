# LDC on Zephyr: Hello!

## Prerequiresites

- LDC
- GNU Make

For Zephyr, read https://docs.zephyrproject.org/latest/develop/getting_started/index.html

For Qemu on Zephyr, read https://docs.zephyrproject.org/latest/develop/beyond-GSG.html#run-the-application-in-qemu

## How to build

```console
$ cd $ZEPHYR_BASE
$ west build -b qemu_cortex_m3 samples/ldc_hello
$ west build -t run
(...)
Hello from 'LDC'!
assertion "array index out of bounds" failed: file "d_src/hello.d", line 30 (hello.d_main)
exit
```

## Random Notes

### `multiple definition of `__assert'`

For arrayboundscheck, we defined a `__assert` function on `thumb7em-none-linux-gnueabi` target.

```d
private extern (C) noreturn __assert(const(char)* msg, const(char)* file, int line)
{
    assert_print("assertion \"%s\" failed: file \"%s\", line %d\n", msg, file, line);
    abort();
}
```

Without this, `assert(false)` shows a bizarre message.

```console
$ west build -t run
(...)
Hello from 'LDC'!
assertion "" failed: file "array index out of bounds", line 40362
```

However, we got this error messages.

```console
$ west build -b qemu_cortex_m3 samples/ldc_hello
(...)
/home/kubo39/.local/zephyr-sdk-0.15.2/arm-zephyr-eabi/bin/../lib/gcc/arm-zephyr-eabi/12.1.0/../../../../arm-zephyr-eabi/bin/ld.bfd: /home/kubo39/.local/zephyr-sdk-0.15.2/arm-zephyr-eabi/arm-zephyr-eabi/lib/thumb/v7-m/nofp/libc.a(lib_a-assert.o): in function `__assert':
assert.c:(.text.__assert+0x0): multiple definition of `__assert'; /home/kubo39/zephyrproject/zephyr/samples/ldc_hello/lib/libhello.a(hello.o):/home/kubo39/zephyrproject/zephyr/samples/ldc_hello/d_src/hello.d:19: first defined here
```

To avoid this, we use `__assert_fail` on Musl target.
