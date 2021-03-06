# installs the librarian package if you don't have it
if (!("librarian" %in% rownames(utils::installed.packages()))) {
  utils::install.packages("librarian")
}

# put all of the packages that you import here
librarian::shelf( 
  cran_repo = "https://cran.microsoft.com/", # Dallas, TX
  ask = FALSE,
  stats, # https://stackoverflow.com/questions/26935095/r-dplyr-filter-not-masking-base-filter#answer-26935536
  here,
  kableExtra,
  rlang,
  ggthemes,
  tidyverse,
  janitor,
  magrittr,
  glue,
  lubridate,
  haven,
  snakecase,
  sandwich,
  lmtest,
  gganimate,
  gapminder,
  stargazer,
  snakecase,
  rpart,
  rpart.plot,
  rsample,
  randomForest,
  modelr,
  gbm,
  pdp,
  remotes,
  urbnmapr,
  ggmap,
  maps,
  mapdata,
  usmap,
  scales,
  foreach,
  caret,
  mosaic,
  LICORS,
  ggcorrplot,
  arules,
  arulesViz,
  igraph,
  RColorBrewer,
  parallel,
  iterators,
  doParallel
)

# tell here where we are so we can use it elsewhere
here::i_am("Data-Mining-PS4/include.R")

