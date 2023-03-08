.PHONY: all build clean

ifeq (,$(LDC_TARGET))
LDC_TARGET=thumbv7em-none-linux-musl-gnueabi
endif

all: build

build:
	ldc2 --mtriple=$(LDC_TARGET) \
		--checkaction=C \
		--float-abi=soft \
		--lib \
		--nogc \
		--relocation-model=static \
		--preview=dip1000 \
		-g \
		-of=lib/libhello.a \
		d_src/hello.d

clean:
	$(RM) lib/libhello.a hello.o
