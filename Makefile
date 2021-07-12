FLEX = flex
CXX  = g++

all:
	$(FLEX) isotope.l
	$(CXX) lex.yy.c -o isotope
