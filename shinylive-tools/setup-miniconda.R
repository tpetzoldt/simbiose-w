# # Löscht das defekte virtuelle Environment auf Ihrer Festplatte
# unlink("C:/Users/thpe/Documents/.virtualenvs/r-reticulate", recursive = TRUE)

library(reticulate)
library(quarto)

# 1. Installieren Sie das offizielle, von RStudio unterstützte Miniconda
# Das legt eine saubere, isolierte Python-Umgebung in AppData an, die keine Windows-Fehler wirft
reticulate::install_miniconda(force = TRUE)

# 2. Erstellen Sie ein frisches, dediziertes Environment für Shinylive
reticulate::conda_create(envname = "shinylive-env")

# 3. Aktivieren Sie dieses Environment für die aktuelle Session
reticulate::use_condaenv("shinylive-env", required = TRUE)

# 4. Installieren Sie die Python-Pakete direkt über Conda/Pip in diese Umgebung
# Hier installieren wir numpy, pandas, shinylive und jupyter in einem Rutsch
reticulate::conda_install(
  envname = "shinylive-env", 
  packages = c("numpy", "pandas", "shinylive", "jupyter"),
  pip = TRUE # Verwendet pip innerhalb von Conda, um Plattform-Konflikte zu vermeiden
)

reticulate::py_config()

system("quarto add quarto-ext/shinylive --no-prompt")

