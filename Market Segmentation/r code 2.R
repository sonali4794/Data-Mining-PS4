#read and remove NAs and scale and center and convert to frequencies from count data 
social_marketing = read_csv(here("Data-Mining-PS4/Market Segmentation/social_marketing.csv"))
social_marketing = na.omit(social_marketing)
L = social_marketing[, -(1)]
L = scale(L, center=TRUE, scale=TRUE)

corr = round(cor(L),1)
ggcorrplot(corr, hc.order = TRUE, outline.color = "white")

k_grid = seq(2,30,by=1)
SSE_grid = foreach(k = k_grid, .combine = 'c') %do% {
  cluster_k = kmeans(L, k, nstart = 30)
  cluster_k$tot.withinss
}

plot(k_grid, SSE_grid, main = "Elbow Plot")

kmeanspp_cluster = kmeanspp(L, 15, nstart=35)

ggplot(social_marketing) + 
  geom_point(aes(shopping, beauty, color=factor(kmeanspp_cluster$cluster)))+
  xlab("Beauty") +
  ylab("Shopping") +
  labs(color = "Kmeans++ clustering")

pc1 = prcomp(L, scale=TRUE, rank=15)
loadings_summary = pc1$rotation %>%
  as.data.frame()%>%
  rownames_to_column('market_segments')

p1 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC1),y=PC1))+xlab("PC1")+ylab("Market Segments")+coord_flip()
p2 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC2),y=PC2))+xlab("PC2")+ylab("Market Segments")+coord_flip()
p3 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC3),y=PC3))+xlab("PC3")+ylab("Market Segments")+coord_flip()
p4 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC4),y=PC4))+xlab("PC4")+ylab("Market Segments")+coord_flip()
p5 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC5),y=PC5))+xlab("PC5")+ylab("Market Segments")+coord_flip()
p6 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC6),y=PC6))+xlab("PC6")+ylab("Market Segments")+coord_flip()
p7 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC7),y=PC7))+xlab("PC7")+ylab("Market Segments")+coord_flip()
p8 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC8),y=PC8))+xlab("PC8")+ylab("Market Segments")+coord_flip()
p9 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC9),y=PC9))+xlab("PC9")+ylab("Market Segments")+coord_flip()
p10 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC10),y=PC10))+xlab("PC10")+ylab("Market Segments")+coord_flip()
p11 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC11),y=PC11))+xlab("PC11")+ylab("Market Segments")+coord_flip()
p12 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC12),y=PC12))+xlab("PC12")+ylab("Market Segments")+coord_flip()
p13 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC13),y=PC13))+xlab("PC13")+ylab("Market Segments")+coord_flip()
p14 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC14),y=PC14))+xlab("PC14")+ylab("Market Segments")+coord_flip()
p15 = ggplot(loadings_summary) +geom_col(aes(x=reorder(market_segments, PC15),y=PC15))+xlab("PC15")+ylab("Market Segments")+coord_flip()

grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15) 

  
df1 = pc1$rotation

df1 = df1 %>%
  kbl() %>%
  kable_material_dark()
df1

summary(pc1)


