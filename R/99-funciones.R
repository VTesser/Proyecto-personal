# Carga de base de datos múltiples. Esto lo puedes ir modificando de acuerdo al tipo de base de datos que quieras:

carga_bases_multiples <- function(path = "Data",
                                  pattern = "\\.csv$",
                                  reader = readr::read_csv) {
  
  files <- list.files(path, 
                      pattern = pattern, 
                      full.names = TRUE)
  
  dataset_names <- gsub(pattern, "", 
                        basename(files))
  
  for (i in seq_along(files)) {
    assign(dataset_names[i], 
           reader(files[i]),
           envir = .GlobalEnv)
  }
}


# Remover los duplicados

remover_duplicados_env <- function(dataset_names, cols = NULL) {
  
  # Validación
  if (length(dataset_names) == 0)
    stop("Debe indicar al menos un nombre de dataset.")
  
  report <- data.frame(
    dataset = dataset_names,
    original_rows = integer(length(dataset_names)),
    final_rows = integer(length(dataset_names)),
    duplicates_removed = integer(length(dataset_names)),
    stringsAsFactors = FALSE
  )
  
  for (i in seq_along(dataset_names)) {
    
    name <- dataset_names[i]
    
    if (!exists(name, envir = .GlobalEnv))
      stop(paste0("El dataset '", name, "' no existe en el GlobalEnv."))
    
    df <- get(name, envir = .GlobalEnv)
    
    if (!is.data.frame(df))
      stop(paste0("El objeto '", name, "' no es un data frame."))
    
    n_original <- nrow(df)
    
    # Eliminar duplicados
    if (is.null(cols)) {
      df_clean <- distinct(df)
    } else {
      df_clean <- distinct(df, across(all_of(cols)), .keep_all = TRUE)
    }
    
    n_final <- nrow(df_clean)
    
    # Guardar en reporte
    report$original_rows[i] <- n_original
    report$final_rows[i] <- n_final
    report$duplicates_removed[i] <- n_original - n_final
    
    # Reemplazar en el GlobalEnv
    assign(name, df_clean, envir = .GlobalEnv)
  }
  
  return(report)
}
