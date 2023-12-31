/* Based on the example given in:
 * https://www.nextflow.io/docs/latest/metrics.html#memory-usage
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/resource.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <time.h>
#include <errno.h>

/* Get vmem and rss usage from /proc/<pid>/statm */
static int mem_used(pid_t pid, unsigned long* vmem, unsigned long* rss) {
	FILE* file;
	char path[40];
	unsigned int page_size;
	snprintf(path, 40, "/proc/%ld/statm", (long) pid);
	file = fopen(path, "r");
	// vmem and rss are the first values in the file
	fscanf(file, "%lu %lu", vmem, rss);
	// values in statm are in pages so to get bytes we need to know page size
	page_size = (unsigned) getpagesize();
	*vmem = *vmem * page_size;
	*rss = *rss * page_size;
	fclose(file);
	return 0;
}

int main(int argc, char **argv) {
	unsigned char *address;
	char input;
	size_t size = 1024*1024*1024;  // 1 GiB
	unsigned long i;
	unsigned long vmem = 0;
	unsigned long rss = 0;
	pid_t pid;
	pid = getpid();

	if (argc < 3) {
		printf("usage: %s <size to occupy> <time to wait>\n", argv[0]);
		return 0;
	}
	
	char *p;
	errno = 0;
	long conv = strtol(argv[1], &p, 10);
	if (errno != 0 || *p != '\0') {
		printf("error\n");
		return -1;
	}
	printf("size=%ld\n", conv);
	size = conv;

	errno = 0;
	conv = strtol(argv[2], &p, 10);
	if (errno != 0 || *p != '\0') {
		printf("error\n");
		return -1;
	}
	printf("time=%ld\n", conv);
	long time = conv;
	
	printf("Pid: %ld\n", (long) pid);
	mem_used(pid, &vmem, &rss);
	printf("VMEM: %lu RSS: %lu\n", vmem, rss);

	address = malloc(size);
	printf("Allocated %d Bytes of memory\n", (int) size);
	mem_used(pid, &vmem, &rss);
	printf("VMEM: %lu RSS: %lu\n", vmem, rss);

	// Leave time for nextflow to get information
	sleep(time);
	free(address);
	return 0;
}
