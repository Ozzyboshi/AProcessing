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
