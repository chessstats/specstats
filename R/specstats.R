#' Spec stats
#'
#' Special statistics of Fide players
#' @param none none
#' @keywords Fide players list special statistics
#' @export
#' @examples
#' spec_stats()

spec_stats <- function() {
require(xtable)
require(qdapTools)
p<-read.table("current/players.txt")
r<-read.table("current/stats/birthday.txt",header=TRUE)
p<-p[complete.cases(p$birthday),]
p[["rsurp"]]=p$rating-lookup(p$birthday,data.frame(r$birthday,r$avgr))
p[["age"]]=as.integer(2016-p$birthday)
s<-p[order(-p$rsurp),]
l<-s[1:1000,]
l<-l[c("name","country","sex","age","rating","rsurp")]
rownames(l)<-NULL
write.table(l,"current/youngtalents.txt")
print(xtable(l), type="html", file="current/youngtalents.html")	
}