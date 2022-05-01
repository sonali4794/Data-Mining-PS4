social_marketing = read_csv(here("Data-Mining-PS4/Market Segmentation/social_marketing.csv"))
social_marketing = na.omit(social_marketing)

X = social_marketing[, -(1)]
X = scale(X, center=TRUE, scale=TRUE)

pc1 = prcomp(X, scale=TRUE, rank=5)
loadings = pc1$rotation
scores = pc1$x

head(pc1)
summary(pc1)

loadings = pc1$rotation %>%
  as.data.frame 

corr = round(cor(X),1)
ggcorrplot(corr, hc.order = TRUE, type = "lower", lab = TRUE)

