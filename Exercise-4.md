##Clustering and PCA

![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-1.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-2.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-3.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-4.png)
<table class=" lightable-material-dark" style="font-family: &quot;Source Sans Pro&quot;, helvetica, sans-serif; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
Kmeans
</th>
<th style="text-align:right;">
Kmeans++
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
within cluster error for wine
</td>
<td style="text-align:right;">
56135.28
</td>
<td style="text-align:right;">
56135.28
</td>
</tr>
<tr>
<td style="text-align:left;">
between cluster error for wine
</td>
<td style="text-align:right;">
15320.72
</td>
<td style="text-align:right;">
15320.72
</td>
</tr>
<tr>
<td style="text-align:left;">
within cluster error for quality
</td>
<td style="text-align:right;">
30667.58
</td>
<td style="text-align:right;">
30553.13
</td>
</tr>
<tr>
<td style="text-align:left;">
between cluster error for quality
</td>
<td style="text-align:right;">
40788.42
</td>
<td style="text-align:right;">
40902.87
</td>
</tr>
</tbody>
</table>

![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-5.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-6.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-7.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-8.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-9.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-10.png)![](Exercise-4_files/figure-markdown_github/unnamed-chunk-1-11.png)

    ##                            PC1       PC2
    ## fixed.acidity       -0.2387989 0.3363545
    ## volatile.acidity    -0.3807575 0.1175497
    ## citric.acid          0.1523884 0.1832994
    ## residual.sugar       0.3459199 0.3299142
    ## chlorides           -0.2901126 0.3152580
    ## free.sulfur.dioxide  0.4309140 0.0719326

    ## Importance of first k=2 (out of 11) components:
    ##                           PC1    PC2
    ## Standard deviation     1.7407 1.5792
    ## Proportion of Variance 0.2754 0.2267
    ## Cumulative Proportion  0.2754 0.5021
