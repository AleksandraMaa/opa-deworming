---
title: "Notes on Givewell's Cost Effectiveness Analysis on Deworming "
date: "29 May, 2019"
output:
  html_document:
    code_folding: hide
    code_download: true
    collapsed: yes
    keep_md: yes
    number_sections: yes
    smooth_scroll: no
    toc: yes
    toc_depth: 2
    toc_float: yes
  pdf_document: default
  word_document: default
editor_options:
  chunk_output_type: console
---
\def\blue{\color{blue}}








```r
# Do not run data set on git/github until privacy has been cleared
################
##### Data  
################
################
##### Research
################
################
##### Guess work   
################
################
#####  Notes:
################
### Source ---->  Input ----> Model ----> Policy Estimates (output)
###  (_so)        (_in)       (_mo)        (_pe)
### values      functions   functions      values
###             & values    & values
### arguments in functions should used "_var" and functions should "_f"
#invisible( list2env(call_params_f(),.GlobalEnv) )
```


# Key policy estimates for policy makers  



# Methodology

## Main Equation (the model)
$$
\begin{equation}
CEA = \frac{B (1 + F_{0})}{C}
\label{eq:1}
\tag{1}
\end{equation}
$$
 - $C$ is the costs per person dewormed.   
 - $B$ is the benefits per person dewormed. 
 - $F_{0}$ is a factor to account for leverage/fudging [not reviewed in this excercise]


## Sub components:

We begin by describing the underlying analysis behind the costs. Through this excercise we use the following notation the letters $F, P, Q$ denote components
in percentages, monetary units (US dollars and local currency) and quantities respectively. Each new element will be tracked using a sub-index, and supra-indecis will be
used to track groups, like geographies, time, and other catergories. For example $Q^{i}_{2}$ represents the second quantity described in this analysis (total adjusted number childred dewormed per year) in location $i$. At the end of each description we will show in parenthesis the original location of the parameter in GiveWell's spreadsheets (using the notation `file, sheet number, cell`[^1]).

### Costs ("$C$")


```r
# - inputs: tax_rev_init_mo, top_tax_base_in
# - outputs: total_rev_pe
```
$$
\begin{equation}
C = \sum_{i \in G_{1} (countries) } F^{i}_{1} P^{i}_{1}
\label{eq:2}
\tag{2}
\end{equation}
$$
- $F^{i}_{1}$: Weight for the weighted average (`F1, 2, H16`).  
- $P^{i}_{1}$: Total cost per child, per year in region $i$ (`F1, 2, C:G16`).  

$$
\begin{equation}
F^{i}_{1} = \frac{F^{i}_{2} Q^{i}_{1}}{\sum_{j \in G_{1}} F^{j}_{2} Q^{j}_{1}}
\label{eq:3}
\tag{3}
\end{equation}
$$
- $F^{i}_{2}$: is the proportion of the costs that are paid by the Deworm the World initiative (DtW from now on) (`F1, 2, C:G6`).  
- $Q^{i}_{1}$: estimated number of treatments delivered and commited (`F1, 2, C:G7`).  
$$
\begin{equation}
P^{i}_{1} = \left(P^{i}_{3} + P^{i}_{4} + P^{i}_{5} + P^{i}_{6} + P^{i}_{7}  \right)\frac{1}{Q^{i}_{2}}
\label{eq:4}
\tag{4}
\end{equation}
$$
- $P^{i}_{3}$: Total cost of DtW across all years (`F1, 1, Z39`).  
- $P^{i}_{4}$: Cost of donated drugs per year (`F1, 1, Z13`).  
- $P^{i}_{5}$: Additional partner costs (other than drugs) (`F1, 1, Z50`).  
- $P^{i}_{6}$: Goverment financial costs per year (`F1, 1, X41`).  
- $P^{i}_{7}$: Goverment staff value time (`F1, 2, N42`).  

- $Q^{i}_{2}$: total adjusted children dewormed per year (`F1, 1, Z15`).  

$P^{i}_{2}$ and $F^{i}_{2}$ are defined in terms of some of the previous elements. 
$$
\begin{equation}
F^{i}_{2} = \frac{P^{i}_{2}}{P^{i}_{1}}\\
P^{i}_{2} = \frac{P^{i}_{3}}{Q^{i}_{2}}
\label{eq:5}
\tag{5}
\end{equation}
$$
- $P^{i}_{2}$: DtW costs per children per year (`F1, 2, C:G14`).  

The total costs of DtW across all years ($P^{i}_{3}$) is aggregated across years, regions (within country), type of cost activity (policy & advocacy, prevalence surveys, drug procurement & management, training & distribution, public mobilization & community sensitization, monitoring & evaluation, program management, giveWell added costs[^2]) and month (February or August)
$$
\begin{equation}
P^{i}_{3} = \sum_{t \in years (G_{2})} 
\sum_{r \in region (G_{3})} 
\sum_{a \in activ (G_{4})} 
\sum_{m \in month (G_{5})} P^{itram}_{3}
\label{eq:6}
\tag{6}
\end{equation}
$$

