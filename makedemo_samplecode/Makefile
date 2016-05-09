CC=g++
CFLAGS=-c -Wno-deprecated

all: hellomake result
	
hellomake: main.o function.o
	@echo *******Link the object into exec*********
	$(CC) main.o function.o -o hellomake
main.o: main.cpp
	@echo *****Compiling the main.cpp file******
	$(CC) $(CFLAGS) main.cpp
function.o: function.cpp
	@echo *****Compiling the function.cpp file******
	$(CC) $(CFLAGS) function.cpp

clean:
	rm -fr *.o 
result: 
	@echo ********printing the output of the make file******* 
	./hellomake
