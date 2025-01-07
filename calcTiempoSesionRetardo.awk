#Inicializa variables
BEGIN {
  tiempo_inicial = 0;
  primera_linea = 1; 
}

#Procesar cada línea del archivo
{
    if ($1 == "D") {
        # Si es la primera línea con "D", inicializamos tiempo_inicial
        if (primera_linea) {
            tiempo_inicial = $3;
            primera_linea = 0;
        }
        # Calcula el tiempo de sesión y el retardo
        tiempo_sesion = ($3 - tiempo_inicial) / 8000;
        retardo = ($2 - $3 - min) / 8000;
        # Imprimir los resultados en el archivo "salida.txt"
        print tiempo_sesion, retardo >> "salida.txt"; 
    }
}