# Development-Fork!

Achtung, dies ist eine instabile Entwicklerversion, das originale Repository findet sich unter https://gitlab.hrz.tu-chemnitz.de/simbiose/simbiose-w


# Wachstumsmodelle


Das Repository beinhaltet den Quellcode einer App zur Visualisierung von Wachstumsmodellen in der Ökologie am Beispiel des Planktons eines Sees. Sie entstand im Projekt SimBioSe im Rahmen des Fonds "Digitales Lernen und Lehren" der TU Dresden.

## App ausprobieren

Die [App](https://weblab.hydro.tu-dresden.de/app/simbiose-w/) läuft ohne Installation im Webbrowser unter Windows, Linux, iOS und Android. Im Interesse einer guten Übersicht ist ein ausreichend großer Bildschirm (Laptop, PC, Tablet) empfehlenswert.

* Hier gehts zur App: [https://weblab.hydro.tu-dresden.de/app/simbiose-w/](https://weblab.hydro.tu-dresden.de/app/simbiose-w/)

## Autoren

Thomas Petzoldt, Johannes Feldbauer, TU Dresden, Institut für Hydrobiologie

Dank an Lanoma-Design für die Gestaltung der Icons von Phosphor, Grünalge und Daphnia, sowie an Felix Grunicke für das Foto eines klaren Sees.

## Implementierung

Die Implementierung erfolgte mit Hilfe der der Programmiersprache [**R**](https://www.r-project.org) und dem [Shiny](https://shiny.posit.co/)-Paket für interaktive Webgrafiken. Textsatz und Layout erfolgen mit dem [Quarto](https://quarto.org/) publishing System. Für die numerischen Simulationen wird das Paket [deSolve](https://cran.r-project.org/package=deSolve) verwendet, für die Visualisierung die Pakete [ggplot2](https://cran.r-project.org/package=ggplot2) und [plotly](https://CRAN.R-project.org/package=plotly).
Die Systemdiagramme wurden mit dem Paket [DiagrammeR](https://cran.r-project.org/package=DiagrammeR) erstellt.

## Lizenz/License

Die App Ist eine "Offene Bildungsresource". 
Sie dürfen die App als Ganzes sowie einzelne Bausteine gemäß der [Creative Commons Lizenz CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) frei verwenden (teilen, bearbeiten, Namensnennung, Weitergabe unter gleichen Bedingungen). Wenn Sie das Material remixen, verändern oder anderweitig direkt darauf aufbauen, dürfen Sie Ihre Beiträge nur unter derselben Lizenz wie das Original verbreiten. Es wird keine Gewähr für die inhaltliche Richtigkeit und technische Funktion übernommen.

The app is an "open educational resource". You may freely use (share, edit) the app as a whole as well as individual components in accordance with the [Creative Commons License CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) as long as you attribute its authors. If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original. No guarantee is given for the correctness of content and technical function.

![](app/www/by-sa.png){height=40px fig-alt="Logo CC BY-SA"}
![](app/www/oer-banner.png){height=40px fig-alt="Logo: Open Educational Resources"}

----
2026-03-25


## Projekt-Status

Die App wird bei Bedarf weiterentwickelt, konstruktive Hinweise sind willkommen. Eine englische Übersetzung ist in Arbeit.
