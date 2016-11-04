#Add any executable you want to be created here.
EXECUTABLES	= thread_test thread_test_cuda

#This is the compiler to use
CC = nvcc
CCh = gcc

#These are the flags passed to the compiler. Change accordingly
CFLAGS = -arch sm_30 -lineinfo -Xcompiler -Wall -O4 -g
CFLAGSh =  -Wall -O4 -g -std=c99

#These are the flags passed to the linker. Nothing in our case
LDFLAGS = -lm

thread_test.c: thread_test

%: %.c
	$(CCh) $(CFLAGSh) $< -o $@ $(LDFLAGS)

thread_test_cuda: thread_test_cuda

%: %.cu
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)


# make clean will remove all executables, jpg files and the
# output of previous executions.
clean:
	rm -f $(EXECUTABLES)
