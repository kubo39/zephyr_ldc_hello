# LDC on Zephyr: Hello!

## Prerequiresites

- LDC
- Dub

For Zephyr, read https://docs.zephyrproject.org/latest/develop/getting_started/index.html

For Qemu on Zephyr, read https://docs.zephyrproject.org/latest/develop/beyond-GSG.html#run-the-application-in-qemu

## How to build

```console
$ cd $ZEPHYR_BASE
$ west build -b qemu_cortex_m3 samples/ldc_hello
$ west build -t run
(...)
*** Booting Zephyr OS build zephyr-v3.3.0-592-gcaa88b2cfdf2 ***
Hello from 'LDC'!
from scope(exit).
TypeInfo arr: 'int[2]'
assertion "array index out of bounds" failed: file "d_src/hello.d", line 47, function: hello.d_main
exit
QEMU: Terminated
```

## Random Notes

### `__assert_fail` with Musl target

By default, `assert(false)` shows a bizarre message on `thumb7em-none-linux-gnueabi` target due to incompatible arguments.

```
// LDC: https://github.com/ldc-developers/ldc/blob/9976807e0e1acf24edfb4ba35d28c19a3f0227f2/gen/runtime.cpp#L367
//     void __assert(const char *msg, const char *file, unsigned line)
// newlib: https://github.com/bminor/newlib/blob/80cda9bbda04a1e9e3bee5eadf99061ed69ca5fb/newlib/libc/stdlib/assert.c#L68-L70
//     void __assert(const char *file, int line, const char *failedexpr)
```

```console
$ west build -t run
(...)
Hello from 'LDC'!
assertion "" failed: file "array index out of bounds", line 40362
```

LDC cannot handle this: https://github.com/ldc-developers/ldc/blob/master/driver/main.cpp#L625-L628

To avoid this, we use `__assert_fail` on Musl target and wraps newlib's `__assert_func`.
