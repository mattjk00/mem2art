#mem2art

mem2art's goal is to produce generative art based on psuedo-random values found when allocating memory in C code without running it. Running the "run.sh" script will compile the and run the C code which will then launch the processing sketch. 

Lot's of work still needs to be done. The C code needs some refactoring because it tends to seg fault when trying to allocate more memory (even still very small amounts). The processing sketch also needs some work to display the given values in more expressive ways.