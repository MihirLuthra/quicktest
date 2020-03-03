#ifndef __quicktest_err_h__
#define __quicktest_err_h__

#define P_ERR(fmt, ...) \
	fprintf(stderr, "%s: Line %d: " fmt "\n", __FILE__, __LINE__, ##__VA_ARGS__)


#endif /* __quicktest_err_h__ */
