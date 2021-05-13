
navbarPageWithSearchBox <- function(..., menu, refresh) {
  navbar <- navbarPage(...)
  butt <- tags$form(class = "navbar-form; navbar-left",br(), refresh)
  navbar[[3]][[1]]$children[[1]] <- htmltools::tagAppendChild(
    navbar[[3]][[1]]$children[[1]], butt)
  
  navbar
}

shinyUI(
  
 navbarPageWithSearchBox("",id = "inTabset", theme = shinythemes::shinytheme("readable"), position='fixed-top',
  windowTitle = "BTracT",
                         
        tabPanel("BTracT",
                 br(),br(),br(),br(),br(),
                 frontpage()
                 ),
        tabPanel("Overview",
                 br(),br(),br(),br(),br(),
                 includeCSS("www/AdminLTE.css"), # for activating shinydashboard/plus widgets
                  overviewPage()
                 ),
        tabPanel("Data",
                br(),br(),br(),br(),br(),
                 dataPage()
                 ),
        tabPanel("Status",
                br(),br(),br(),br(),br(),
                 statuspage()
                 ),
        navbarMenu("Labels",
                 tabPanel("TC Label Management",
                          br(),br(),br(),br(),br(),
                          tc_page()),
                 
                 tabPanel("Download barcodes",
                          br(),br(),br(),br(),
                          labels()
                 )
                 
                 ),
        navbarMenu("About",
                   tabPanel(
                        a("Using BTracT", href="docs/usingbtract.html", target="_blank", icon=icon("note"))
                   ),
                   tabPanel(
                     a("Using Dashboard", href="docs/dashboard.html", target="_blank", icon=icon("note"))
                   ),
                   tabPanel(
                     a("Updates", href="docs/updates.html", target="_blank", icon=icon("note"))
                   )
                 ),
        
        refresh = div( 
              actionBttn("refresh", size="xs", style="pill", color="danger",label = "",
                               icon=icon("refresh", lib = "font-awesome"))
          )
  )
)
