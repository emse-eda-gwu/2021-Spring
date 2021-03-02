lesson <- strsplit(here::here(), "/")[[1]]
lesson <- lesson[length(lesson)]

# Build the slides
xaringanBuilder::build_html("index.Rmd")
xaringanBuilder::build_pdf("index.Rmd", paste0(lesson, ".pdf"))

# Create zip files of class notes
zip::zip(
    zipfile = paste0(lesson, ".zip"),
    files = c(
        'data',
        'notes-blank.Rmd',
        'notes-complete.Rmd',
        paste0(lesson, ".Rproj")))
