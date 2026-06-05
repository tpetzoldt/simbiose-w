library(reticulate)
library(quarto)

reticulate::py_config()$python

reticulate::py_run_string("import shinylive; print('Erfolg! shinylive Version:', shinylive.__version__)")

system("quarto add quarto-ext/shinylive --no-prompt")
