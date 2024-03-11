# Prueba de Procesos e hilos
#### Luis Manuel Chay Marroquín // 202000343

## Solución
Esta es la solucion que planteo 

```bash
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
```

Donde:

- Se crea un proceso principal.
- El proceso principal llama a fork(), creando un proceso hijo.
- En el proceso hijo, se llama a fork() nuevamente, creando otro proceso hijo (nieto del proceso principal).
- En el proceso hijo, se crea un hilo utilizando pthread_create(). Este hilo ejecuta la función thread_function.
- Después de la creación del hilo, hay otra llamada a fork(), creando otro proceso hijo.
- Finalmente, el programa espera a que el hilo termine su ejecución antes de salir del programa principal, utilizando pthread_join().

## Preguntas

- a)  ¿Cuántos procesos únicos son creados?
Hay cuatro procesos únicos creados: el proceso principal, el proceso hijo, el nieto del proceso principal y el hijo del proceso hijo.

- b) ¿Cuántos hilos únicos son creados?
Se crea al menos un hilo único en el proceso hijo.
