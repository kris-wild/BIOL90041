# build_workshops.R
library(rmarkdown)

# A little helper to render one workshop
render_workshop <- function(rmd, out_dir) {
  render(
    input      = rmd,
    output_file= "index.html",
    output_dir = out_dir,
    quiet      = TRUE
  )
}

# Render every workshop
render_workshop("Week_2/Workshop/dplyr.Rmd",   "docs/week2-workshop")
render_workshop("Week_3/Workshop/tidy_1.Rmd",  "docs/week3-tidy1")
#render_workshop("Week_4/Workshop/tidy_2.Rmd",  "docs/week4-tidy2")