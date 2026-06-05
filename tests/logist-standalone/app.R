library(shiny)
library(ggplot2)
library(shinythemes)

source("solvers.R")

# ==============================================================================
# 2. MODEL EQUATIONS
# ==============================================================================
logist <- function(t, x, parms) {
  with(as.list(c(x, parms)), {
    dN <- r_max * N * (1 - N / K)
    list(c(dN))
  })
}

times <- seq(0, 100, by = 0.5)

# ==============================================================================
# 3. SHINY USER INTERFACE (Simulates the 2-column Dashboard layout)
# ==============================================================================
ui <- fluidPage(
  theme = shinytheme("cosmo"), 
  tags$head(
    tags$style(HTML("
      /* Make background seamless with the dashboard layout */
      body { background-color: transparent; padding: 0; margin: 0; } 
      .container-fluid { padding: 0; }
      .well { background-color: #f8f9fa; border: 1px solid #e3e3e3; box-shadow: none; }
    "))
  ),
  sidebarLayout(
    sidebarPanel(
      width = 4, # Left panel (approx. 33% width)
      h4("Initial Values"),
      numericInput("logist_N0", "N0: Abundance", value = 1.0, min = 0, max = 1000, step = 0.1),
      hr(),
      h4("Parameters"),
      sliderInput("logist_r", "r_max: Growth rate", value = 0.1, min = 0, max = 1, step = 0.02),
      sliderInput("logist_K", "K: Carrying capacity", value = 100, min = 0, max = 1000, step = 10)
    ),
    mainPanel(
      width = 8, # Right panel (approx. 66% width)
      plotOutput("logist_plot", height = "480px")
    )
  )
)

# ==============================================================================
# 4. SHINY SERVER LOGIC (Runs locally in the user's browser via webR)
# ==============================================================================
server <- function(input, output, session) {
  
  output$logist_plot <- renderPlot({
    parms <- c(r_max = input$logist_r, K = input$logist_K)
    y0    <- c(N = input$logist_N0)
    
    # Run simulation locally using your custom standalone solver core
    res <- ode45(y0, times, logist, parms)
    
    # Render static ggplot2 (highly optimized and fast in WebAssembly)
    ggplot(res, aes(x = time, y = N)) + 
      geom_line(color = "#69af22", size = 1.2) + 
      labs(x = "Time", y = "Abundance") +
      theme_minimal() +
      theme(
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 12, face = "bold"),
        panel.grid.minor = element_blank()
      )
  })
}

shinyApp(ui = ui, server = server)
