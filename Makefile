## Nice little makefile i hacked together from different sources
## Everything thats commented out is optional, for bigger projects maybe nescessary
## 2023 Granilla Péter

CXX=g++
CXXFLAGS=-O2 -Wall -Werror #-I$(IDIR)
LIBS=#-lm

IDIR=include
#LIBDIR=lib
OBJDIR=obj

_DEPS=
DEPS=$(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ=program.o
OBJ=$(patsubst %,$(OBJDIR)/%,$(_OBJ))

$(OBJDIR)/%.o: %.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

program: $(OBJ)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)

$(OBJ): | $(OBJDIR)
$(OBJDIR):
	mkdir $(OBJDIR)

.PHONY: clean
clean:
	rm -fr $(OBJDIR)/*.o program *~ core $(IDIR)/*~