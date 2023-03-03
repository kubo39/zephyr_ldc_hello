.PHONY: all build clean

all: build

build:
	ldc2 --mtriple=thumbv7em-none-linux-gnueabi \
		--betterC --boundscheck=off \
		--defaultlib= \
		--float-abi=soft --lib \
		--relocation-model=static \
		-g -of=lib/libhello.a \
		d_src/hello.d

clean:
	$(RM) lib/libhello.a hello.o
