# ==============================================================================
# LINEARE SHINYLIVE-BUILD-PIPELINE (VON NULL AUF QUARTO RENDER)
# ==============================================================================

# 1. Basis-Pakete für die Brücke und das Rendering installieren
install.packages("reticulate")
install.packages("quarto")

library(reticulate)
library(quarto)

# 2. Eine isolierte, saubere Python-Version für R bereitstellen
# Installiert eine von R verwaltete Python-Instanz, um System-Konflikte zu vermeiden
reticulate::install_python()

# 3. Das virtuelle Environment definieren und absichern
# Wir deklarieren die Kern-Abhängigkeiten, BEVOR Python initialisiert wird
reticulate::py_require("numpy")
reticulate::py_require("pandas")

# 4. Shinylive und Jupyter in die aktive R-Python-Umgebung (r-reticulate) installieren
# Hinweis: Jupyter ist notwendig, damit Quarto die Python-Pakete beim Rendern ansprechen kann.
reticulate::py_install(c("shinylive", "jupyter"))

# 5. Kontrolle: Welche Python-Instanz wird jetzt aktiv genutzt?
# Das zeigt uns den exakten Pfad zur Sandbox-Umgebung
reticulate::py_config()$python

# 6. Funktionstest: Lässt sich das Python-Paket fehlerfrei importieren?
reticulate::py_run_string("import shinylive; print('Erfolg! shinylive Version:', shinylive.__version__)")

# 7. Die Shinylive-Quarto-Erweiterung installieren (falls noch nicht geschehen)
# Das entspricht dem Terminal-Befehl 'quarto add quarto-ext/shinylive'
# Muss pro Projektverzeichnis einmalig ausgeführt werden
system("quarto add quarto-ext/shinylive --no-prompt")

# 8. DER FINALE SCHRITT: Das Dokument mit der serverlosen App rendern
# Quarto nimmt das qmd, nutzt reticulate/Python im Hintergrund und baut die statischen Assets.
quarto::quarto_render("test.qmd")
