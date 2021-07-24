//
//  Threads.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 7/10/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

/******************************************************************************
* FILE: hello.c
* DESCRIPTION:
*   A "hello world" Pthreads program.  Demonstrates thread creation and
*   termination.
* AUTHOR: Blaise Barney
* LAST REVISED: 08/09/11
******************************************************************************/
#include <pthread.h>

#define NUM_THREADS 5

void *PrintHello(void *threadid)
{
   long tid;
   tid = (long)threadid;
   printf("Hello World! It's me, thread #%ld!\n", tid);
   pthread_exit(NULL);
}

void threads(void)
{
    pthread_t threads[NUM_THREADS];
    int rc;
    long t;
    for( t = 0; t < NUM_THREADS; t++){
        printf ("In main: creating thread %ld\n", t);
        rc = pthread_create (&threads[t], NULL, PrintHello, (void *)t);
        if (rc){
            printf ("ERROR; return code from pthread_create() is %d\n", rc);
            exit (-1);
        }
    }
    
    usleep(2000000);    // let threads run and exit before this code exits
}
