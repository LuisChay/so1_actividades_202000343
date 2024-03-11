#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    // Esta función representa lo que hace el hilo
    printf("Hola, soy un hilo!\n");
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t tid;

    pid = fork();
    if (pid == 0) { /* proceso hijo */
        fork();
        pthread_create(&tid, NULL, thread_function, NULL); // Suponiendo que thread_create es similar a pthread_create
    }

    fork();

    // Esperamos a que el hilo termine antes de salir del programa
    pthread_join(tid, NULL);

    return 0;
}