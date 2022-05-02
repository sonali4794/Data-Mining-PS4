#read and remove NAs and scale and center and convert to frequencies from count data 
social_marketing = read_csv(here("Data-Mining-PS4/Market Segmentation/social_marketing.csv"))
social_marketing = na.omit(social_marketing)
X = social_marketing[, -(1)]
X = X/rowSums(X)
X = scale(X, center=TRUE, scale=TRUE)

corr = round(cor(X),1)
ggcorrplot(corr, hc.order = TRUE, outline.color = "white")

k_grid = seq(2,30,by=1)
SSE_grid = foreach(k = k_grid, .combine = 'c') %do% {
  cluster_k = kmeans(X, k, nstart = 30)
  cluster_k$tot.withinss
}

plot(k_grid, SSE_grid, main = "Elbow Plot")

kmeanspp_cluster = kmeanspp(X, 10, nstart=35)

ggplot(social_marketing) + 
  geom_point(aes(shopping, beauty, color=factor(kmeanspp_cluster$cluster)))+
  xlab("Color of the wine in original data") +
  ylab("Density") +
  labs(color = "Kmeans++ clustering")

pc1 = prcomp(X, scale=TRUE, rank=5)
loadings_summary = pc1$rotation %>%
  as.data.frame()%>%
  rownames_to_column('market_segments')

ggplot(loadings_summary) +
  geom_col(aes(x=reorder(market_segments, PC1),y=PC1))+
  coord_flip()

ggplot(loadings_summary) +
  geom_col(aes(x=reorder(market_segments, PC2),y=PC2))+
  coord_flip()

ggplot(loadings_summary) +
  geom_col(aes(x=reorder(market_segments, PC3),y=PC3))+
  coord_flip()

ggplot(loadings_summary) +
  geom_col(aes(x=reorder(market_segments, PC4),y=PC4))+
  coord_flip()

ggplot(loadings_summary) +
  geom_col(aes(x=reorder(market_segments, PC5),y=PC5))+
  coord_flip()

df1 = pc1$rotation

df1 = df1 %>%
  kbl() %>%
  kable_material_dark()
df1

summary(pc1)


