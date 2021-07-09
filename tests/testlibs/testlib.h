#define TEST_FUNC_IMPLEMENTATION(var,var2)\
    int main(int argc, char **argv)\
    {\
        unsigned int error;\
        unsigned int totalerrors = 0;\
        unsigned int testcounter = 0;\
        printf("Start executing file %s\n",__FILE__);\
    \
        while (var[testcounter].testId)\
        {\
            if (argc == 1 || (argc==2 && atoi(argv[1]) == var[testcounter].testId) || (argc==3 && var[testcounter].testId>=atoi(argv[1]) && var[testcounter].testId<=atoi(argv[2]) ) )\
            {\
                printf("Running test %d - %s...", var[testcounter].testId,var[testcounter].title);\
                char filename[100];\
                snprintf(filename, sizeof(filename), "expected/%s%d",var2, var[testcounter].testId);\
                if (argc==2 && atoi(argv[1]) == var[testcounter].testId) var[testcounter].verbose = 3;\
                error = make_test_patched( var[testcounter],filename,var[testcounter]);\
                if (!error)\
                    printf("Test succeeded\n");\
                else\
                    printf("Test KO\n");\
                totalerrors += error;\
            }\
    \
            testcounter++;\
        }\
        if (totalerrors==0) printf("Result %s: All tests ok (%d)\n\n",__FILE__,testcounter);\
        else printf("Result %s: ERROR:!!!!!! ***** Total errors: %d out of %d******************\n\n", __FILE__,totalerrors,testcounter);\
        exit(totalerrors);\
    }

struct _test
{
    unsigned int testId;
    unsigned char *(*test_function)(void);
    char title[100];
    unsigned int nbitplanes;
    unsigned int nrows;
    unsigned int nbyterow;
    char verbose;
};
int launch_test(struct _test test);

int make_test2( const char *file,struct _test test, const int verbose);
int make_test4(struct _test test, const char *file);
int make_test_patched(struct _test , const char *,struct _test);


