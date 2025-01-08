import numpy as np
import matplotlib.pyplot as plt
import sys

# Verificar si se pasó un archivo de traza como argumento
if len(sys.argv) != 2:
    print("Uso: python corregirPendienteTraza.py <traza.txt>")
    sys.exit(1)

# Cargar el archivo pasado como argumento
archivo_traza = sys.argv[1]
data = np.loadtxt(archivo_traza)

# Separar los datos en tiempo de sesión y retardo
tiempo_sesion = data[:, 0]
retardo = data[:, 1]

# Aplicar ajuste lineal (regresión)
m, b = np.polyfit(tiempo_sesion, retardo, 1)

# Corregir el retardo substrayendo la tendencia lineal
retardo_corregido = retardo - (m * tiempo_sesion + b)

# Graficar los resultados
plt.figure(figsize=(12, 6))

# Gráfica original
plt.subplot(1, 2, 1)
plt.plot(tiempo_sesion, retardo, label='Retardo Original', color='b')
plt.title('Retardo Original')
plt.xlabel('Tiempo de Sesión (s)')
plt.ylabel('Retardo End-to-End (s)')
plt.grid(True)

# Gráfica corregida
plt.subplot(1, 2, 2)
plt.plot(tiempo_sesion, retardo_corregido, label='Retardo Corregido', color='r')
plt.title('Retardo Corregido')
plt.xlabel('Tiempo de Sesión (s)')
plt.ylabel('Retardo End-to-End Corregido (s)')
plt.grid(True)

plt.tight_layout()
plt.show()
