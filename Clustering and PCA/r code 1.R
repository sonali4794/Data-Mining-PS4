#read data and remove NAs
wine = read_csv(here("Data-Mining-PS4/Clustering and PCA/wine.csv"))
wine = na.omit(wine)

#centre, scaling and rescaling
X = wine[, -(12:13)]
X = scale(X, center=TRUE, scale=TRUE)
mu = attr(X,"scaled:center")
sigma = attr(X,"scaled:scale")

#kmeans for wine comparison 
kmeans_cluster_wine = kmeans(X, 2, nstart=25)

ggplot(wine) + 
  geom_point(aes(color, density, color=factor(kmeans_cluster_wine$cluster)))+
  xlab("Color of the wine in original data") +
  ylab("Density") +
  labs(color = "Kmeans clustering") +
  labs(title = "Kmeans clustering showing seperation based on color of wine")

#kmeans for quality comparison
kmeans_cluster_quality = kmeans(X, 10, nstart=25)

ggplot(wine) + 
  geom_point(aes(quality, density, color=factor(kmeans_cluster_quality$cluster)))+
  xlab("Quality of the wine in original data") +
  ylab("Density") +
  labs(color = "Kmeans clustering")+
  labs(title = "Kmeans clustering showing seperation based on quality of wine") +
  scale_color_brewer(palette = "Dark2")

#kmeans++ for wine comparison
kmeanspp_cluster_wine = kmeanspp(X, 2, nstart=25)

ggplot(wine) + 
  geom_point(aes(color, density, color=factor(kmeanspp_cluster_wine$cluster)))+
  xlab("Color of the wine in original data") +
  ylab("Density") +
  labs(color = "Kmeans++ clustering") +
  labs(title = "Kmeans++ clustering showing seperation based on color of wine")

#kmeans++ for quality comparison
kmeanspp_cluster_quality = kmeanspp(X, 10, nstart=25)

ggplot(wine) + 
  geom_point(aes(quality, density, color=factor(kmeanspp_cluster_quality$cluster)))+
  xlab("Quality of the wine in original data") +
  ylab("Density") +
  labs(color = "Kmeans++ clustering")+
  labs(title = "Kmeans++ clustering showing seperation based on quality of wine") +
  scale_color_brewer(palette = "Dark2")

#tabular representation
df = data.frame(
  kmeanserr = c(kmeans_cluster_wine$tot.withinss,kmeans_cluster_wine$betweenss,kmeans_cluster_quality$tot.withinss,kmeans_cluster_quality$betweenss),
  kmeanspperr = c(kmeanspp_cluster_wine$tot.withinss,kmeanspp_cluster_wine$betweenss,kmeanspp_cluster_quality$tot.withinss,kmeanspp_cluster_quality$betweenss)
)
colnames(df) = c("Kmeans", "Kmeans++")
rownames(df) = c("within cluster error for wine","between cluster error for wine","within cluster error for quality","between cluster error for quality")

df = df %>%
  kbl() %>%
  kable_material_dark()
df

# #agglomerative hierarchial clustering
# wine_dist = dist(X)
# #for wine
# h1_wine = hclust(wine_dist, method='average')
# c1_wine = cutree(h1_wine, 2)
# D1_wine = data.frame(wine, z1_wine = c1_wine)
# ggplot(D1_wine) + geom_point(aes(x=color, y=density, col=factor(z1_wine)))
# 
# h2_wine = hclust(wine_dist, method='average')
# c2_wine = cutree(h2_wine, 2)
# D2_wine = data.frame(wine, z2_wine = c2_wine)
# ggplot(D2_wine) + geom_point(aes(x=color, y=density, col=factor(z2_wine)))
# 
# h3_wine = hclust(wine_dist, method='average')
# c3_wine = cutree(h3_wine, 2)
# D3_wine = data.frame(wine, z3_wine = c3_wine)
# ggplot(D3_wine) + geom_point(aes(x=color, y=density, col=factor(z3_wine)))
# 
# #for quality 
# h1_quality = hclust(wine_dist, method='average')
# c1_quality = cutree(h1_quality, 10)
# D1_quality = data.frame(wine, z1_quality = c1_quality)
# ggplot(D1_quality) + geom_point(aes(x=color, y=density, col=factor(z1_quality)))
# 
# 
# h2_quality = hclust(wine_dist, method='average')
# c2_quality = cutree(h2_quality, 10)
# D2_quality = data.frame(wine, z2_quality = c2_quality)
# ggplot(D2_quality) + geom_point(aes(x=color, y=density, col=factor(z2_quality)))
# 
# 
# h3_quality = hclust(wine_dist, method='average')
# c3_quality = cutree(h3_quality, 10)
# D3_quality = data.frame(wine, z3_quality = c3_quality)
# ggplot(D3_quality) + geom_point(aes(x=color, y=density, col=factor(z3_quality)))


#PCA for wine comparison 
pc2 = prcomp(X, scale=TRUE, rank=2)
scores2 = pc2$x

qplot(scores2[,1], scores2[,2], color=wine$color)+
  xlab("Principal Component 1") +
  ylab("Principal Component 2") +
  labs(color = "Wine Color")+
  labs(title = "PCA Analysis")

qplot(scores2[,1], scores2[,2], color=wine$quality)+
  xlab("Principal Component 1") +
  ylab("Principal Component 2") +
  labs(color = "Wine Quality")+
  labs(title = "PCA Analysis") +
  scale_color_gradientn(colours = rainbow(5))

loadings_summary2 = pc2$rotation %>%
  as.data.frame()%>%
  rownames_to_column('features')%>%
  kbl() %>%
  kable_material_dark()
loadings_summary2

summary(pc2)

#
pc4 = prcomp(X, scale=TRUE, rank=4)
scores4 = pc4$x

qplot(scores4[,1], scores4[,2], color=wine$quality)+
  xlab("Principal Component 1") +
  ylab("Principal Component 2") +
  labs(color = "Wine Quality")+
  labs(title = "PCA Analysis") +
  scale_color_gradientn(colours = rainbow(5))

qplot(scores4[,2], scores4[,3], color=wine$quality)+
  xlab("Principal Component 2") +
  ylab("Principal Component 3") +
  labs(color = "Wine Quality")+
  labs(title = "PCA Analysis") +
  scale_color_gradientn(colours = rainbow(5))

qplot(scores4[,3], scores4[,4], color=wine$quality)+
  xlab("Principal Component 3") +
  ylab("Principal Component 4") +
  labs(color = "Wine Quality")+
  labs(title = "PCA Analysis") +
  scale_color_gradientn(colours = rainbow(5))

qplot(scores4[,1], scores4[,4], color=wine$quality)+
  xlab("Principal Component 1") +
  ylab("Principal Component 4") +
  labs(color = "Wine Quality")+
  labs(title = "PCA Analysis") +
  scale_color_gradientn(colours = rainbow(5))

loadings_summary4 = pc4$rotation %>%
  as.data.frame()%>%
  rownames_to_column('features')%>%
  kbl() %>%
  kable_material_dark()
loadings_summary4

summary(pc4)




