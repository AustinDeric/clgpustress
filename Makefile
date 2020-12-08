#####
# Makefile
# Mateusz Szpakowski
#####

.PHONY: all clean

LDFLAGS = -Wall
CXXFLAGS = -Wall -std=gnu++11 -Os -fexpensive-optimizations
# CXXFLAGS = -Wall -g -std=gnu++11
CXX = g++
LIBS = -lm -pthread -lpopt -lOpenCL

all: gpustress-cli

gpustress-cli: gpustress-cli.o gpustress-core.o clkernels.o
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -I${CURDIR} -o $@ $^ $(LIBS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -I${CURDIR} -c -o $@ $<

gpustress-cli.o: gpustress-cli.cpp gpustress-core.h cli.hpp
gpustress-core.o: gpustress-core.cpp gpustress-core.h cli.hpp

clean:
	rm -f *.o gpustress-cli gpustress-gui
