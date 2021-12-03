#include <proto/exec.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define TEST_FUNC_IMPLEMENTATION(var,var2)\
    int main(int argc, char **argv)\
    {\
        unsigned int error;\
        unsigned int totalerrors = 0;\
        unsigned int testcounter = 0;\
        unsigned int testsperformed = 0;\
        int c;\
        int start=0;\
        int end=0;\
        char fileresult[100];\
        int writeresult=0;\
        FILE* fdres=0;\
        while ((c = getopt (argc, argv, "s:e:o:i:")) != -1)\
        {\
            switch(c)\
            {\
                case 'i': start = atoi(optarg); end = start; break;\
                case 's': start = atoi(optarg); break;\
                case 'e': end = atoi(optarg); break;\
                case 'o': writeresult=snprintf(fileresult,99,"%s",optarg); fdres = fopen(fileresult,"a"); if (!fdres) { perror("Error writing to result file"); exit(1); } break;\
                default : printf("Usage: %s [-s start] [-e end] [-o resultfile]\n",argv[0]);\
            }\
        }\
        fprintf(writeresult?fdres:stdout,"Start executing file %s - range %d-%d\n",__FILE__,start,end);\
        \
        while (var[testcounter].testId)\
        {\
            if (start && var[testcounter].testId < start)\
            {\
                testcounter++;\
                continue;\
            }\
            if (end && var[testcounter].testId > end) break;\
            \
            fprintf(writeresult?fdres:stdout,"Running test %d - %s...", var[testcounter].testId,var[testcounter].title);\
            char filename[100];\
            snprintf(filename, sizeof(filename), "expected/%s%d",var2, var[testcounter].testId);\
            if (argc==2 && atoi(argv[1]) == var[testcounter].testId) var[testcounter].verbose = 3;\
            error = make_test_patched( var[testcounter],filename,var[testcounter]);\
            if (!error)\
                fprintf(writeresult?fdres:stdout,"Test succeeded\n");\
            else\
                fprintf(writeresult?fdres:stdout,"Test KO\n");\
            totalerrors += error;\
            testcounter++;\
            testsperformed++;\
        }\
        fprintf(writeresult?fdres:stdout,"********************************************************\n");\
        if (totalerrors==0) fprintf(writeresult?fdres:stdout,"Result %s: All tests ok (%d)\n",__FILE__,testsperformed);\
        else fprintf(writeresult?fdres:stdout,"Result %s: ERROR:!!!!!! ***** Total errors: %d out of %d******************\n", __FILE__,totalerrors,testsperformed);\
        fprintf(writeresult?fdres:stdout,"********************************************************\n\n\n");\
        if (writeresult) fclose(fdres);\
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

int make_test4(struct _test test, const char *file);
int make_test_patched(struct _test , const char *,struct _test);


