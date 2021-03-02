lesson <- strsplit(here::here(), "/")[[1]]
lesson <- lesson[length(lesson)]

# Build the slides at an html and pdf
xaringanBuilder::build_pdf("index.Rmd")

# Rename PDF of slides
file.rename(from = "index.pdf", to = paste0(lesson, ".pdf"))

# Create zip files of class notes
zip::zip(
    zipfile = paste0(lesson, ".zip"),
    files = c(
        'data',
        'notes-blank.Rmd',
        'notes-complete.Rmd',
        paste0(lesson, ".Rproj")))
