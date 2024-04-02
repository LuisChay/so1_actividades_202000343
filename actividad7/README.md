# Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es el algoritmo de planificación de procesos utilizado en el núcleo Linux desde la versión 2.6.23. A diferencia de los antiguos algoritmos de planificación, como el O(1) Scheduler, el CFS garantiza una distribución justa del tiempo de CPU entre los procesos, priorizando la equidad sobre otros criterios.

## Características principales:

- **Justicia:** El CFS garantiza que todos los procesos obtengan una parte justa del tiempo de CPU disponible, independientemente de su prioridad o carga de trabajo.
  
- **No depende de la velocidad del reloj:** A diferencia de los algoritmos más antiguos, el CFS no depende de la velocidad del reloj del sistema para calcular las cuotas de tiempo de CPU. En su lugar, utiliza un modelo de tiempo virtual, que es independiente de la velocidad del reloj.

- **Prioridades dinámicas:** En lugar de asignar prioridades fijas a los procesos, el CFS utiliza un sistema de prioridades dinámicas basado en el tiempo de ejecución. Cuanto más tiempo pasa un proceso en espera, mayor será su prioridad.

- **Granularidad de tiempo de CPU:** El CFS utiliza una unidad de tiempo de CPU muy pequeña para calcular la cantidad de tiempo de CPU asignada a cada proceso. Esto asegura una distribución justa incluso en sistemas con una gran cantidad de procesos de corta duración.

- **Latencia baja:** El CFS minimiza la latencia de los procesos interactivos al tratar de ejecutar los procesos en espera tan pronto como sea posible.

## Funcionamiento:

1. **Asignación de cuotas:** El CFS asigna a cada proceso una "cuota" de tiempo de CPU en función de su prioridad dinámica. Esta cuota representa la cantidad de tiempo de CPU que el proceso puede utilizar en un intervalo determinado.

2. **Selección del próximo proceso:** El CFS selecciona el próximo proceso a ejecutar basándose en su tiempo virtual. El proceso con el menor tiempo virtual pendiente se selecciona para ejecución.

3. **Actualización de prioridades:** Después de cada ejecución de proceso, el CFS actualiza las prioridades de los procesos en espera en función de su tiempo de ejecución. Los procesos que han esperado más tiempo reciben una prioridad más alta.

4. **Ejecución del proceso seleccionado:** Una vez seleccionado, el proceso se ejecuta durante un período de tiempo determinado o hasta que se agote su cuota de tiempo de CPU.

5. **Repetición del ciclo:** El proceso se repite continuamente, con el CFS seleccionando el próximo proceso a ejecutar en función de su tiempo virtual y actualizando las prioridades según sea necesario.
