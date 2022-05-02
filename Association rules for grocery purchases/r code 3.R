grocery_txt = read.delim(here("Data-Mining-PS4/Association rules for grocery purchases/groceries.txt"))
write.csv(grocery_txt, "C:/Users/hp/Documents/Data-Mining-PS4/Association rules for grocery purchases/groceries.csv", quote = FALSE, row.names = FALSE)
grocery_trans = read.transactions("C:/Users/hp/Documents/Data-Mining-PS4/Association rules for grocery purchases/groceries.csv", format = 'basket', sep=',')

itemFrequencyPlot(grocery_trans,topN=20,type="absolute",col=brewer.pal(8,'Pastel2'), main="Absolute Item Frequency Plot")

groccery_rules = apriori(grocery_trans, parameter = list(supp=0.001, conf=0.1,maxlen=4,minlen=2))

plot(groccery_rules)
plot(groccery_rules, measure = c("support", "lift"), shading = "confidence")
plot(groccery_rules, method='two-key plot')

df2 = arules::DATAFRAME(groccery_rules)
df3 = df2 %>%
  as.data.frame() %>%
  arrange(desc(lift)) 
df4 = head(df3, 20) %>%
  kbl()%>%
  kable_material_dark()
df4

sub1 = subset(groccery_rules, subset=confidence > 0.01 & support > 0.01)
saveAsGraph(sub1, file = "groceryrules.graphml")

knitr::include_graphics("C:/Users/hp/Documents/Data-Mining-PS4/screenshot1.png")
knitr::include_graphics("C:/Users/hp/Documents/Data-Mining-PS4/screenshot2.png")






