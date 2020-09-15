# Introduction to Hierarchical Clustering

### What is Clustering?

Clustering is the process of dividing the population into a number of groups based on patterns in the data. Clusters or groups are defined such that data points within the same group are more similar to each other than to data points in other clusters / groups.

#### Categories of Clustering 

* Hard Clustering: In hard clustering, each data point either belongs to a cluster completely or not. 
* Soft Clustering: In soft clustering, instead of putting each data point into a separate cluster, a probability or likelihood of that data point to be in those clusters is assigned. 


---

### Clustering is Subjective 

<img width="1305" alt="Screen Shot 2020-09-14 at 10 58 54 PM" src="https://user-images.githubusercontent.com/29546133/93160298-04af6e80-f6de-11ea-9fad-c6f7cc59f666.png">


---

### Types of Clustering

<img width="1242" alt="Screen Shot 2020-09-14 at 10 59 09 PM" src="https://user-images.githubusercontent.com/29546133/93160352-227cd380-f6de-11ea-9c08-0425b920bc33.png">

---

### K-Means 

For K-Means the no. of clusters required at the end has to be mentioned beforehand, which makes it important to have prior knowledge of the dataset. These models run iteratively to find the local optima.


<img width="821" alt="Screen Shot 2020-09-14 at 10 29 06 PM" src="https://user-images.githubusercontent.com/29546133/93158279-ce6ff000-f6d9-11ea-9ffe-c8690dc8474a.png">


---
---

## Hierarchical Clustering

Clustering algorithm which involves creating clusters that have predominant ordering from top to bottom. 
Hierarchical clustering can be of 2 categories: 
* bottom-up (agglomerative / additive)
* top down (divisive)

#### Aggolomerative

<img width="1330" alt="Screen Shot 2020-09-14 at 10 51 20 PM" src="https://user-images.githubusercontent.com/29546133/93160011-733ffc80-f6dd-11ea-830c-d59ec6eaa48c.png">

#### Divisive

<img width="1333" alt="Screen Shot 2020-09-14 at 10 51 06 PM" src="https://user-images.githubusercontent.com/29546133/93160031-7c30ce00-f6dd-11ea-87d1-342db7337faf.png">

---

### So, how are we measuring SIMILARITY?

1. Single-linkage: the distance between two clusters is defined as the shortest distance between two points in each cluster
2. Complete-linkage: the distance between two clusters is defined as the longest distance between two points in each cluster.
3. Average-linkage: the distance between two clusters is defined as the average distance between each point in one cluster to every point in the other cluster.
4. Centroid-linkage: finds the centroid of cluster 1 and centroid of cluster 2, and then calculates the distance between the two before merging.
5. Wards-linkage: instead of measuring the distance directly, it analyzes the variance of clusters. Ward’s method says that the distance between two clusters, A and B, is how much the sum of squares will increase when we merge them. 

<img width="504" alt="Screen Shot 2020-09-14 at 11 46 44 PM" src="https://user-images.githubusercontent.com/29546133/93163230-94581b80-f6e4-11ea-9c89-b6ff7ac18620.png">

<img width="884" alt="Screen Shot 2020-09-14 at 11 45 15 PM" src="https://user-images.githubusercontent.com/29546133/93163254-a3d76480-f6e4-11ea-93f8-7ab9e4e57054.png">

