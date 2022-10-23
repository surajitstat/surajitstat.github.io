# Merging citations checking changes
library(semscholar)
aa=s2_authors("1901464")
sem.papers=aa$papers[[1]]
scopus<-read.csv("../_data/citations.csv")


merged<-merge(scopus, sem.papers, by.x='Title', by.y='title',all.x = TRUE) # this works!
scopus$SEMID[match(scopus$Title, sem.papers$title)] <- sem.papers$paper_id


write.csv(merged,"../_data/merged.csv",na ="")



s3_authors<-
function (s2_author_id = NULL, .progress = "none") 
{
  stopifnot(!is.null(s2_author_id), is.character(s2_author_id))
  if (any(s2_author_id %in% "")) {
    s2_author_id <- s2_author_id[s2_author_id != ""]
    warning("Removed empty characters from IDs vector")
  }
  tt_out <- plyr::llply(s2_author_id, s2_authors_, .progress = .progress)
  dplyr::bind_rows(tt_out)
}
