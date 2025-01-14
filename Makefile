GS = -Wall -Wextra
LDFLAGS = -pthread
TARGTDIR = bin/
SRCDIR = src/

all: myclient myserver

myclient: $(TARGTDIR)myclient.o
	$(CXX) $(CXXFLAGS) -o $(TARGTDIR)myclient $(TARGTDIR)myclient.o $(LDFLAGS)

myserver: $(TARGTDIR)myserver.o
	$(CXX) $(CXXFLAGS) -o $(TARGTDIR)myserver $(TARGTDIR)myserver.o $(LDFLAGS)

$(TARGTDIR)myclient.o: $(SRCDIR)myclient.cpp
	mkdir -p $(TARGTDIR)
	$(CXX) $(CXXFLAGS) -c -o $(TARGTDIR)myclient.o $(SRCDIR)myclient.cpp

$(TARGTDIR)myserver.o: $(SRCDIR)myserver.cpp
	mkdir -p $(TARGTDIR)
	$(CXX) $(CXXFLAGS) -c -o $(TARGTDIR)myserver.o $(SRCDIR)myserver.cpp

clean:
	rm -f $(TARGTDIR)myclient $(TARGTDIR)myserver $(TARGTDIR)*.o

