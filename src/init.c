#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>
#include <R_ext/Visibility.h>

/* .Call calls */
extern SEXP R_split_string(SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
	{"R_split_string", (DL_FUNC)&R_split_string, 2},
	{NULL, NULL, 0}
};