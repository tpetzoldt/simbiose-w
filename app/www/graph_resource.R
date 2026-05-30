library("DiagrammeR")
library(htmlwidgets)
library(webshot2)



graph <- "
digraph ressource_limited {

  graph [rankdir = 'LR', bgcolor='none', fontsize=10]

  node [shape = circle, height='0.2', fixedsize=false, fontsize=8, penwidth=0.7, fontname='Open Sans']
   r [xlabel='intrinsische Wachstumsrate']

  node [shape = box, penwidth=2]
    P [label='Phosphor']
    A [label='Algen']

  #node [shape = octagon, width=0.5, penwidth=0.5, style='rounded', fixedsize=true, height=0.25]
    #Source
    #Sink

  node [shape=hexagon, style='',width=0.5, penwidth=0.5, height=0.25]
    Wachstum [label=<<I>Wachstum</I>>]

  edge [penwidth=1.5]
    P -> Wachstum [dir = none, color = 'blue']# headclip=false]
    Wachstum -> A      [dir = left, color = 'blue']

  edge [penwidth=0.7, arrowhead=normal, tailport = 's', headport = 's', constraint = false, color=tomato]
    A -> Wachstum [label='+']

  edge [penwidth=0.7, arrowhead=normal, tailport = 'e', headport = 'n', constraint = false, color=tomato]
    r -> Wachstum
}"


fig <- grViz(graph)

print(fig)

temp_html <- "tmp.html"
saveWidget(widget = fig, file = temp_html)
webshot2::webshot(url = temp_html, file = "graph_resource.pdf")
