# Render the html page
rmarkdown::render('rubric.Rmd')

# Save html page as a pdf 
pagedown::chrome_print(
    input  = 'rubric.html',
    output = 'rubric.pdf')
