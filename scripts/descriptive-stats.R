percent_fakenews <- function(x,y) {
  percentage <- round(table(x) / sum(table(x)) * 100, 2)
  count <- table(x)
  print(y)
  return(cbind(percentage, count))
}

barplot(table(nytimes$Q44), main = "NY Times")
percent_fakenews(nytimes$Q44, "New York Times")

barplot(table(foxnews$Q44), main = "Fox News")
percent_fakenews(foxnews$Q44, "Fox News")

barplot(table(apnews$Q44), main = "AP News")
percent_fakenews(apnews$Q44, "AP News")

barplot(table(npr$Q44), main = "NPR")
percent_fakenews(npr$Q44, "NPR")
