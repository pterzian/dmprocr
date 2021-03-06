#'clustdmProfile
#' 
#'Plot a dendrogram from a distance matrix, select cluster by clicks on the graphical window, click finish to get a list of geneNames in each cluster selected.
#'
#'@param mat a distance Matrix
#'@param fill_NA boolean specifying if NA should be imputed, need to be kept TRUE for now if there are NA in the matrix
#'@param geneLabels A vector of genes names or id, can be extracted from a list of dmProfile with getProfileId
#'
#'@return A list of 2 object, the hclust result and a list containing the name of genes for each vector
#'
#'@export
clustdmProfile <- function(mat, fill_NA = TRUE, geneLabels){
  
  if(fill_NA){
    for(i in 1:ncol(mat)){
      mat[is.na(mat[,i]), i] <- mean(c(mean(mat[,i], na.rm = TRUE),
                                       mean(mat[i,], na.rm = TRUE)))
    }
  }
  
 
  colnames(mat) <- geneLabels
  rownames(mat) <- geneLabels
  
  
  hclust_result <- stats::hclust(stats::as.dist(mat), method = "complete")
  
  graphics::plot(hclust_result)
  
  print("Plot ready for cluster selection...")
  
  list_clust <- graphics::identify(hclust_result)
  
  print("Selection over")
  
  clust_res <- list(hclust_result = hclust_result, genes_clust = list_clust)
  
  return(clust_res)
  
}
