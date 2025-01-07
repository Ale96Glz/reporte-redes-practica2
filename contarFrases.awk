#Inicializar el contador de frases
BEGIN {
    cantFrases = 0;
}

#Incrementa el contador si el primer campo es "!"
#ya que es un periodo de silencio por lo que termina una frase
{
    if ($1 == "!" ) {
        cantFrases++;
    }
}

#Imprir el total de frases
END {
    print "Cantidad de frases: " cantFrases;
}