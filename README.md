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
