# ==============================================================================
# LINEAR SHINYLIVE BUILD PIPELINE (FROM SCRATCH TO QUARTO RENDER)
# ==============================================================================

# 1. Install the basic packages for the bridge and rendering
install.packages("reticulate")
install.packages("quarto")
install.packages("shinylive")

library(reticulate)
#library(quarto)

# 2. Set up a separate, clean Python environment for R
# Installs a Python instance managed by R to avoid system conflicts
reticulate::install_python()

# 3. Defining and securing the virtual environment
# We declare the core dependencies BEFORE Python is initialised
reticulate::py_require("numpy")
reticulate::py_require("pandas")

# 4. Install Shinylive and Jupyter in the active R-Python environment (r-reticulate)
# Note: Jupyter is required so that Quarto can access the Python packages during rendering.
reticulate::py_install(c("shinylive", "jupyter"))

# 5. Check: Which Python instance is currently in use?
# This shows us the exact path to the sandbox environment
reticulate::py_config()$python

# 6. Functionality test: Can the Python package be imported without errors?
reticulate::py_run_string("import shinylive; print('Erfolg! shinylive Version:', shinylive.__version__)")

# 7. Install the Shinylive Quarto extension (if not already done so)
# This corresponds to the terminal command “quarto add quarto-ext/shinylive”
# This must be run once for each project directory
system("quarto add quarto-ext/shinylive --no-prompt")

# 8. THE FINAL STEP: Rendering the quarto document into the serverless app
# Quarto takes the qmd file, uses reticulate/Python in the background, and builds the static assets.
quarto::quarto_render("test.qmd")
