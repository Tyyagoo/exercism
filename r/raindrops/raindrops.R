sounds <- c(Pling = 3, Plang = 5, Plong = 7)

raindrops <- function(number) {
  result <- paste0(names(sounds[number %% sounds == 0]), collapse='')
  if (nzchar(result)) { result } else { as.character(number) }
}
