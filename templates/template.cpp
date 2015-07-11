#include <iostream>
#include "[:VIM_EVAL:]expand("<afile>:r:s#^.*/##")[:END_EVAL:].h"

int main(int argc, char *argv[]) {
    using namespace std;

    cout << "Hello, world!" << endl;

    return 0;
}

