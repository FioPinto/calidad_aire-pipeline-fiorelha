# Insights cuantitativos

### Pico de Contaminación Extremo

Tras la integración de datos, el modelo ha detectado múltiples eventos de Alerta Roja, alcanzando una concentración máxima de 421 µg/m³ en la estación Urb. Embajada. Este valor supera por mucho el umbral crítico de 10.0 µg/m³ definido en la macro `get_alert_level`, además de ser un valor ilógico

### Rango Operativo Completo

La amplitud de los datos registrados varía desde los 0 ug/m3 hasta los 421 ug/m3, demostrando una alta variedad en las mediciones anuales, sin embargo unas concentraciones tan altas serían imposibles.

### Concentraciones cero

El valor mínimo de 0 ug/m3 sugiere periodos de aire limpio o, más probablemente, periodos de inactividad de los sensores, especialmente si coinciden con los patrones detectados en la hora H13.

# Propuestas de mejora

### Añadir otra categoría para datos ilógicos

En el sistema actual de nivel de alertas debería haber una seción específica para categorizar los datos que no serían pausibles. 

### Auditoría de valores cero

Investigar si los valores 0 son reales. Si se confirma que son fallos de lectura, se propone implementar una lógica de 'Null handling' en dbt para no sesgar los promedios anuales hacia abajo.

### Plan de acción por superación de límites: 

Establecer un sistema de notificaciones automáticas cuando la columna concentracion supere el valor de 5.0 por más de dos horas consecutivas.

# Anomalia encontrada

### El salto térmico del benceno

Se encontraron valores superirores a 10 ug/m3 en un dataset donde la gran mayoría de los registros son inferiores a 1.0. Este patrón sugiere un evento puntual extremo (como un incendio cercano a la estación, una fuga industrial o un atasco masivo) o bien un error de calibración del sensor que deben ser aislados para no distorsionar las estadísticas generales.
El dato de 421 es definitivamente o un erro humano o uno de calibración, aún así se encontraron concentraciones que llegan a los dobles dígitos las cuales también se podrían deber por la misma razón.