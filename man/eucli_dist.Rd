% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eucli_dist.R
\name{eucli_dist}
\alias{eucli_dist}
\title{eucli_dist}
\usage{
eucli_dist(m1, m2)
}
\arguments{
\item{m1}{a dmProfile to be compared with another one.}

\item{m2}{the other one dmProfile.}
}
\description{
A function to compute adapted eucliddean distance on differential methylation profile. This function is called by dmDistance and dmDistance_translocate functions.
}
\examples{
### generate random samples ids
randomDataset          <- dmRandomDataset()
### get a methylation differential table
meth_study          <- randomDataset$meth_study
tumoral_ref         <- rownames(meth_study$exp_grp)[meth_study$exp_grp$ref=="case"]
control_ref         <- rownames(meth_study$exp_grp)[meth_study$exp_grp$ref=="ctrl"]
diff_meth_study     <- dmTable(meth_study$data,
                              meth_study$platform,
                              meth_study$exp_grp,
                              tumoral_ref,
                              control_ref)
### get dmProfiles for multiple genes
genes        <- randomDataset$genes 
alldmProfile <- getalldmProfile(diff_meth_study,
                                bedfile = genes, slide = 500,
                                pf_chr_colname = "chr",
                                pf_pos_colname = "pos")

### Compute eucliddean distance between two dmProfile 
m1 <- alldmProfile[[1]]
m2 <- alldmProfile[[2]]
eucli_dist(m1,m2)
}
