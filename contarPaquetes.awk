BEGIN {
    cantPaquetes = 0;
}

{
    if ($1 == "D") {
        cantPaquetes++;
    }
}

END {
    print "Cantidad de paquetes: " cantPaquetes;
}