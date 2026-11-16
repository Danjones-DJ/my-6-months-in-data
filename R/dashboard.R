dashboard <- function(current_output) {
  
  # Get summary statistics
  stats <- summary_stats(current_output)
  
  # Create Output directory
  if (!dir.exists("Output")) {
    dir.create("Output")
  }
  
  # Create dashboard
  html <- htmltools::tags$html(
    
    htmltools::tags$head(
      htmltools::tags$title("My Life in Data — Summary"),
      
      htmltools::tags$style(htmltools::HTML("
        body {
          font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
          background: #f5f6f8;
          color: #222;
          max-width: 1100px;
          margin: 0 auto;
          padding: 40px;
        }

        h1 {
          margin-bottom: 5px;
        }

        .subtitle {
          color: #666;
          margin-bottom: 35px;
        }

        .grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
          gap: 20px;
        }

        .card {
          background: white;
          border-radius: 12px;
          padding: 25px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .label {
          font-size: 14px;
          color: #777;
          margin-bottom: 10px;
        }

        .value {
          font-size: 32px;
          font-weight: 700;
        }
      "))
    ),
    
    htmltools::tags$body(
      
      htmltools::tags$h1("My Life in Data"),
      
      htmltools::tags$p(
        paste0("Summary of the first ", stats$days_elapsed, " days"),
        class = "subtitle"
      ),
      
      htmltools::tags$div(
        class = "grid",
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Mean happiness", class = "label"),
          htmltools::tags$div(
            paste0(stats$mean_happiness, " / 10"),
            class = "value"
          )
        ),
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Days with university worked completed", class = "label"),
          htmltools::tags$div(
            paste0(round(stats$prop_days_uni * 100), "%"),
            class = "value"
          )
        ),
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Days coaching", class = "label"),
          htmltools::tags$div(
            paste0(round(stats$prop_days_coaching * 100), "%"),
            class = "value"
          )
        ),
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Days felt good", class = "label"),
          htmltools::tags$div(
            paste0(round(stats$prop_days_felt_good * 100), "%"),
            class = "value"
          )
        ),
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Days left the house", class = "label"),
          htmltools::tags$div(
            paste0(round(stats$prop_days_left_house * 100), "%"),
            class = "value"
          )
        ),
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Days went on a walk", class = "label"),
          htmltools::tags$div(
            paste0(round(stats$prop_days_went_on_walk * 100), "%"),
            class = "value"
          )
        ),
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Days cried", class = "label"),
          htmltools::tags$div(
            paste0(round(stats$prop_days_cried * 100), "%"),
            class = "value"
          )
        ),
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Days ill", class = "label"),
          htmltools::tags$div(
            paste0(round(stats$prop_days_ill * 100), "%"),
            class = "value"
          )
        ),
        
        htmltools::tags$div(
          class = "card",
          htmltools::tags$div("Days 1% better", class = "label"),
          htmltools::tags$div(
            paste0(round(stats$prop_days_1pc_better * 100), "%"),
            class = "value"
          )
        )
      )
    )
  )
  
  # Save dashboard
  htmltools::save_html(
    html,
    file = "Output/dashboard.html"
  )
}