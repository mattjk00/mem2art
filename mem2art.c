/**
 * Matthew Kleitz, 2019
 * Turning random memory values into art with C and processing.
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
int main() {
    // size of array to allocate
    const size_t size = 32;
    int* x = malloc(size * sizeof(int));
    // how many characters the data will be when concatted together
    int dataSize = 0;
    // find the size of the data string that will be sent to processing
    for (int i = 0; i < size; i++) {
        int ds = floor(log10(abs(x[i]))) + 1;
        dataSize += ds;
    }
    // allocate a string to store the integers in as a string
    char* intString = malloc(dataSize);
    // put the integers into string form
    for (int i = 0; i < size; i++) {
        int ds = floor(log10(abs(x[i]))) + 1;
        char s[ds + ds];
        sprintf(s, "%d", x[i]);
        strcat(intString, s);
    }
    
    // the main part of the script to run processing
    char* sh = "processing-java --sketch=$(pwd)/drawer --run '";
    // allocate new char with the data string added as an argument.
    char fullSh[strlen(sh) + strlen(intString)];
    sprintf(fullSh, "%s %s'", sh, intString);

    // run the sh script
    system(fullSh);
    
    // free memory
    free(x);
    free(intString);
    return 0;
}