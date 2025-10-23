# Explorando el dataset Goodbooks-10k 📚

- Autor: Valentina Tesser
- Fecha: 23 de octubre de 2025

## 1. Introducción

¿Alguna vez te has preguntado qué tipo de libros son los más populares o cuáles son los que más personas tienen pendientes de leer? En la era digital, estas preguntas pueden responderse no solo con intuiciones, sino también con datos. En este proyecto, me propuse analizar una gran base de datos proveniente de **Goodreads**, una de las plataformas más utilizadas por lectores de todo el mundo para registrar, calificar y recomendar libros.

El dataset que utilicé **Goodbooks-10k**, disponible públicamente en Kaggle (https://www.kaggle.com/datasets/zygmunt/goodbooks-10k), recopila información de más de **10.000 libros** junto con sus autores, valoraciones promedio, número de reseñas, etiquetas (géneros o temas) y datos de interacción de los usuarios, como los libros marcados como por leer. Este tipo de información abre una ventana fascinante para entender los **patrones de lectura y popularidad literaria** a escala global.

Mi idea fue transformar este conjunto de datos en una **historia contada con R**, mostrando paso a paso cómo explorar, limpiar, integrar y analizar información de una fuente real. El objetivo no es solo llegar a conclusiones sobre los gustos literarios, sino también **aprender a manipular datos con herramientas del tidyverse**, de modo que cualquier persona interesada en aprender R pueda seguir este proceso como un tutorial práctico.

A lo largo del análisis, busco responder algunas preguntas que van más allá de la simple curiosidad estadística. Por ejemplo:

- ¿Qué relación existe entre la valoración promedio de un libro y su popularidad entre los usuarios?
- ¿Cuáles son los géneros o etiquetas más comunes entre los libros mejor calificados?
- ¿Qué características tienen los títulos que más personas marcan como por leer?

Estas interrogantes combinan el interés cultural por las preferencias lectoras con un enfoque técnico en análisis de datos.

El resultado es un recorrido completo que comienza con la **preparación y limpieza de las bases**, continúa con su **integración y exploración visual**, y culmina con la **interpretación de patrones y tendencias**. Todo el proceso se explica en detalle para que puedas reproducirlo y adaptar las técnicas a tus propios proyectos.

En definitiva, este análisis busca demostrar cómo los datos pueden convertirse en una herramienta poderosa para observar el mundo cultural. A través de Goodreads, podemos entender no solo qué leen las personas, sino también qué **desean leer**, y cómo esas elecciones van moldeando el paisaje literario de una comunidad global interconectada por el amor a los libros.

## 2. Estructura del proyecto

Este proyecto se organiza en distintas fases que reflejan el flujo típico de un análisis de datos en R, desde la obtención de la información hasta la comunicación de los resultados. La idea es que cualquier persona que lea este repositorio pueda seguir el proceso paso a paso, entender la lógica detrás de cada decisión y adaptar el código a sus propios intereses.

En la primera etapa, trabajé con los archivos originales del dataset Goodbooks-10k, que incluyen información de libros, autores, etiquetas (tags), valoraciones de usuarios y libros marcados como por leer. Estos archivos fueron cargados y explorados para identificar su estructura, variables y posibles problemas de calidad, como valores faltantes o duplicados.

Luego, en la segunda fase, se realizó la integración de las bases. Esto implicó conectar las distintas fuentes —por ejemplo, uniendo los identificadores de libros con sus etiquetas o consolidando las valoraciones— para construir una base maestra lista para el análisis. Durante este paso también se seleccionaron las variables más relevantes para responder las preguntas de investigación planteadas, como el promedio de calificaciones, el número de reseñas, el año de publicación y el género principal de cada obra.

Finalmente, el proyecto avanza hacia la fase de análisis y visualización, donde se aplican herramientas de manipulación y graficación (principalmente del paquete tidyverse) para descubrir patrones y tendencias en los datos. Esta parte incluye comparaciones entre géneros literarios, evolución temporal de las publicaciones y exploración de los libros más populares según distintos criterios.

En cada etapa, el código está acompañado de comentarios explicativos y observaciones sobre los resultados intermedios, con el fin de que el lector no solo vea qué se hace, sino también por qué se hace. De este modo, el proyecto funciona tanto como un ejercicio práctico de análisis de datos en R como una guía para quienes quieran iniciarse en la exploración de datasets reales.

El repositorio está estructurado de la siguiente manera:
- **Data**: Carpeta que contiene los archivos originales del dataset Goodbooks-10k en formato CSV.
- **Scripts**: Carpeta con los scripts de R utilizados para la limpieza, integración y  análisis de los datos.
- **Data Limpia**: Carpeta donde se guardan las bases de datos ya limpias y listas para el análisis.
- **Outputs**: Carpeta donde se guardan las visualizaciones y resultados generados durante el análisis.
- **README.md**: Este archivo, que proporciona una visión general del proyecto y su estructura

## 3. Requisitos para reproducir el análisis

Para reproducir el análisis presentado en este proyecto, necesitarás tener instalado R y RStudio en tu computadora. Además, es importante contar con las siguientes librerías del ecosistema tidyverse, que facilitan la manipulación y visualización de datos:
- tidyverse
- dplyr
- ggplot2
- readr
- tidyr
- summarytools


## 4. Base de datos

**Goodbooks-10k dataset**: El dataset Goodbooks-10k es una colección de datos que contiene información sobre más de 10,000 libros, sus autores, calificaciones y etiquetas (tags) asociadas. Este conjunto de datos es ideal para realizar análisis exploratorios y visualizaciones relacionadas con la popularidad y características de los libros.

El dataset incluye los siguientes archivos principales:

- books.csv: Este archivo contiene información sobre los libros, incluyendo sus títulos, autores, años de publicación y calificaciones promedio.
- books.tags.csv: Este archivo contiene etiquetas asociadas a los libros, que pueden ayudar a categorizar y analizar los géneros y temas de los libros.
- ratings.csv: Este archivo contiene las calificaciones que los usuarios han dado a los libros, lo que permite analizar la popularidad y recepción de los libros.
- tags.csv: Este archivo contiene las etiquetas que los usuarios han asignado a los libros, lo que puede proporcionar información adicional sobre los temas y géneros de los libros.
- to_read.csv: Este archivo contiene una lista de libros que los usuarios han marcado para leer en el futuro, lo que puede proporcionar información sobre las tendencias y preferencias de lectura.

Puedes descargar el dataset completo desde Kaggle en el siguiente enlace: https://www.kaggle.com/datasets/zygmunt/goodbooks-10k. Asegúrate de guardar los archivos CSV en la carpeta "Data" del repositorio para que los scripts puedan acceder a ellos correctamente.

## 5. Pasos a seguir

Para reproducir el análisis presentado en este proyecto, sigue estos pasos:
1. Clona o descarga este repositorio en tu computadora.
2. Asegúrate de tener R y RStudio instalados.
3. Instala las librerías necesarias si aún no las tienes:
```R
install.packages(c("tidyverse", "dplyr", "ggplot2", "readr", "tidyr", "summarytools"))
```
4. Coloca los archivos CSV del dataset Goodbooks-10k en la carpeta "Data" del repositorio.
5. Abre RStudio y carga los scripts de R desde la carpeta "Scripts" en el orden indicado (limpieza, integración, análisis).
6. Ejecuta los scripts paso a paso, asegurándote de entender cada sección del código y los comentarios explicativos.
7. Revisa los resultados y visualizaciones generados en la carpeta "Outputs".

Siguiendo estos pasos, podrás reproducir el análisis y explorar los datos por ti mismo. No dudes en modificar el código para adaptarlo a tus propias preguntas de investigación o intereses literarios. 

¡Feliz análisis de datos! 📊📚

## 6.Explorando la relación entre valoración y popularidad en Goodreads 📖

Una de las preguntas más interesantes que surgen al analizar el dataset *Goodbooks-10k* es: **¿Qué relación existe entre la valoración promedio de un libro y su nivel de popularidad entre los usuarios?**

En otras palabras, buscamos saber si los libros más populares (aquellos con más calificaciones o reseñas) son también los mejor evaluados.  
Esta pregunta nos permite acercarnos a la dinámica de comportamiento lector dentro de Goodreads: ¿la visibilidad impulsa la valoración positiva, o los usuarios prefieren calificar mejor obras menos masivas?

### Limpieza y observaciones iniciales

Antes de comenzar con los gráficos, revisé la estructura de las variables principales del análisis:  

- `avg_rating`: valoración promedio de cada libro.  
- `n_ratings`: número total de valoraciones recibidas.  
- `n_to_read`: número de usuarios que marcaron el libro como *“por leer”*.  

**Observación:**  
`avg_rating` contiene **7474 valores NA**,  
`n_ratings` contiene **7474 valores NA**,  
y `n_to_read` contiene **7475 valores NA**.  

Estos *NA* corresponden a **libros que no han recibido calificaciones ni han sido marcados como “por leer”**. Por lo tanto, en los gráficos siguientes se trabajará solo con los registros completos, utilizando `filter(!is.na(avg_rating))` y `filter(!is.na(n_ratings))` para asegurar que los resultados sean representativos.

### Objetivo analítico

El objetivo de esta sección es identificar si existe una relación (lineal o no) entre la *valoración promedio* y la *popularidad* de los libros en Goodreads. Para ello, exploraremos visualmente los datos y luego cuantificaremos la correlación entre ambas variables.

### Visualización y analisis:

1. Diagrama de dispersión: popularidad vs. valoración promedio
2. Densidad bivariada: concentración de libros
3. Correlación entre valoración y popularidad
4. Los libros más populares vs. los mejor calificados

#### 1. Diagrama de dispersión: popularidad vs. valoración promedio

El siguiente gráfico muestra cómo se distribuyen los libros en función de su número de valoraciones (`n_ratings`) y su calificación promedio (`avg_rating`).

```r
library(ggplot2)
library(dplyr)

books_clean <- books_full %>%
  filter(!is.na(avg_rating), !is.na(n_ratings))

ggplot(books_clean, aes(x = n_ratings, y = avg_rating)) +
  geom_point(alpha = 0.4, color = "#0072B2") +
  scale_x_log10() +
  labs(
    title = "Relación entre popularidad y valoración promedio en Goodreads",
    x = "Número de valoraciones (escala logarítmica)",
    y = "Valoración promedio",
    caption = "Fuente: Dataset Goodbooks-10k (Kaggle)"
  ) +
  theme_minimal()
```

![Popularidad y valoración promedio](Outputs/grafico_populares.png)

En el gráfico de dispersión, donde cada punto representa un libro, se observa una alta concentración entre las 100 y 1.000 valoraciones (recordando que el eje X está en escala logarítmica). Esto significa que la mayoría de los títulos del dataset son moderadamente populares, sin llegar a los niveles masivos de lecturas que tienen algunos best-sellers.

En cuanto a las valoraciones promedio (avg_rating), la mayoría de los libros se ubica entre 3,0 y 4,5 estrellas, lo que refleja una tendencia general positiva: los usuarios de Goodreads tienden a evaluar los libros con buenas calificaciones, aunque no con puntuaciones extremas.

También se pueden notar algunos valores atípicos —libros con muchas valoraciones pero calificaciones más bajas, o al contrario, libros con muy pocas valoraciones pero con promedios cercanos a 5 estrellas—. Esto puede deberse a fenómenos distintos: los primeros suelen ser títulos muy conocidos pero polarizantes (por ejemplo, sagas populares o libros con adaptaciones cinematográficas), mientras que los segundos suelen ser libros de nicho, leídos por pocos usuarios pero muy apreciados por ellos.

En síntesis, la concentración de puntos muestra que la mayoría de los libros tiene una recepción positiva pero una visibilidad limitada, y que la popularidad extrema es la excepción.

Igualmente, podemos ver mejor los datos en el siguiente gráfico: 

```{r}
library(plotly)
library(ggplot2)
library(dplyr)
library(scales)
library(htmlwidgets)

p <- ggplot(books_clean, aes(
  x = n_ratings,
  y = avg_rating,
  text = paste(
    "Título:", title,
    "<br>Autor:", authors,
    "<br>Valoración promedio:", round(avg_rating, 1),
    "<br>Número de valoraciones:", n_ratings
  )
)) +
  geom_point(aes(color = avg_rating), alpha = 0.6, size = 2) +
  scale_color_gradient(low = "#1ABC9C", high = "#E91E63") +
  scale_x_log10(labels = scales::comma) +
  labs(
    title = "Popularidad vs Valoración Promedio de Libros en Goodreads",
    x = "Número de valoraciones (escala logarítmica)",
    y = "Valoración promedio",
    color = "Valoración promedio",
    caption = "Fuente: Goodbooks-10k (Kaggle). Visualización: Valentina Tesser"
  ) +
  theme_minimal(base_size = 14)

# Convertir a objeto plotly
ggplotly_p <- ggplotly(p, tooltip = "text")

# Guardar como archivo HTML
saveWidget(ggplotly_p, "../Outputs/grafico_libros_interactivo.html", selfcontained = TRUE)

```

[Ver gráfico interactivo](https://vtesser.github.io/Proyecto-personal/Outputs/grafico_libros_interactivo.html)

Donde observamos la misma tendencia que en el gráfico anterior, pero con la ventaja de poder explorar cada punto individualmente al pasar el cursor sobre ellos. Esto permite identificar títulos específicos, sus autores y detalles de valoración y popularidad.


#### 2. Densidad bivariada: concentración de libros

El gráfico siguiente muestra la concentración de títulos en torno a ciertos rangos de popularidad y valoración promedio.

```{r}
ggplot(books_clean, aes(x = n_ratings, y = avg_rating)) +
  geom_bin2d(bins = 30) +
  scale_x_log10() +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(
    title = "Distribución conjunta de valoración promedio y popularidad",
    x = "Número de valoraciones (escala logarítmica)",
    y = "Valoración promedio",
    fill = "Frecuencia",
    caption = "Fuente: Dataset Goodbooks-10k (Kaggle)"
  ) +
  theme_minimal()
```
El gráfico de densidad bivariada muestra prácticamente la misma tendencia que el anterior, pero con una forma diferente de representación. En lugar de mostrar puntos individuales, utiliza cuadrantes de color que representan la concentración de observaciones. Las zonas más oscuras indican donde hay más libros. En este caso, la concentración principal también está entre 100 y 1.000 valoraciones y calificaciones promedio entre 3,5 y 4,3 estrellas, exactamente como en el gráfico anterior. 

Por lo tanto, ambos gráficos entregan la misma información general, pero con distintos propósitos visuales: el diagrama de dispersión es útil para mostrar casos individuales y detectar valores atípicos. Por otro lado, el gráfico de densidad es mejor para mostrar patrones generales de concentración cuando hay muchos datos y los puntos se sobreponen.

#### 3. Correlación entre valoración y popularidad

Para cuantificar la relación, calculamos la correlación de Pearson entre ambas variables:

```{r}
cor_test <- cor.test(books_clean$avg_rating, books_clean$n_ratings, use = "complete.obs")
cor_test
```

Esto significa que la correlación entre la valoración promedio (avg_rating) y la popularidad (n_ratings) es positiva pero muy débil (r = 0.086).

Aunque el p-value (< 0.05) indica que la relación es estadísticamente significativa, su magnitud es tan baja que no tiene relevancia práctica fuerte.

En otras palabras, los libros más populares tienden a tener ligeramente mejores calificaciones, pero esta relación es mínima. 

Esto sugiere que la popularidad no necesariamente se explica por la calidad percibida, sino también por otros factores —como la promoción editorial, la fama del autor o la pertenencia a géneros con grandes comunidades lectoras.

#### 4. Los libros más populares vs. los mejor calificados

Finalmente, podemos visualizar los títulos que lideran ambos rankings y comparar si coinciden o no.

```{r}
library(dplyr)
library(ggplot2)
library(forcats)
library(stringr)
library(scales)

# Libros más populares
top_popular <- books_clean %>%
  arrange(desc(n_ratings)) %>%
  slice_head(n = 15)

# Libros mejor calificados (mínimo 1000 valoraciones)
top_rated <- books_clean %>%
  filter(n_ratings > 1000) %>%
  arrange(desc(avg_rating)) %>%
  slice_head(n = 15)

# Crear el gráfico y guardarlo en un objeto
grafico_top15 <- ggplot(top_books, aes(y = title_wrapped, x = n_ratings_plot, color = avg_rating)) +
  geom_segment(aes(x = 1, xend = n_ratings_plot, y = title_wrapped, yend = title_wrapped),
               linewidth = 1.1, alpha = 0.9) +
  geom_point(size = 4) +
  geom_text(aes(label = scales::comma(n_ratings)), hjust = -0.1, size = 3.2, color = "gray20") +
  scale_x_continuous(trans = "log10", labels = scales::comma, expand = expansion(mult = c(0.02, 0.25))) +
  scale_color_gradient(low = "#9DD9D2", high = "#00796B", name = "⭐ Valoración\npromedio") +
  labs(
    title = "Top 15 libros más populares en Goodreads",
    subtitle = "El color indica la valoración promedio; la escala X es logarítmica",
    x = "Número de valoraciones (escala log10)",
    y = "",
    caption = "Fuente: Goodbooks-10k (Kaggle). Visualización: Valentina Tesser"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray40"),
    axis.text.y = element_text(size = 10, margin = margin(r = 6)),
    legend.position = "right",
    plot.margin = margin(t = 12, r = 30, b = 12, l = 12),
    panel.grid.major.y = element_blank()
  ) +
  coord_cartesian(clip = "off")

# Guardar el gráfico en tu carpeta del proyecto
ggsave("~/Desktop/Universidad 2025/Datos magister/Proyecto personal/Outputs/grafico_top15_populares.png", grafico_top15, width = 12, height = 8, dpi = 300)

png("Outputs/grafico_top15_populares.png", width = 800, height = 600)
plot(mtcars$mpg, mtcars$hp)  # Aquí tu código de gráfico
dev.off()

```

![Top 15 libros más populares](Outputs/grafico_top15_populares.png)

El gráfico muestra los 15 libros con mayor número de valoraciones en Goodreads, utilizando una escala logarítmica para representar la cantidad de calificaciones que cada título ha recibido. El color de los puntos indica la valoración promedio otorgada por los usuarios, permitiendo comparar simultáneamente popularidad y nivel de aprobación.

Se observa que algunos títulos son ampliamente populares, acumulando cientos de miles o incluso millones de valoraciones, mientras que su promedio de calificación no siempre es el más alto. Esto sugiere que la popularidad no necesariamente refleja una mejor percepción de calidad por parte de los lectores. En cambio, existen libros con un número más moderado de valoraciones que obtienen puntuaciones notablemente superiores.

Este patrón evidencia que el interés masivo por ciertos títulos —probablemente impulsado por fenómenos editoriales, adaptaciones cinematográficas o autores reconocidos— no siempre se traduce en una evaluación más positiva. Por tanto, la popularidad en Goodreads parece estar asociada tanto a factores culturales y mediáticos como a la valoración literaria en sí misma.

En resumen, la relación entre popularidad y valoración es compleja: los libros más leídos y comentados no necesariamente son los más apreciados, lo que refleja la diversidad de gustos y expectativas dentro de la comunidad lectora de Goodreads.

### Conclusión: Valoración vs. Popularidad

**¿Qué relación existe entre la valoración promedio de un libro y su nivel de popularidad entre los usuarios?**

El análisis revela que la relación entre la valoración promedio de un libro y su nivel de popularidad en Goodreads no es lineal ni directa. Si bien existe una tendencia general a que los libros con calificaciones más altas atraigan más lectores y reseñas, los datos muestran una amplia dispersión: muchos títulos con valoraciones promedio sobresalientes (por encima de 4.3) no alcanzan altos niveles de popularidad, mientras que otros con puntuaciones más moderadas acumulan miles de valoraciones.

Esto sugiere que la popularidad de un libro depende de múltiples factores más allá de su calidad percibida, como la visibilidad del autor, la estrategia editorial, la adaptación audiovisual o la presencia en comunidades de lectura. En resumen, una buena calificación puede ayudar, pero no garantiza el éxito masivo; el interés de los usuarios parece responder tanto a tendencias culturales como a recomendaciones externas, más que únicamente al promedio de estrellas.





