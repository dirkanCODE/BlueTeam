# CVEs-Microsoft
Script Powershell para generar fichero .CSV con las vulnerabilidades (CVEs) publicadas por MS cada mes
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
Os dejo este script por si puede seros de utilidad.  Sirve para bajarse los CVEs que publica MS cada mes a un .csv, y así analizarlos de una manera más sencilla en Excel con una Tabla Dinámica.  Dejo también el .csv y el fichero excel ya con la tabla dinámica del mes de Julio de 2021.
 
Esto es una muestra de los datos en excel que obtiene el script:

![image](https://user-images.githubusercontent.com/87771600/126517725-0e4b42e0-c10d-44b0-a50a-2b9912065172.png)

Luego es fácil hacerse una tabla dinámica para analizarlos y ordenarlos por CVSS Base por ejemplo:

![image](https://user-images.githubusercontent.com/87771600/126517808-dc6df199-5663-4dce-98d0-38b9fab3ecd2.png)

Si no teneis el módulo de powershell msrcsecurityupdates, simplemente descomentad las primeras 2 líneas y se os instalará.  Luego ya en las siguientes ejecuciones podéis volver a comentarlas.   

Para fijar el mes del que queréis bajaros los CVEs, simplemente lo indicais en la variable: $MES ('2021-Jul' o '2021-May' o '2021-Apr', etc). 
 
El fichero de salida lo deja en C:\Temp, también podéis cambiarlo, si queréis a otra carpeta...

![image](https://user-images.githubusercontent.com/87771600/126517929-9a735086-72fc-4d00-9f9c-609d0884c4ac.png)


Espero que os sea de utilidad...

dirkan
