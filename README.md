# Laboratorio 2 — Packet Tracer, Wireshark, `vi` y Samba

**Autores:** Juan Esteban Ortiz Pastrana y Santiago Alberto Naranjo Abril  
**Institución:** Escuela Colombiana de Ingeniería Julio Garavito  
**Grupo:** 2  
**Fecha:** 26 de agosto de 2023

## Descripción

El laboratorio combina simulación de redes, captura de tráfico real, administración mediante herramientas Unix y configuración de recursos compartidos. Las prácticas se desarrollan con Cisco Packet Tracer, Wireshark, el editor `vi` y Samba.

## Cisco Packet Tracer

Se reconoce la interfaz de Packet Tracer 8.2 y el significado de las conexiones continuas y discontinuas. En modo simulación se siguen paquetes entre dispositivos y se revisa cómo se construyen las PDU en cada capa.

La práctica incluye:

- Pruebas de conectividad mediante `ping`.
- Seguimiento de paquetes desde servidores RADIUS y DHCP.
- Inspección de direcciones, protocolos y encapsulamiento.
- Comparación entre el comportamiento simulado y el tráfico de una red real.

## Captura con Wireshark

Wireshark se utiliza para capturar e inspeccionar paquetes recibidos por una interfaz de red en modo promiscuo. El informe documenta el filtrado por protocolos, especialmente HTTP, y la revisión de:

- Dirección de origen y destino.
- Protocolo utilizado.
- Longitud del paquete.
- Encapsulamiento y segmentación.
- Información asociada a cada capa.

El repositorio conserva la captura `http.pcapng` y los videos explicativos utilizados durante la práctica.

## Editor `vi`

Se realizan ejercicios de creación y modificación de archivos de texto:

- Inserción antes o después del cursor.
- Creación de líneas nuevas.
- Búsqueda y sustitución de cadenas.
- Eliminación de palabras y rangos de líneas.
- Deshacer operaciones.
- Desplazamiento hacia líneas específicas.
- Guardado y salida con o sin conservar los cambios.

Entre los comandos documentados se encuentran `i`, `a`, `o`, `u`, `:w`, `:q`, `:q!`, `/palabra`, `:set number` y `:1,$s/buscar/reemplazar/g`.

## Máquinas y recursos compartidos

Se duplicaron máquinas Slackware, Solaris y Windows Server, asignándoles direcciones IP dentro del rango de trabajo. Posteriormente se configuró Samba:

1. Montaje del medio de instalación.
2. Instalación de Samba y herramientas de edición.
3. Copia y modificación de `smb.conf`.
4. Creación y autorización de usuarios.
5. Definición de un directorio compartido.
6. Inicio del servicio.
7. Acceso desde Windows Server, Slackware y Solaris.

## Automatización

Los scripts incluidos trabajan con visualización de información, usuarios, grupos, logs y tareas de administración en PowerShell y shell de Unix.

## Contenido del repositorio

- Informe en DOCX y PDF.
- Captura de tráfico HTTP.
- Scripts de PowerShell y shell.
- Videos explicativos de cursos y Wireshark.
