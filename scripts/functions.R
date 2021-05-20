# Functions

# Return Percentage and count of variable
percent_fakenews <- function(x,y) {
  percentage <- round(table(x) / sum(table(x)) * 100, 2)
  count <- table(x)
  print(y)
  return(cbind(percentage, count))
}
