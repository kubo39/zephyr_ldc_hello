.PHONY: all build cp clean

all: build cp

build:
	ldc2 --mtriple=thumbv7em-none-linux-gnueabi \
		--betterC --boundscheck=off \
		--defaultlib= \
		--float-abi=soft --lib \
		--relocation-model=static \
		-g -oflibapp.a \
		hello.d
	

cp:
	cp libapp.a ../../build/app/

clean:
	$(RM) libapp.a hello.o
