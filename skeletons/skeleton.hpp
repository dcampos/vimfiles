#ifndef ${1:`!v '__' . toupper(expand("<afile>:t:s#\\.#_#g")) . '__'`}
#define $1

class ${2:`!v expand("<afile>:r:s#^.*/##")`} {
private:
public:
    $2();
    ~$2();
    $0
};

#endif // $1
