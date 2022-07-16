spinner <- function() {
  div(class = "loader",
      div(class = "spinner",
          div(class = "container-B",
              div(class = "hex0"),
              div(class = "hex120"),
              div(class = "hex240"),
              div(class = "spinner",
                  div(class = "container-B",
                      div(class = "hex0"),
                      div(class = "hex120"),
                      div(class = "hex240"),
                      div(class = "spinner",
                          div(class = "container-B",
                              div(class = "hex0"),
                              div(class = "hex120"),
                              div(class = "hex240")
                          )
                      )
                  )
              )
          )
      )
  )
}
