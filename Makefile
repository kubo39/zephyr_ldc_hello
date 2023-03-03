.PHONY: all build clean

ifeq (,$(LDC_TARGET))
LDC_TARGET=thumbv7em-none-linux-gnueabi
endif

all: build

build:
	ldc2 --mtriple=$(LDC_TARGET) \
		--betterC --boundscheck=off \
		--defaultlib= \
		--float-abi=soft --lib \
		--relocation-model=static \
		-g -of=lib/libhello.a \
		d_src/hello.d

clean:
	$(RM) lib/libhello.a hello.o
