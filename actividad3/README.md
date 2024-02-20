# **Actividad 3**

# Script

<p align="center">
  <img src="Imgs/1.png">
</p>

#### Permisos de ejecución

<p align="center">
  <img src="Imgs/2.png">
</p>

# Service





### Crear el service en la carpeta /etc/systemd/system

<p align="center">
  <img src="Imgs/3.png">
</p>

<p align="center">
  <img src="assets/4.png">
</p>

# Instalación y habilitación del servicio

### Ejecutar los siguientes comandos
```
# Recargar los servicios systemd
sudo systemctl daemon-reload

# Habilitar el servicio para que se inicie en el arranque
sudo systemctl enable Saludo.service

# Iniciar el servicio
sudo systemctl start Saludo.service

# Verificar el estado del servicio
sudo systemctl status Saludo.service

```

<p align="center">
  <img src="Imgs/4.png">
</p>

### Comprobar el servicio

<p align="center">
  <img src="Imgs/5.png">
</p>