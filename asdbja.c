#include <math.h>
#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

long arr[10000];


void* sin_me(void* arg) {
	int i = (int)arg;
	int ar = i;
	double* sum = malloc(sizeof(double));
	for (i -=  5000 ; i < ar; i++) {
		*sum += sin(arr[i]);
	}
		
	printf("%lf\n", *sum);
	return (void *) sum;
}

int main() {
	int argum = 0;
	int i;
	void* final;
	double sum = 0;
	pthread_t th[2];
	for (i = 0; i < 10000; i++) {
		arr[i] = i;
	}
	argum += 5000;
	pthread_create(&th[0], NULL, sin_me, (void *)argum);
	pthread_join(th[0], &final);
	sum += *(double *)final;
	argum += 5000;
	pthread_create(&th[1], NULL, sin_me, (void *)argum);
	pthread_join(th[1], &final);
	sum += *(double *)final;
	printf("%lf\n", sum);
	return 0;
}
