# LDC on Zephyr: Hello World

## Prerequiresites

- LDC (>=1.32.1)
- DUB

For Zephyr, read [Getting Started](https://docs.zephyrproject.org/latest/develop/getting_started/index.html)

For Qemu on Zephyr, read [QEMU](https://docs.zephyrproject.org/latest/develop/beyond-GSG.html#run-the-application-in-qemu)

## How to build

```console
$ source ~/zephyrproject/.venv/bin/activate
$ west build -b qemu_cortex_m3 app
$ west build -t run
*** Booting Zephyr OS build v4.0.0-4204-gcef0c1af0d8f ***
Hello from 'LDC'!
from scope(exit).
TypeInfo arr: 'int[2]'
double value: 0.200000
assertion "array index out of bounds" failed: file "src/hello.d", line 36, function: hello.d_main
abort()
QEMU: Terminated
```
