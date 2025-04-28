library(officer)
library(magrittr)

# Load the PowerPoint template
my_pres <- read_pptx("blank.pptx")

# Inspect layout structure
knitr::kable(layout_summary(my_pres))

# Inspect properties of a specific layout
knitr::kable(layout_properties(my_pres, layout = "Title and Content", master = "Office Theme"))

# Text content
intro <- "Earlier this year we talked about how limited housing supply was helping to drive accelerating house prices across the country. In such an environment you would expect to see housing vacancies decline. Indeed, if you look at the rate of rental or homeowner vacancies you see a substantial reduction. But if we look a little closer at the housing inventory data something curious emerges."

cap1 <- "During the Great Recession homeowner vacancy rates spiked, and gradually came back down. Rental vacancy rates did not spike nearly as much, but also came down in recent years as housing markets have gotten pretty tight."
cap2 <- "The top two panels show the vacant for rent vacant for sale units that make up the rental and homeowner vacancy rates..."
cap3 <- "The year-round vacant other category has increased almost a full percentage point since 2005. Just to be clear, that's a lot of housing units..."
cap4 <- "The U.S. Census Bureau began tracking a breakdown of the other category since 2012..."
cap5 <- "The share vacant due to foreclosure has declined quite a lot since 2012..."

myftr <- "@lenkiefer R to PowerPoint"

# Build PowerPoint
my_pres <- read_pptx("blank.pptx") %>%
  
  # Title Slide
  add_slide(layout = "Title Slide", master = "Office Theme") %>%
  ph_with("If housing inventory is so tight, why are so many homes vacant?", location = ph_location_type(type = "ctrTitle")) %>%
  ph_with("A PowerPoint Summary of http://lenkiefer.com/2017/09/17/housing-vacancy-trends/", location = ph_location_type(type = "subTitle")) %>%
  ph_with(myftr, location = ph_location_type(type = "ftr")) %>%
  
  # Summary Slide
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with("Summary", location = ph_location_type(type = "title")) %>%
  ph_with(intro, location = ph_location_type(type = "body")) %>%
  ph_with(myftr, location = ph_location_type(type = "ftr")) %>%
  ph_with(format(Sys.Date(), "%B %d, %Y"), location = ph_location_type(type = "dt")) %>%
  
  # Slide with Chart 1
  add_slide(layout = "Content with Caption", master = "Office Theme") %>%
  ph_with(cap1, location = ph_location_type(type = "body")) %>%
  ph_with(external_img("i1.png", width = 6, height = 4), location = ph_location_type(type = "body")) %>%
  ph_with("Homeowner and rental vacancy rates have declined", location = ph_location_type(type = "title")) %>%
  ph_with(myftr, location = ph_location_type(type = "ftr")) %>%
  ph_with(format(Sys.Date(), "%B %d, %Y"), location = ph_location_type(type = "dt")) %>%

  # Save PowerPoint file
  print(target = "Housing Vacancy Blog Post.pptx") %>%
  invisible()
