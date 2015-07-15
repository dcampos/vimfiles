#include <iostream>
#include "<+VIM+>expand("<afile>:r:s#^.*/##")<+END_VIM+>.h"

int main(int argc, char *argv[]) {
    using namespace std;

    cout << "Hello, world!" << endl;

    return 0;
}

