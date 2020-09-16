## libaries

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms
library(purrr)
library(dplyr)

## Load local dataset for clustering

df_raw = read_csv("Downloads/Mall_Customers.csv")

## Understand the dataset

head(df_raw) # Look at sample rows
str(df_raw) # structure
summary(df_raw) # summary statistics
any(is.na(df_raw)) # Check for any NA

## Data Cleaning (if required)
df_raw = na.omit(df_raw)

## Determine variables for clustering and add-on descriptive/target variables

# Here we choose Income and Spending Score to cluster on 

df_mod = df_raw[,c(4,5)]
summary(df_mod)

# we don’t want the clustering algorithm to depend to an arbitrary variable unit
# Hence, we scale the data

df_scaled =  as.data.frame(scale(df_mod))
summary(df_scaled)


## Aggolomerative Hierarchical Clustering with hclust


dist_mat = dist(df_scaled, method = 'euclidean') # Dissimilarity Matrix

hclust_1 = hclust(dist_mat, method = 'complete') # Complete Linkage
plot(hclust_1, hang = -1, cex = 0.2, main = 'Dendrogram of hclust')

## Aggolomerative Clustering with Agnes ((Agglomerative Nesting)
# Behaves like hclust but also provides the agglomerative coefficient 
# Coefficient measures the stability of the cluster and closer to 1 suggests a good clustering

# methods to assess
m = c( "average", "single", "complete", "ward")
names(m) = c( "average", "single", "complete", "ward")

# function to compute coefficient
ac = function(x) {
  agnes(df_scaled, method = x)$ac
}

map_dbl(m, ac)

#average    single  complete      ward 
#0.9482727 0.8109312 0.9773909 0.9920513 

hclust_2 = agnes(df_scaled, method = "ward")
pltree(hclust_2, cex = 0.1, hang = -1, main = "Dendrogram of agnes") 

## Divisive hierarchical clustering
hclust_3 = diana(df_scaled)
hclust_3$dc # 0.9702927
pltree(hclust_3, cex = 0.1, hang = -1, main = "Dendrogram of diana")



# In addition to the dendrogram, we can look at the elbow plot / silhouette score to determine no. of clusters

fviz_nbclust(df_scaled, FUN = hcut, method = "wss")
fviz_nbclust(df_scaled, FUN = hcut, method = "silhouette")

## Obtaining final groups

hclust_4 = hclust(dist_mat, method = "ward.D2" ) # Ward's method
# ward.D = Ward’s minimum variance method
# ward.D2 = Ward’s minimum variance method – however dissimilarities are squared before clustering
sub_grp = cutree(hclust_4, k = 5) # Cut tree into 5 groups
table(sub_grp) # Number of members in each cluster
df_clusters = df_raw %>% # Add as column to initial dataset
                  mutate(cluster = sub_grp)

# Visualization of clusters
plot(hclust_4, cex = 0.1, hang = -1)
rect.hclust(hclust_4, k = 5, border = 2:5) # boxes around clusters


# Cut agnes() tree into 5 groups
#hc_a = agnes(df_scaled, method = "ward")
#cutree(as.hclust(hc_a), k = 5)
# Cut diana() tree into 4 groups
#hc_d = diana(df_scaled)
#cutree(as.hclust(hc_d), k = 5)

ggplot(df_clusters, aes(x=df_clusters$`Annual Income (k$)`, 
                        y=df_clusters$`Spending Score (1-100)`, 
                        color=sub_grp)) + geom_point(size=2)


df_clusters %>%
  group_by(cluster) %>%
  summarise_at(.vars = c("Age", "Annual Income (k$)", "Spending Score (1-100)"), .funs = mean)

