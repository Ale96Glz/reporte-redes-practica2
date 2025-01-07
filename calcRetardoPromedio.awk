#Inicializar variables
BEGIN {
    promedio = 0;
    contador = 0;
}

#Procesar cada línea del archivo
{   
    #Si la primera columna es una letra "D" entonces se procesa la línea
    if ($1 == "D") {
        # Acumulamos el retardo y cuentamos las líneas procesadas
        promedio += ($2 - $3 - min) / 8000;
        contador++;
    }
}

#Calcular e imprimir el retardo promedio
END {
    print "Retardo promedio: " promedio / contador;
}