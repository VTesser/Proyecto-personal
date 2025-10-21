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

Siguiendo estos pasos, podrás reproducir el análisis y explorar los datos por ti mismo. No dudes en modificar el código para adaptarlo a tus propias preguntas de investigación o intereses literarios. ¡Feliz análisis de datos! 📊📚



