
.PHONY: all clean

all: scripty

scripty: Main.hs
	ghc -o scripty Main.hs

clean:
	-rm Main.hi Main.o scripty

