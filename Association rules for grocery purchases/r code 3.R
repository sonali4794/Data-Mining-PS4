# grocery_txt = read.delim(here("Data-Mining-PS4/Association rules for grocery purchases/groceries.txt"), header = FALSE, sep = ",", na.strings=c("","NA"))
# tail(grocery_txt)
# grocery_raw = grocery_txt %>%
#   mutate(cust_id = seq(1, 15296, by=1)) 
# 
# colnames(grocery_raw) = c("Entry1","Entry2","Entry3","Entry4","CustID")
# 
# view(grocery_raw)
# grocery_long = gather(grocery_raw, field_type, items, Entry1:Entry4) 
# grocery_long = grocery_long[order(grocery_long$CustID),]
# grocery_long$CustID = factor(grocery_long$CustID)
# grocery_long = na.omit(grocery_long)
# tail(grocery_long)
# grocery = split(x=grocery_long$items, f=grocery_long$CustID)
# grocery = lapply(grocery, unique)
# 
# grocery_trans = as(grocery, "transactions")
# summary(grocery_trans)
# 
# tr = read.transactions('C:/Users/hp/Documents/Data-Mining-PS4/Association rules for grocery purchases/groceries.txt', format = 'basket', sep=',')
# rulestr = apriori(tr, 
#                   parameter=list(support=.005, confidence=.005, maxlen=2))
# inspect(rulestr)
# 
# groceryrules = apriori(grocery_trans, 
#                      parameter=list(support=.005, confidence=.005, maxlen=2))

grocery_txt = read.delim(here("Data-Mining-PS4/Association rules for grocery purchases/groceries.txt"))
write.csv(gro, "C:/Users/hp/Documents/Data-Mining-PS4/Association rules for grocery purchases/groceries.csv", quote = FALSE, row.names = FALSE)
grocery_trans = read.transactions("C:/Users/hp/Documents/Data-Mining-PS4/Association rules for grocery purchases/groceries.csv", format = 'basket', sep=',')

itemFrequencyPlot(grocery_trans,topN=20,type="absolute",col=brewer.pal(8,'Pastel2'), main="Absolute Item Frequency Plot")

groccery_rules = apriori(grocery_trans, parameter = list(supp=0.001, conf=0.1,maxlen=4,minlen=2))
inspect(groccery_rules[1:50])

plot(groccery_rules)
plot(groccery_rules, measure = c("support", "lift"), shading = "confidence")
plot(groccery_rules, method='two-key plot')

sub1 = subset(groccery_rules, subset=confidence > 0.01 & support > 0.01)
saveAsGraph(sub1, file = "groceryrules.graphml")

plot(head(sub1, 100, by='lift'), method='graph')

knitr::include_graphics("C:/Users/hp/Documents/Data-Mining-PS4/groceryrules1.graphml.gephi")