- $P^{itram}_{3}$: costs by year, location, region, activity, and month. (`F1, [r+m+y], E15:21`)

Total number of adjusted children ($Q^{i}_{2}$) is computed as follows: 
$$
\begin{equation}
Q^{i}_{2} = \sum_{t \in G_{2}} 
\sum_{r \in G_{3}} 
 Q^{itr}_{2} \\
 Q^{itr}_{2} = \frac{\widetilde{Q}^{itr, Feb}_{2} - \widetilde{Q}^{itr, Aug}_{2}}{Q^{itr}_{3}}\\
 \widetilde{Q}^{itr, m}_{2} = \sum_{s \in sch.age (G_{6})} \left( 
\sum_{e \in enr.st(G_{7})} \widetilde{Q}^{itrmse}_{2}\right) Q_{4}^{itrm}
\label{eq:7}
\tag{7}
\end{equation}
$$


- $Q^{itr}_{2}$, and $Q^{itrm}_{2}$ (`F1, 4, B19` and `F1, [country] num of children (C), AB:AC34`)
- $Q^{itr}_{3}$: Actual treatment rounds per year (`F1, 4, D[crt]`)
- $Q^{itrm}_{4}$: Adjustment factor (`F1, C, [rmt]25`)

$$
\begin{equation}
Q^{itrm}_{4} = 1 - \left( \frac{Q^{itrms,en}_{2}}{Q^{itrms,en}_{5}} - F^{itrm}_{3} F^{itrm}_{4} F^{itrm}_{5} \right)  / \left( \frac{Q^{itrms,en}_{2}}{Q^{itrms,en}_{5}} \right) 
\label{eq:8}
\tag{8}
\end{equation}
$$

- $Q^{itrms, en}_{5}$: Total enrolled school-aged children targeted (`F1, C, [rtm]13`)
- $F^{itrm}_{3}$: Percentage of schools visited during coverage validation (and/or during process monitoring) that distributed deworming tablets on deworming day and/or mop-up day (`F1, C, [rtm]22 `).   
- $F^{itrm}_{4}$: Percentage of enrolled school-aged children attending school on deworming day or mop-up day, according to attendance registers viewed in schools visited during coverage validation (and/or during process monitoring) (`F1, C, [rtm]23 `).   
- $F^{itrm}_{5}$: Of children enrolled in a school that distributed deworming tablets on deworming day and/or mop-up day and who attended school on deworming day and/or mop-up day, percentage who reported consuming deworming tablets (according to student interviews during coverage validation and/or process monitoring) (`F1, C, [rtm]24 `).  

$$
\begin{equation}
P^{i}_{4} = \sum_{t} 
\sum_{r} 
\sum_{m} P^{itrm}_{4}
\label{eq:9}
\tag{9}
\end{equation}
$$

- $P^{itrm}_{4}$: Cost of donated drugs in country, location, year, month (`F1, [crtm], E18`).  



\begin{equation}
P^{i}_{5} = \sum_{t} 
\sum_{r} 
\sum_{m} \widetilde{P}^{itrm}_{5}  - P^{i}_{4} \\ 

\widetilde{P}^{itr}_{5} = \sum_{m} 
\widetilde{P}^{itrm}_{5} 

\label{eq:10}
\tag{10}
\end{equation}

 
 
- $P^{itrm}_{4}$: Cost of donated drugs in country, location, year, month (`F1, [crtm], E18`).  
- $\widetilde{P}^{itrm}_{5}$: Total partner costs (incl. drugs) (`F1, [crtm], E23`).




\begin{equation}
P^{i}_{5} = \sum_{t} 
\sum_{r} \widetilde{P}^{itr}_{6}  \\ 

\widetilde{P}^{itr}_{6} = P^{itr}_{8} - ( \widetilde{P}^{itr}_{5} + P^{itr}_{3})

\label{eq:11}
\tag{11}
\end{equation}

 
 
- $P^{itrm}_{4}$: Cost of donated drugs in country, location, year, month (`F1, [crtm], E18`).  
- $\widetilde{P}^{itrm}_{5}$: Total partner costs (incl. drugs) (`F1, [crtm], E23`).


### Benefits ("$B$")




```r
# - inputs: tax_rev_init_mo, top_tax_base_in
# - outputs: total_rev_pe
```


# Main results

```r
# - inputs: tax_rev_init_mo, top_tax_base_in
# - outputs: total_rev_pe
```


# Montecarlo simulations  

```r
# Draws
# Compute inputs
# Compute model
# Run sims
```

# Sensitivity Analysis  


[^1]: `F1 = GiveWell's estimates of Deworm the World's cost per child dewormed per year [2018]`  
`F2 = 2019 GiveWell Cost-effectiveness Analysis — Version 3`  
`F3 = 2018 Worm Intensity Workbook — Version 1` Sheets are named the first time and numbered thereafter. 


[^2]: to account for several high-level activities Deworm the World does not include in its cost per treatment analyses, as they are not directly related to any particular program