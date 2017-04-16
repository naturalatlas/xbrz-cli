.PHONY: clean
all: dist/xbrz

CImg.h:
	curl -O https://raw.githubusercontent.com/dtschump/CImg/master/CImg.h

# final binary
dist/xbrz: xbrz/xbrz.o xbrz.o
	@mkdir -p dist
	g++ -o dist/xbrz xbrz/xbrz.o xbrz.o -ljpeg -lpthread `libpng-config --ldflags`

# xbrz library
xbrz/xbrz.o: xbrz/xbrz.cpp xbrz/xbrz.h
	g++ -std=c++11 -c -o xbrz/xbrz.o xbrz/xbrz.cpp -DNDEBUG

# xbrz command line wrapper
xbrz.o: CImg.h xbrz.cpp
	g++ -std=c++11 -c -o xbrz.o xbrz.cpp `libpng-config --I_opts`

clean:
	rm -rf *.o xbrz/*.o dist
