library("DiagrammeR")
library(htmlwidgets)
library(webshot2)


graph <- "
digraph exponential_growth {

  graph [rankdir = 'LR', bgcolor='none', fontsize=10]

  node [shape = circle, height='0.2', fixedsize=false, fontsize=8, penwidth=0.7, fontname='Open Sans']
   r [xlabel='  Reproduction rate']

  node [shape = box, penwidth=2]
    N [label='Population N']

  node [shape = octagon, width=0.5, penwidth=0.5, style='rounded', fixedsize=true, height=0.25]
    Source
    #Senke

  node [shape=hexagon, style='', width='' height=0.25]
    growth [label=<<I>Growth</I>>]

  edge [penwidth=1.5]
    Source -> growth [dir = none, color = 'blue']# headclip=false]
    growth -> N      [dir = left, color = 'blue']# tailclip=false]
    #N -> Senke

  edge [penwidth=0.7, arrowhead=normal, tailport = 's', headport = 's', constraint = false, color=tomato]
    N -> growth [label='+']

  edge [penwidth=0.7, arrowhead=normal, tailport = 'e', headport = 'n', constraint = false, color=tomato]
    r -> growth
}
"

fig <- grViz(graph)

print(fig)

temp_html <- "tmp.html"
saveWidget(widget = fig, file = temp_html)
webshot2::webshot(url = temp_html, file = "graph_exponential_en.pdf")
