# LDC on Zephyr: Hello!

Currently, runs on Qemu:Cortex-M3 only.

## Prerequiresites

- LDC
- GNU Make

For Zephyr, read https://docs.zephyrproject.org/latest/develop/getting_started/index.html

For Qemu on Zephyr, read https://docs.zephyrproject.org/latest/develop/beyond-GSG.html#run-the-application-in-qemu

### How to build

```console
$ cd $ZEPHYR_BASE
$ west build -b qemu_cortex_m3 samples/hello_world
$ make -C samples/ldc_hello
$ west build -t run
(...)
Hello from D!
```
