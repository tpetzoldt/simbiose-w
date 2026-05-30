library("DiagrammeR")
library(htmlwidgets)
library(webshot2)


fig_lv <- grViz("digraph lotka {
         graph [rankdir = 'LR', bgcolor='none']
      
           node [shape=circle, height=0.25, fontsize=8, penwidth=0.7, fontname = 'Helvetica', group=parameters]
             a [xlabel='Wachstumsrate']
             c [xlabel='Zuwachseffizienz']
             b [xlabel='Fraßintensität']
             d [xlabel='Sterberate']
      
           node [shape = box, penwidth=2, group=flow]
             Beute, Räuber
           node [shape = octagon, penwidth=0.5, style='rounded', fixedsize=25, fontsize=8]
             Quelle Senke
           node [shape=hexagon, style='',width=0.8, penwidth=0.5, height=0.25]
             wachsen absterben fressen
      
           
           edge [penwidth=1.5, color = blue]
             Quelle -> wachsen [dir=none]
             wachsen -> Beute 
             Beute -> fressen [dir=none]
             fressen -> Räuber 
             Räuber -> absterben [dir=none]
             absterben -> Senke
           
           edge [penwidth=0.7, tailport = 's', headport = 's', constraint = false, color=tomato]
             Beute -> wachsen 
             Räuber -> fressen 
      
      
           edge [penwidth=0.7, tailport = 's', headport = 's', constraint = false, color=tomato]
             Beute -> fressen
             Räuber -> absterben
          
           edge [penwidth=0.7, spline='', tailport = 'e', headport = 'n', constraint = true, color=tomato]
             a -> wachsen [splines=ortho]
             b -> fressen
             c -> fressen
             d -> absterben
}")


print(fig_lv)

temp_html <- "lv.html"
saveWidget(widget = fig_lv, file = temp_html)
webshot2::webshot(url = temp_html, file = "lotka_volterra_modell.pdf")
