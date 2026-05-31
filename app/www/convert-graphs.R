library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)

convert_graph <- function(obj) {

  source(paste0(obj, ".R")) # retunrns object graph

  graph |>
    grViz() |>
    export_svg() |> charToRaw() |> rsvg_pdf(paste0(obj, ".pdf"))

  graph |>
    grViz() |>
    export_svg() |> charToRaw() |> rsvg_png(paste0(obj, ".png"))

  graph |>
    grViz() |>
    export_svg() |> charToRaw() |> rsvg_svg(paste0(obj, ".svg"))

}

convert_graph("graph_exponential")
convert_graph("graph_logistic")
convert_graph("graph_resource")
convert_graph("graph_lv")
