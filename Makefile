FLEX  = flex
BISON = bison
CXX   = g++

all:
	$(BISON) isotope.y
	$(FLEX) isotope.l
	$(CXX) lex.yy.c -o isotope
