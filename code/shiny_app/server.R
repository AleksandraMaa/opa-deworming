
library(shiny)

shinyServer( function(input, output, session) {
  #Dynamic UI
  
  reactive.data1 <- reactive( {
    sim.data1(
      nsims = as.numeric(input$param1),                                                    
      gov_bonds_var2     = as.numeric(input$param2),                                           
      gov_bonds_var2_sd  = as.numeric(input$param2_1),                                      
      inflation_var2     = as.numeric(input$param3),                                           
      inflation_var2_sd  = as.numeric(input$param3_1),    
      gov_bonds_new_var2    = as.numeric(input$param2_new),       
      gov_bonds_new_var2_sd = as.numeric(input$param2_1_new),                                                            
      inflation_new_var2    = as.numeric(input$param3_new),                                
      inflation_new_var2_sd = as.numeric(input$param3_1_new), 
      wage_ag_var2 = as.numeric(input$param4),                                             
      wage_ag_var2_sd = as.numeric(input$param4_1),                                        
      wage_ww_var2 = as.numeric(input$param5),                                             
      wage_ww_var2_sd = as.numeric(input$param5_1),                                        
      profits_se_var2 = as.numeric(input$param6),                                          
      profits_se_var2_sd = as.numeric(input$param6_1),                                     
      hours_se_cond_var2 = as.numeric(input$param7),                                       
      hours_se_cond_var2_sd = as.numeric(input$param7_1),                                  
      hours_ag_var2 = as.numeric(input$param8),                                            
      hours_ag_var2_sd = as.numeric(input$param8_1),                                       
      hours_ww_var2 = as.numeric(input$param9),                                            
      hours_ww_var2_sd = as.numeric(input$param9_1),                                       
      hours_se_var2 = as.numeric(input$param10),                                           
      hours_se_var2_sd = as.numeric(input$param10_1),                                      
      ex_rate_var2 = as.numeric(input$param11),                                            
      ex_rate_var2_sd = as.numeric(input$param11_1),                                       
      growth_rate_var2 = as.numeric(input$param12),                                        
      growth_rate_var2_sd = as.numeric(input$param12_1),  
      coverage_var2 = as.numeric(input$param13), 
      coverage_var2_sd = as.numeric(input$param13_1),
      tax_var2 = as.numeric(input$param15),                                                 
      tax_var2_sd = as.numeric(input$param15_1),                                            
      unit_cost_local_var2 = as.numeric(input$param16),                                           
      unit_cost_local_var2_sd = as.numeric(input$param16_1), 
      unit_cost_local_new_var2 = as.numeric(input$param16_new),                                           
      unit_cost_local_new_var2_sd = as.numeric(input$param16_1_new), 
      years_of_treat_var2 = as.numeric(input$param17),                                          
      years_of_treat_var2_sd = as.numeric(input$param17_1),                                          
      lambda1_var2 = c(as.numeric(input$param18_1), as.numeric(input$param18_2)),                                          
      lambda1_var2_sd = c(as.numeric(input$param18_1_1), as.numeric(input$param18_2_1)),                                     
      lambda2_var2 = as.numeric(input$param19),                                             
      lambda2_var2_sd = as.numeric(input$param19_1),                                        
      q_full_var2 = as.numeric(input$param20),                                              
      q_full_var2_sd = as.numeric(input$param20_1),                                           
      coef_exp_var2 = c(as.numeric(input$param21_1), as.numeric(input$param21_2)),                      
      teach_sal_var2    = as.numeric(input$param22),                                             
      teach_sal_var2_sd = as.numeric(input$param22_1),                                        
      teach_ben_var2    = as.numeric(input$param23),                                             
      teach_ben_var2_sd = as.numeric(input$param23_1),  
      teach_sal_new_var2     = as.numeric(input$param22),         # TEMP
      teach_sal_new_var2_sd  = as.numeric(input$param22_1),      
      teach_ben_new_var2     = as.numeric(input$param23),     
      teach_ben_new_var2_sd  = as.numeric(input$param23_1),      
      n_students_var2 = as.numeric(input$param24),                                            
      n_students_var2_sd = as.numeric(input$param24_1),                                       
      delta_ed_var2 = as.numeric(input$param26),                                              
      delta_ed_var2_sd = as.numeric(input$param26_1),                                             
      delta_ed_ext_var2 = as.numeric(input$param27),                                              
      delta_ed_ext_var2_sd = as.numeric(input$param27_1),                                               
      q_zero_var2 = as.numeric(input$param28),                                                
      q_zero_var2_sd = as.numeric(input$param28_1), 
      lambda1_new_var2 = c(as.numeric(input$param29_1), as.numeric(input$param29_2), 
                           as.numeric(input$param29_3)),                   
      lambda1_new_var2_sd = c(as.numeric(input$param29_1_1), as.numeric(input$param29_2_1), 
                              as.numeric(input$param29_3_1)),             
      prevalence_0_var2 = as.numeric(input$param30),    
      prevalence_0_var2_sd = as.numeric(input$param30_1), 
      prevalence_r_var2 = as.numeric(input$param31),    
      prevalence_r_var2_sd = as.numeric(input$param31_1),                                                                         
      new_prev_r_var2 = as.numeric(input$param37), #HERE IS PREV
      counts_par_var2 = as.numeric(input$param32), 
      counts_par_var2_sd = as.numeric(input$param32_1),
      staff_time_var2 = as.numeric(input$param33), 
      staff_time_var2_sd = as.numeric(input$param33_1), 
      costs_par_var2 = as.numeric(input$param34), 
      costs_par_var2_sd = as.numeric(input$param34_1), 
      new_costs_var2 = as.numeric(input$param35),
      countries_var2 = list("india", "kenya", "nigeria", "vietnam"), # = input$param36  to make it interactive
    )
  } 
  )
  
  
  
  
  
  # Show/hide components of each model 
  observeEvent(input$policy_est,{ 
    # all params
    list_master <- c(
      "param2",                                             #Data
      "param2_1",
      "param2_new",
      "param2_1_new",
      "param3",
      "param3_1",
      "param3_new",
      "param3_1_new",
      "param4",
      "param4_1",
      "param5",
      "param5_1",
      "param6",
      "param6_1",
      "param7",
      "param7_1",
      "param8",
      "param8_1",
      "param9",
      "param9_1",
      "param10",
      "param10_1",
      "param11",
      "param11_1",
      "param12",
      "param12_1",
      "param13",
      "param13_1",
      "param15",
      "param15_1",
      "param16",
      "param16_1",
      "param16_new",
      "param16_1_new",
      "param17",
      "param17_1",
      "param18_1",                                          #Research
      "param18_1_1",
      "param18_2",
      "param18_2_1",
      "param20",
      "param20_1",
      "param28",
      "param28_1",
      "param26",
      "param26_1",
      "param30",
      "param30_1",
      "param21_1",                                          #Guesswork
      "param21_2",
      "param22",
      "param22_1",
      "param23",
      "param23_1",
      "param24",
      "param24_1",
      "param31",
      "param31_1",
      "param32",
      "param32_1",
      "param34",
      "param34_1",
      "param19",
      "param19_1",
      "param27",
      "param27_1",
      "param29_1",
      "param29_1_1",
      "param29_2",
      "param29_2_1",
      "param29_3",
      "param29_3_1",
      "param33",
      "param33_1"
    )
    if (input$policy_est == "A1. Tax revenue") {
      # remove: counts adj, costs adj, lambda 2, delda ed w/ext, new lambdas, 
      # costs due to staff, 
      # new gov bonds, new inflation, new cost of teaching, 
      list_hide <- c("param32",
                     "param32_1",
                     "param34",
                     "param34_1", 
                     "param19",
                     "param19_1",
                     "param27",
                     "param27_1",
                     "param29_1",
                     "param29_1_1",
                     "param29_2",
                     "param29_2_1",
                     "param29_3",
                     "param29_3_1", 
                     "param33",
                     "param33_1", 
                     "param2_new",
                     "param2_1_new",
                     "param3_new",
                     "param3_1_new",
                     "param16_new",
                     "param6_1_new")
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
    } else if (input$policy_est == "A1. With externalities. Tax") {
      list_hide <- c("param32",
                     "param32_1",
                     "param34",
                     "param34_1", 
                     "param29_1",
                     "param29_1_1",
                     "param29_2",
                     "param29_2_1",
                     "param29_3",
                     "param29_3_1", 
                     "param33",
                     "param33_1", 
                     "param2_new",
                     "param2_1_new",
                     "param3_new",
                     "param3_1_new",
                     "param16_new",
                     "param6_1_new")
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
    } else if (input$policy_est == "A1. All income") {
      list_hide <- c("param32",
                     "param32_1",
                     "param34",
                     "param34_1", 
                     "param19",
                     "param19_1",
                     "param27",
                     "param27_1",
                     "param29_1",
                     "param29_1_1",
                     "param29_2",
                     "param29_2_1",
                     "param29_3",
                     "param29_3_1", 
                     "param33",
                     "param33_1", 
                     "param15", 
                     "param15_1", 
                     "param2_new",
                     "param2_1_new",
                     "param3_new",
                     "param3_1_new",
                     "param16_new",
                     "param6_1_new")
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
    } else if (input$policy_est == "A1. With ext. All income") {
      list_hide <- c("param32",
                     "param32_1",
                     "param34",
                     "param34_1", 
                     "param29_1",
                     "param29_1_1",
                     "param29_2",
                     "param29_2_1",
                     "param29_3",
                     "param29_3_1", 
                     "param33",
                     "param33_1", 
                     "param2_new",
                     "param2_1_new",
                     "param3_new",
                     "param3_1_new",
                     "param16_new",
                     "param6_1_new")
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
      
    } else if (input$policy_est == "A2. Tax") {
      list_hide <- c("param32",
                     "param32_1",
                     "param34",
                     "param34_1", 
                     "param19",
                     "param19_1",
                     "param27",
                     "param27_1",     
                     "param4",
                     "param4_1",
                     "param5",
                     "param5_1",
                     "param6",
                     "param6_1",
                     "param7",
                     "param7_1",
                     "param8",
                     "param8_1",
                     "param9",
                     "param9_1",
                     "param10",
                     "param10_1",
                     "param12",
                     "param12_1",
                     "param13",
                     "param13_1", 
                     "param18_1",                                         
                     "param18_1_1",
                     "param18_2",
                     "param18_2_1",
                     "param33",
                     "param33_1" , 
                     "param2",
                     "param2_1",
                     "param3",
                     "param3_1",
                     "param16",
                     "param6_1"
      )
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
    } else if (input$policy_est == "A2. All income") {
      list_hide <- c("param32",
                     "param32_1",
                     "param34",
                     "param34_1", 
                     "param19",
                     "param19_1",
                     "param27",
                     "param27_1",     
                     "param4",
                     "param4_1",
                     "param5",
                     "param5_1",
                     "param6",
                     "param6_1",
                     "param7",
                     "param7_1",
                     "param8",
                     "param8_1",
                     "param9",
                     "param9_1",
                     "param10",
                     "param10_1",
                     "param12",
                     "param12_1",
                     "param13",
                     "param13_1", 
                     "param18_1",                                         
                     "param18_1_1",
                     "param18_2",
                     "param18_2_1",
                     "param33",
                     "param33_1", 
                     "param15", 
                     "param15_1", 
                     "param2",
                     "param2_1",
                     "param3",
                     "param3_1",
                     "param16",
                     "param16_1")
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
    } else if (input$policy_est == "A3. All income of A1") {
      list_hide <- c("param19",
                     "param19_1",
                     "param22",
                     "param22_1",
                     "param23",
                     "param23_1",
                     "param24",
                     "param24_1",
                     "param26",
                     "param26_1",
                     "param27",
                     "param27_1",
                     "param29_1",
                     "param29_1_1",
                     "param29_2",
                     "param29_2_1",
                     "param29_3",
                     "param29_3_1",  
                     "param16", 
                     "param16_1", 
                     "param2_new",
                     "param2_1_new",
                     "param3_new",
                     "param3_1_new")
      list_show <- list_master[ - which(list_master %in% list_hide)]
    } else if (input$policy_est == "A3. All income of A1, with ext.") {
      list_hide <- c("param22",
                     "param22_1",
                     "param23",
                     "param23_1",
                     "param24",
                     "param24_1",
                     "param26",
                     "param26_1",
                     "param27",
                     "param27_1",
                     "param29_1",
                     "param29_1_1",
                     "param29_2",
                     "param29_2_1",
                     "param29_3",
                     "param29_3_1",  
                     "param16", 
                     "param16_1", 
                     "param2_new",
                     "param2_1_new",
                     "param3_new",
                     "param3_1_new")
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
    } else if (input$policy_est == "A3. All income of A2. Main Policy Estimate") {
      list_hide <- c("param19",
                     "param19_1",
                     "param21_1",
                     "param21_2",
                     "param22",
                     "param22_1",
                     "param23",
                     "param23_1",
                     "param24",
                     "param24_1",
                     "param26",
                     "param26_1",
                     "param27",
                     "param27_1",
                     "param16", 
                     "param16_1",
                     "param4",
                     "param4_1",
                     "param5",
                     "param5_1",
                     "param6",
                     "param6_1",
                     "param7",
                     "param7_1",
                     "param8",
                     "param8_1",
                     "param9",
                     "param9_1",
                     "param10",
                     "param10_1",
                     "param12",
                     "param12_1",
                     "param13",
                     "param13_1", 
                     "param18_1",                                         
                     "param18_1_1",
                     "param18_2",
                     "param18_2_1",
                     "param33",
                     "param33_1", 
                     "param15", 
                     "param15_1", 
                     "param2",
                     "param2_1",
                     "param3",
                     "param3_1")
      
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
    } else if (input$policy_est == "Main Policy Estimate. CEA format") {
      list_hide <- c("param19",
                     "param19_1",
                     "param21_1",
                     "param21_2",
                     "param22",
                     "param22_1",
                     "param23",
                     "param23_1",
                     "param24",
                     "param24_1",
                     "param26",
                     "param26_1",
                     "param27",
                     "param27_1",
                     "param29_1",
                     "param29_1_1",
                     "param29_2",
                     "param29_2_1",
                     "param29_3",
                     "param29_3_1",  
                     "param16", 
                     "param16_1",
                     "param4",
                     "param4_1",
                     "param5",
                     "param5_1",
                     "param6",
                     "param6_1",
                     "param7",
                     "param7_1",
                     "param8",
                     "param8_1",
                     "param9",
                     "param9_1",
                     "param10",
                     "param10_1",
                     "param12",
                     "param12_1",
                     "param13",
                     "param13_1", 
                     "param18_1",                                         
                     "param18_1_1",
                     "param18_2",
                     "param18_2_1",
                     "param33",
                     "param33_1", 
                     "param15", 
                     "param15_1")
      list_show <- list_master[ - which(list_master %in% list_hide)]
      
    } else if (input$policy_est == "Main Policy Estimate. RCEA format") {
      list_hide <- c("param19",
                     "param19_1",
                     "param21",
                     "param21_1",
                     "param22_1",
                     "param22_2",
                     "param23",
                     "param23_1",
                     "param24",
                     "param24_1",
                     "param26",
                     "param26_1",
                     "param27",
                     "param27_1",
                     "param29_1",
                     "param29_1_1",
                     "param29_2",
                     "param29_2_1",
                     "param29_3",
                     "param29_3_1",  
                     "param16", 
                     "param16_1",
                     "param4",
                     "param4_1",
                     "param5",
                     "param5_1",
                     "param6",
                     "param6_1",
                     "param7",
                     "param7_1",
                     "param8",
                     "param8_1",
                     "param9",
                     "param9_1",
                     "param10",
                     "param10_1",
                     "param12",
                     "param12_1",
                     "param13",
                     "param13_1", 
                     "param18_1",                                         
                     "param18_1_1",
                     "param18_2",
                     "param18_2_1",
                     "param33",
                     "param33_1", 
                     "param15", 
                     "param15_1")
      list_show <- list_master[ - which(list_master %in% list_hide)]
    }
    sapply(list_hide, 
           function(x) hideElement(id = x) ) 
    sapply(list_show, 
           function(x) showElement(id = x) ) 
  })
  
  
  
  hideElement("show_eq")
  #observeEvent(input$run, {
  ################
  ###### Results/Viz
  ################
  output$eqns <- renderUI({
    #if (input$run == TRUE) {showElement("show_eq")}
    showElement("show_eq")
    if (input$show_eq == TRUE) {
      if (input$policy_est == "A1. Tax revenue" ) { 
        withMathJax(
          helpText('$$
              \\begin{equation}
              NPV =  \\underbrace{
              \\left[ \\tau \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\lambda_{1}) -
                      K \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta \\overline{E}_t(S1,S2) 
                      \\right]
                            }_{\\text{net labor market gains}} - 
                      \\underbrace{
                      \\big[S_{2}Q(S_{2}) - S_{1}Q(S_{1}) \\big]
                      
                      }_{\\text{cost of deworming medication}}
            \\label{eq:1}
            \\tag{1}
            \\end{equation}
            $$ \n See approach 1 in the documentation component for more details'  ) 
        )
        
      } else if (input$policy_est ==  "A1. With externalities. Tax"){
        withMathJax(
          helpText('$$
              \\begin{equation}
              NPV =  \\underbrace{
              \\left[ \\tau \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\lambda_{1}, \\lambda_{2}) -
                      K \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta \\overline{E}_t(S1,S2) 
                      \\right]
                            }_{\\text{net labor market gains}} - 
                      \\underbrace{
                      \\big[S_{2}Q(S_{2}) - S_{1}Q(S_{1}) \\big]
                      
                      }_{\\text{cost of deworming medication}}
            \\label{eq:2}
            \\tag{2}
            \\end{equation}
            $$ \n See approach 1 in the documentation component for more details'  ) 
        )
      } else if (input$policy_est == "A1. All income"){
        withMathJax(
          helpText('$$
              \\begin{equation}
              NPV =  \\underbrace{
              \\left[ \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\lambda_{1}) -
                      K \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta \\overline{E}_t(S1,S2) 
                      \\right]
                            }_{\\text{net labor market gains}} - 
                      \\underbrace{
                      \\big[S_{2}Q(S_{2}) - S_{1}Q(S_{1}) \\big]
                      
                      }_{\\text{cost of deworming medication}}
            \\label{eq:3}
            \\tag{3}
            \\end{equation}
            $$ \n See approach 1 in the documentation component for more details'  
          )
        )
      } else if (input$policy_est ==  "A1. With ext. All income"){
        withMathJax(
          helpText('$$
              \\begin{equation}
              NPV =  \\underbrace{
              \\left[ \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\lambda_{1}, \\lambda_{2}) -
                      K \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta \\overline{E}_t(S1,S2) 
                      \\right]
                            }_{\\text{net labor market gains}} - 
                      \\underbrace{
                      \\big[S_{2}Q(S_{2}) - S_{1}Q(S_{1}) \\big]
                      
                      }_{\\text{cost of deworming medication}}
            \\label{eq:4}
            \\tag{4}
            \\end{equation}
            $$ \n See approach 1 in the documentation component for more details'  )
        )
      } else if (input$policy_est == "A2. Tax"){
        withMathJax(helpText('$$
            \\begin{equation}
              NPV =  \\underbrace{
                 \\left[ \\tau \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\alpha_{1}, \\alpha_{2}, \\alpha_{3}) -
                      K \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta \\overline{E}_t(S1,S2) 
                      \\right]
                            }_{\\text{net labor market gains}} - 
                      \\underbrace{
                      \\left[\\sum_{t=0}^{1.4} \\left( \\frac{1}{1 + r}\\right)^{t} \\big[S_{2}Q(S_{2}) - S_{1}Q(S_{1}) \\big]
                      \\right]
                      }_{\\text{cost of deworming medication}}
            \\label{eq:5}
            \\tag{5}
            \\end{equation}
                                 $$ \n See approach 2 in the documentation component for more details'))
      } else if (input$policy_est == "A2. All income"){
        withMathJax(helpText('$$
            \\begin{equation}
              NPV =  \\underbrace{
                 \\left[ \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\alpha_{1}, \\alpha_{2}, \\alpha_{3}) -
                      K \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta \\overline{E}_t(S1,S2) 
                      \\right]
                            }_{\\text{net labor market gains}} - 
                      \\underbrace{
                      \\left[\\sum_{t=0}^{1.4} \\left( \\frac{1}{1 + r}\\right)^{t} \\big[S_{2}Q(S_{2}) - S_{1}Q(S_{1}) \\big]
                      \\right]
                      }_{\\text{cost of deworming medication}}
            \\label{eq:6}
            \\tag{6}
            \\end{equation}
                                 $$ \n See approach 2 in the documentation component for more details' ))
      } else if (input$policy_est == "A3. All income of A1"){
        withMathJax(helpText('$$   
            \\begin{equation}
              NPV =  \\underbrace{
              \\left[ \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\lambda_{1}) 
                     \\right]
                            }_{\\text{labor market gains}} - 
                      \\underbrace{
                      \\sum_{i \\in Countries } \\omega_{i} c_{i}(\\delta_{g})\\
                      }_{\\text{cost of deworming medication}}
            \\label{eq:7}
            \\tag{7}
            \\end{equation}
             $$ \n See approach 3 in the documentation component for more details'))
      } else if (input$policy_est == "A3. All income of A1, with ext."){
        withMathJax(helpText("$$
            \\begin{equation}
              NPV =  \\underbrace{
              \\left[ \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\lambda_{1}, \\lambda_{2}) 
                     \\right]
                            }_{\\text{labor market gains}} - 
                      \\underbrace{
                      \\sum_{i \\in Countries } \\omega_{i} c_{i}(\\delta_{g})\\
                      }_{\\text{cost of deworming medication}}
            \\label{eq:8}
            \\tag{8}
            \\end{equation}
            $$ \n See approach 3 in the documentation component for more details"))
      } else if (input$policy_est == "A3. All income of A2. Main Policy Estimate"){
        withMathJax(helpText(
          "$$
            \\begin{equation}
              NPV =  \\underbrace{
              \\left[ \\sum_{t=0}^{50} \\left( \\frac{1}{1 + r}\\right)^{t} \\Delta W_t(\\alpha_{1}, \\alpha_{2}, \\alpha_{3}) 
                     \\right]
                            }_{\\text{Benefits (B)}} - 
                      \\underbrace{
                      \\sum_{i \\in Countries } \\omega_{i} c_{i}(\\delta_{g})\\
                      }_{\\text{Costs (C)}}
            \\label{eq:9}
            \\tag{9}
            \\end{equation}
              $$ \n See approach 3 in the documentation component for more details"
        ))
      }else if (input$policy_est == "Main Policy Estimate. CEA format"){
        withMathJax(helpText("$$
                                 \\begin{equation}
                                 CEA_{deworming} = \\frac{B (1 + F_{0})}{C}
                                 \\label{eq:10}
                                 \\tag{10}
                                 \\end{equation}
                                 $$ 
                                 \n Benefits (B) and costs (C) as defined in preferred policy estimate (A3-2020)"))
      }else if (input$policy_est == "Main Policy Estimate. RCEA format"){
        withMathJax(helpText(
          "$$
                                 \\begin{equation}
                                 RCEA = \\frac{CEA_{deworming}}{CEA_{cash}}
                                 \\label{eq:11}
                                 \\tag{11}
                                 \\end{equation}
                                 $$  \n CEA as define in equation 10, CEA_{cash} from SOURCE")
        )
      }
    } 
  })
  
  output$plot1 <- renderPlot({      
    # TO DO: wrap all the following steps in a function and call them again below (instead of copying and pasting)
    
    npv_sim_all <- reactive.data1()
    
    total_time <- npv_sim_all$total_time
    position <- which( policy_estimates_text == input$policy_est)
    npv_sim <- npv_sim_all[[ policy_estimates[position] ]]    
    npv_for_text <- paste("Median NPV:\n ", round(median(npv_sim), 2))
    npv_for_text2 <- paste("SD NPV:\n ", round(sd(npv_sim), 2))
    
    plot1 <- ggplot() +
      geom_density(aes(x = npv_sim,
                       alpha = 1/2, ..scaled..), kernel = "gau") +
      geom_vline(xintercept = c(0, median(npv_sim)), col="blue") +
      coord_cartesian(xlim = c(-10, 400)) +
      guides(alpha = "none", colour="none") +
      labs(y = NULL,
           x = "NPV" ,
           title = "Lifetime Income Effects of Deworming for Each Treated Children",
           subtitle = paste0(policy_estimates_text[position], ". ",
                             "N = ", input$param1, " simulations. Takes ",
                             round(total_time, 1)," ",attributes(total_time)$unit )  )+
      annotate("text", x = 1.5 * median(npv_sim), y = 0.25, label = npv_for_text, size = 6)+
      annotate("text", x = 1.5 * median(npv_sim), y = 0.10, label = npv_for_text2, size = 6)+
      theme(axis.ticks = element_blank(), axis.text.y = element_blank())
    if (input$rescale == TRUE) {
      plot1 <- suppressMessages( plot1 + coord_cartesian(xlim = 1.2 * c( min( c(-1, npv_sim) ), max( c(100, npv_sim) ))) )
    }
    print(plot1)  
  }, height = 700, width = 600 
  )
  
  output$plot1_ka <- renderPlot({      
    npv_sim_all <- reactive.data1()
    
    total_time <- npv_sim_all$total_time
    position <- which( policy_estimates_text == input$policy_est)
    npv_sim <- npv_sim_all[[ policy_estimates[position] ]]    
    npv_for_text <- paste("Median NPV:\n ", round(median(npv_sim), 2))
    npv_for_text2 <- paste("SD NPV:\n ", round(sd(npv_sim), 2))
    
    plot1 <- ggplot() +
      geom_density(aes(x = npv_sim,
                       alpha = 1/2, ..scaled..), kernel = "gau") +
      geom_vline(xintercept = c(0, median(npv_sim)), col="blue") +
      coord_cartesian(xlim = c(-10, 400)) +
      guides(alpha = "none", colour="none") +
      labs(y = NULL,
           x = "NPV" ,
           title = "Lifetime Income Effects of Deworming for Each Treated Children",
           subtitle = paste0(policy_estimates_text[position], ". ")
           )+
      annotate("text", x = 1.5 * median(npv_sim), y = 0.25, label = npv_for_text, size = 6)+
      annotate("text", x = 1.5 * median(npv_sim), y = 0.10, label = npv_for_text2, size = 6)+
      theme(axis.ticks = element_blank(), axis.text.y = element_blank())
    if (input$rescale == TRUE) {
      plot1 <- suppressMessages( plot1 + coord_cartesian(xlim = 1.2 * c( min( c(-1, npv_sim) ), max( c(100, npv_sim) ))) )
    }
    print(plot1)  
  }, height = 700, width = 600 
  )
  
  output$plot1_main <- renderPlot({      
    # TO DO: wrap all the following steps in a function and call them again below (instead of copying and pasting)
    
    npv_sim_all <- reactive.data1()
    
    total_time <- npv_sim_all$total_time
    position <- which( policy_estimates_text == input$policy_est)
    npv_sim <- npv_sim_all[[ policy_estimates[position] ]]    
    npv_for_text <- paste("Median NPV:\n ", round(median(npv_sim), 2))
    npv_for_text2 <- paste("SD NPV:\n ", round(sd(npv_sim), 2))
    
    plot1 <- ggplot() +
      geom_density(aes(x = npv_sim,
                       alpha = 1/2, ..scaled..), kernel = "gau") +
      geom_vline(xintercept = c(0, median(npv_sim)), col="blue") +
      coord_cartesian(xlim = c(-10, 400)) +
      guides(alpha = "none", colour="none") +
      labs(y = NULL,
           x = "Net Present Value (Benefits -  Costs)" ,
           title = "Lifetime Income Effects of Deworming for Each Treated Children",
           subtitle = "Distribution of the Net Present Value of Deworming Interventions"
           ) +
      annotate("text", x = 1.5 * median(npv_sim), y = 0.25, label = npv_for_text, size = 6)+
      theme(axis.ticks = element_blank(), axis.text.y = element_blank())
    if (input$rescale == TRUE) {
      plot1 <- suppressMessages( plot1 + coord_cartesian(xlim = 1.2 * c( min( c(-1, npv_sim) ), max( c(100, npv_sim) ))) )
    }
    print(plot1)  
  }, height = 700, width = 600 
  )
  #  })
})
