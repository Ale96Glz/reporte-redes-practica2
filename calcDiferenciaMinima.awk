#Inicializar las variables
BEGIN {
    min = 0;
}

#Procesa cada línea del archivo de traza
{
    if ($1 == "D") {
        # Calcula la diferencia entre la segunda y tercera columna
        min_temp = $2 - $3;
        if (NR == 1) {
            # Si es la primera línea, inicializa min con la diferencia entre
            # los valores de las columnas 2 y 3 de la primera linea
            min = min_temp;
        } else if (min_temp < min) {
            # Actualiza min si min_temp es menor
            min = min_temp;
        }
    }
}

# END block: Imprime la diferencia mínima
END {
    print "Diferencia mínima:", min;
}