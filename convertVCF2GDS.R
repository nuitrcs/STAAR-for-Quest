
args <- commandArgs()

inputvcf <- args[1]
outputgds <- args[2]

library(SeqArray)

seqVCF2GDS(inputvcf, outputgds, header=NULL, storage.option="LZMA_RA",
    info.import=NULL, fmt.import=NULL, genotype.var.name="GT",
    ignore.chr.prefix="chr", scenario=c("general", "imputation"),
    reference=NULL, start=1L, count=-1L, optimize=TRUE, raise.error=TRUE,
    digest=TRUE, parallel=FALSE, verbose=TRUE)

genofile<-seqOpen(outputgds, readonly = FALSE)
print("GDS built")

###Closing Up###
genofile
seqClose(genofile)