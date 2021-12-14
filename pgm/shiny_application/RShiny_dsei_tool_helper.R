# Note: percent map is designed to work with the counties data set
# It may not work correctly with other data sets if their row order does 
# not exactly match the order in which the maps package plots counties

# library(ggplot2)
# library(reshape2)
# library(knitr)
# library(kableExtra)

pos_summ <- function(x, a, b, ci, prob, n = 20){
#  a <- prior.m/(1 - prior.m)
  m <- (x + a)/(n + a + b)
  CI <- c(0.90, 0.95)[ci]
  q1 <- qbeta(((1 - CI)/2), x + a, n - x + b)
  q2 <-  qbeta((CI + (1 - CI)/2), x + a, n - x + b)
  p <- diff(pbeta(prob, x + a, n - x + b))
  return(c(as.numeric(x), round(c( m, q1, q2, p),3)))
}

posterior_dat_ab <- function(no.res = no.res, a = a, b = b, ci = ci, prob = prob,t_orr=t_orr, n = 1){
  CI <- c(0.90, 0.95)[ci]
  eff.int <- as.numeric(unlist(strsplit(prob, ",")))
  eff.int.all <- unique(sort(c(eff.int, c(0,1))))
  torr.int <- unique(sort(c(t_orr,1)))
  no.res.n <- as.numeric(unlist(strsplit(no.res, ","))) 
  N <- n
  dat <- data.frame(t(sapply(no.res.n, function(k){pos_summ(k, a = a, b = b, ci = ci, prob = eff.int.all, n = N)})))
  dat[,1] <- as.integer(dat[,1])
  names(dat)[c(1:4,ncol(dat))] <- c("Number of observed responses", "Posterior Mean", paste("Lower ", 100*CI,"% CI", sep = ""), 
                       paste("Upper ", 100*CI,"% CI", sep = ""),paste("Prob of prosterior >= target ORR"))
  if(dim(dat)[2] == 6){
    names(dat)[5:6] <- c(paste("Unacceptable activity \n [", eff.int.all[1],",",eff.int.all[2], ")", sep = "" ), 
                         paste("Clinically relevant activity \n [", eff.int.all[2], ",", eff.int.all[3], "]", sep = ""))
  }
  if(dim(dat)[2] == 7){
    names(dat)[5:7] <- c(paste("Unacceptable activity [", eff.int.all[1],",",eff.int.all[2], ")", sep = "" ), 
                         paste("Limited activity [", eff.int.all[2], ",", eff.int.all[3], ")", sep = ""), 
                         paste("Clinically relevant activity [", eff.int.all[3], ",", eff.int.all[4], "]", sep = ""))
  }
  if(dim(dat)[2] == 8){
    names(dat)[5:8] <- c(paste("Unacceptable activity [", eff.int.all[1],",",eff.int.all[2], ")", sep = "" ), 
                         paste("Limited activity [", eff.int.all[2], ",", eff.int.all[3], ")", sep = ""), 
                         paste("Moderate activity [", eff.int.all[3], ",", eff.int.all[4], ")", sep = ""), 
                         paste("Clinically relevant activity [", eff.int.all[4], ",", eff.int.all[5], "]", sep = ""))
  }
  if(dim(dat)[2] > 8){
    names(dat)[5:dim(dat)[2]] <- paste("Interval ", 1:(dim(dat)[2] - 4), " [", eff.int.all[1:(length(eff.int.all)-1)], ",", eff.int.all[2:length(eff.int.all)], "]", sep = "")
  }
  return(dat)
}

posterior_dat <- function(no.res = no.res, b_orr = b_orr, t_orr = t_orr, ci = ci, prob = prob, n = 1){
  if(b_orr<0.5){
    b <- 1
    a <- b_orr/(1-b_orr)
  }else{
    a <- 1
    b <- (1-b_orr)/b_orr
  }
  CI <- c(0.90, 0.95)[ci]
  eff.int <- as.numeric(unlist(strsplit(prob, ",")))
  eff.int.all <- unique(sort(c(eff.int, c(0,1))))
  torr.int <- unique(sort(c(t_orr,1)))
  no.res.n <- as.numeric(unlist(strsplit(no.res, ","))) 
  N <- n
  dat <- data.frame(t(sapply(no.res.n, function(k){pos_summ(k, a = a, b = b, ci = ci, prob = eff.int.all, n = N)})))
  dat[,1] <- as.integer(dat[,1])
  names(dat)[c(1:4,ncol(dat))] <- c("Number of observed responses", "Posterior Mean", paste("Lower ", 100*CI,"% CI", sep = ""), 
                                    paste("Upper ", 100*CI,"% CI", sep = ""),paste("Prob of prosterior >= target ORR"))
  if(dim(dat)[2] == 6){
    names(dat)[5:6] <- c(paste("Unacceptable activity \n [", eff.int.all[1],",",eff.int.all[2], ")", sep = "" ), 
                         paste("Clinically relevant activity \n [", eff.int.all[2], ",", eff.int.all[3], "]", sep = ""))
  }
  if(dim(dat)[2] == 7){
    names(dat)[5:7] <- c(paste("Unacceptable activity [", eff.int.all[1],",",eff.int.all[2], ")", sep = "" ), 
                         paste("Limited activity [", eff.int.all[2], ",", eff.int.all[3], ")", sep = ""), 
                         paste("Clinically relevant activity [", eff.int.all[3], ",", eff.int.all[4], "]", sep = ""))
  }
  if(dim(dat)[2] == 8){
    names(dat)[5:8] <- c(paste("Unacceptable activity [", eff.int.all[1],",",eff.int.all[2], ")", sep = "" ), 
                         paste("Limited activity [", eff.int.all[2], ",", eff.int.all[3], ")", sep = ""), 
                         paste("Moderate activity [", eff.int.all[3], ",", eff.int.all[4], ")", sep = ""), 
                         paste("Clinically relevant activity [", eff.int.all[4], ",", eff.int.all[5], "]", sep = ""))
  }
  if(dim(dat)[2] > 8){
    names(dat)[5:dim(dat)[2]] <- paste("Interval ", 1:(dim(dat)[2] - 4), " [", eff.int.all[1:(length(eff.int.all)-1)], ",", eff.int.all[2:length(eff.int.all)], "]", sep = "")
  }
  return(dat)
}

ae_dat <- function(patients, aeinc, noae){
  no.patients <- as.numeric(unlist(strsplit(patients, ",")))
  ae.inc <- as.numeric(unlist(strsplit(aeinc, ",")))
  no.ae <- as.numeric(unlist(strsplit(noae, ",")))

  prob.ae <- function(x, y, z){round(dbinom(x, y, z),3)}
  cprob.ae <- function(x, y, z){round(pbinom(x, y, z, lower.tail=T),3)}
  ## The table of at least 1 Events
  #mat_atleast1 <- 1-t(sapply(no.patients, prob.ae, x = 0, z = ae.inc, simplify = "array"))
  finaldat <- data.frame(Number_of_patients = no.patients)
  colnames(finaldat) <- c("Number of patients")
  
  ## customize the number of Events
  grep_name <- vector()
  for (m in no.ae) {
    ## exact number of events
    mat <- t(sapply(no.patients, prob.ae, x = m, z = ae.inc, simplify = "array"))
    dat <- data.frame(mat)
    colnames(dat) <- paste("AE Incidence = ", ae.inc, sep = "")
    finaldat <- cbind(finaldat, dat)
    grep_name <- c(grep_name, paste(m,'Events', sep=' '))
    ## at least m events
    if (m != 0) {
      mat_al <- 1-t(sapply(no.patients, cprob.ae, x = m-1, z = ae.inc, simplify = "array"))
      dat_al <- data.frame(mat_al)
      colnames(dat_al) <- paste("AE Incidence = ", ae.inc, sep = "")
      finaldat <- cbind(finaldat, dat_al)
      grep_name <- c(grep_name, paste('At least', m, 'Events', sep=' '))
    } 
  }
  
  #finaldat <- kable_classic(kbl(finaldat)) 
  finaldat <- kbl(finaldat)
  #grep_name <- paste(no.ae, "Events", sep= " ")
  if (0 %in% no.ae) {
    myheader <- c(1, rep(length(ae.inc), length(no.ae)*2-1))
  } else {
    myheader <- c(1, rep(length(ae.inc), length(no.ae)*2))
  }
  #myheader <- ifelse(0 %in% no.ae, c(1, rep(length(ae.inc), length(no.ae)*2-1)),
  #                   c(1, rep(length(ae.inc), length(no.ae)*2)))
  #myheader <- c(" "=1, "At Least 1 AE"=2, grep_name=2)
  names(myheader) <- c(" ", grep_name)
  finaldat <- add_header_above(finaldat, header = myheader)
  finaldat <- kable_styling(finaldat, bootstrap_options = "strip",
                            full_width = T,font_size = 11)
  
  return(finaldat)
}

prob_interim_final <- function(N= NULL,n= NULL, r.stop= NULL,r.success = NULL,True.p = NULL)
{
  #Probability of stopping at interim
  prob.stop.interim <- pbinom(r.stop, n, True.p)
  prob.stop.interim <- round(prob.stop.interim, 3)
  
  #Probability of success at final 
  prob.success.final <- t(1- pbinom((r.success- (r.stop+1):n)-1, N-n, True.p))%*% dbinom((r.stop+1):n, n, True.p)
  prob.success.final <- round(prob.success.final, 3)
  
  #Prob of failure at final  
  prob.fail.final <- 1 - prob.stop.interim - prob.success.final
  prob.fail.final <- round(prob.fail.final,3)
  
  operca <- list(True.ORR=True.p,prob.stop.interim= prob.stop.interim, prob.success.final=prob.success.final, prob.fail.final=prob.fail.final)
  return(operca)
}

dat_interim_final <- function(N = NULL, n = NULL, r.stop = NULL, r.success = NULL, True.p = NULL){
  True.p <- as.numeric(unlist(strsplit(True.p, ",")))
  prob.interim <- data.frame(t(mapply(prob_interim_final, True.p = True.p,  N = N, 
           n = n, r.stop = r.stop, r.success = r.success)))
  prob.interim1 <- data.frame(lapply(prob.interim, as.numeric), stringsAsFactors=FALSE)
  names(prob.interim1) <- c("True response rate", "Prob of stopping at interim", "Prob of success at final analysis", "Prob of failing at final analysis")
  return(prob.interim1)
}

## Bayesian Predictive Probability Interim Analysis
dat_interim_bayes <- function(Nmax=30,Nint="5,10,15",a=1,b=1,p0=0.5,pa=0.75,pt=0.8,pfe="0.25,0.95") {
  nmax <- as.numeric(Nmax)
  nint <- as.numeric(unlist(strsplit(Nint, ",")))
  pfe <- as.numeric(unlist(strsplit(pfe, ",")))
  pf <- pfe[1]
  pe <- pfe[2]
  dat <- data.frame(Patients=double(),
                    Responses_fut=character(),
                    Responses_eff=character(),
                    Type1error = double(),
                    Power = double(),stringsAsFactors=FALSE)
  
  ###### Posterior Probability calculation function ######
  indicator <- function(a, b, nmax, y, p0) {
    prob <- pbeta(p0,shape1=a+y,shape2=b+nmax-y,lower.tail=F)
    return(prob)
  }
  ###### Predictive Probability calculation function ######
  ppcal <- function(nmax,ncur,ecur,a,b,p0,pt) {
    pp <- 0
    for (j in 0:(nmax-ncur)){
      post_prob <- indicator(a,b,nmax,j+ecur,p0)
      betabbinon_prob <- choose(nmax-ncur,j)*
        (beta(a+ecur+j,nmax-ecur-j+b)/beta(a+ecur,ncur-ecur+b))
      ## calculation of the beta binomial density
      # sbb <- a+b+ncur
      # mbb <- (a+ecur)/sbb
      # pp <- pp + (dbetabinom(j,nmax-ncur,m=mbb,s=sbb) * 
      #               (post_prob>pt))
      pp <- pp + betabbinon_prob * (post_prob>pt)
    }
    return(pp)
  }
  
  ######### Simulation function #########
  simtrial <- function(
    ptrue = 0.50,
    p0 = 0.50,
    nint = c(10,15,20),
    pe = 0.95,
    pf = 0.20,
    pt = 0.80,
    a = 1,
    b = 1) {
    
    ### determine minimum number of 'successes' necessary to 
    ### conclude efficacy if study continues to maximum 
    ### sample size
    post <- sapply(0:nmax, function(nevt)
      ppcal(nmax,nmax,nevt,a,b,p0,pt))
    nsuc <- min(which(post>pe)-1)
    ### simulate samples
    samp <- rbinom(n = nmax, size = 1, prob = ptrue)
    
    ### simulate interim analyses
    intr <- lapply(nint, function(ncur) {
      ecur <- sum(samp[1:ncur])
      pp <- ppcal(nmax,ncur,ecur,a,b,p0,pt)
      
      ## return for efficacy
      if (pp >= pe)
        return(list(action='stop',
                    reason='efficacy',
                    n = ncur))
      ## return for futility
      if (pp <= pf)
        return(list(action='stop',
                    reason='futility',
                    n = ncur))
      erem <- nsuc-ecur
      ## compute success probability Pr(p > p_0 | x_{(t_max)})
      if(erem > nmax-ncur) { ## not enough possible events
        sucp <- 0
      }
      # else { ## not yet met efficacy threshold
      #   betabbinon_prob <- choose(nmax-ncur,j)*
      #     (beta(a+ecur+j,nmax-ecur-j+b)/beta(a+ecur,ncur-ecur+b))
      #   sucp <- 1 - pbetabinom(q = erem-1, size = nmax-ncur,
      #                          m = (a+ecur)/(a+b+ncur), 
      #                          s = a+b+ncur)
      # }
      return(list(action='continue',
                  reason='',
                  n = ncur))
    })
    stpi <- match('stop', sapply(intr, `[[`, 'action'))
    return(intr[[stpi]])
  }
  
  ## calculation of number of responses for early stop
  for (npatient in nint) {
    post2 <- sapply(0:npatient, function(nevt)
      ppcal(nmax,npatient,nevt,a,b,p0,pt))
    maxres_ful <- max(which(post2<=pf)-1)
    minres_eff <- min(which(post2>=pe)-1)
    dat_intr <- data.frame(Patients=npatient,
                           Responses_fut=paste0("0 - ",maxres_ful),
                           Responses_eff=ifelse(pe != 1,
                                                paste0(minres_eff," - ",
                                                npatient),
                                                "no early stopping for efficacy"))
    dat <- rbind(dat, dat_intr)
  }
  
  ## simulation to get the type1 error and power
  ## (10000 iteration)
  ### type 1 error
  res1 <- do.call(rbind, lapply(1:1000, 
                                function(t) data.frame(simtrial(ptrue = p0, 
                                                                p0 = p0,
                                                                nint = nint,
                                                                pe = pe,
                                                                pf = pf,
                                                                pt = pt,
                                                                a = a,
                                                                b = b))))
  type1 <- ifelse(pe != 1, sum(res1$reason=='efficacy')/1000,
                  (1000-sum(res1$reason=='futility'))/1000)
  ### power
  res2 <- do.call(rbind, lapply(1:1000, 
                                function(t) data.frame(simtrial(ptrue = pa, 
                                                                p0 = p0,
                                                                nint = nint,
                                                                pe = pe,
                                                                pf = pf,
                                                                pt = pt,
                                                                a = a,
                                                                b = b))))
  power <- ifelse(pe != 1, sum(res2$reason == 'efficacy')/1000,
                  (1000-sum(res2$reason=='futility'))/1000)
  dat$type1 <- type1
  dat$power <- power
  colnames(dat) <- c('Number of patients at interim points',
                     'Number of responses (inclusive) are considered futile',
                     'Number of responses (inclusive) are considered efficacious',
                     'Type I error of design','Power of design')
  #dat <- kable_classic(kbl(dat)) %>%
  dat <- kbl(dat) %>% 
    kable_styling(bootstrap_options = "striped", full_width = F, position = "left",font_size = 12) %>%
    collapse_rows(columns = c(4,5), valign = "middle")
  return(dat)
}

plot_errorbar <- function(dat){
  # grid.arrange(ggplot() + geom_errorbar(data = dat, aes(x = dat[,1], ymin = dat[,3], ymax = dat[,4]), col = "black", 
  # width = 1, size = 1) + geom_point(data = dat, aes(x = dat[,1], y = dat[,2]), 
  # size = 4) + coord_flip() + 
  #   labs(y = "Posterior Mean", x = "Number of observed responses"),
  # bottom = textGrob(paste(Sys.time(), sep = " "), x = 1, 
  #                   hjust = 1, gp = gpar(fontface = 3L, fontsize = 9)))
  
ggplot() + geom_errorbar(data = dat, aes(x = dat[,1], ymin = dat[,3], ymax = dat[,4]), col = "black", 
                                        width = 1, size = 1) + geom_point(data = dat, aes(x = dat[,1], y = dat[,2]), 
                                                                          size = 4) + coord_flip() + 
                 labs(y = "Posterior Mean", x = "Number of observed responses")
  
}

plot_probbar <- function(dat){
  dat.m <- melt(dat, id.vars = 1:4)
  # grid.arrange(ggplot() + geom_bar(data = dat.m, aes(x = as.factor(dat.m[,1]), weight = value)) + facet_wrap(~ variable, ncol = 1) + 
  #   xlab("Number of observed responses") + ylab("Probability"),
  #   bottom = textGrob(paste(Sys.time(), sep = " "), x = 1, 
  #                     hjust = 1, gp = gpar(fontface = 3L, fontsize = 9))
    
   ggplot() + geom_bar(data = dat.m, aes(x = as.factor(dat.m[,1]), weight = value)) + facet_wrap(~ variable, ncol = 1) + 
                   xlab("Number of observed responses") + ylab("Probability")
  
}

plot_bb_density <- function(a=1,b=1,prior=T,n=100,y=10,target.ci=c(0,0)) {
  if (prior == T) {
    shape1 = a
    shape2 = b
    #title = "Prior distribution (Beta Distribution) density plot"
  }
  else {
    shape1 = a+y
    shape2 = b+n-y
    #title = "Posterior distribution (Beta Distribution) density plot"
  }
    # Text format
    #ci <- unlist(strsplit(gsub("\\(|\\)", "", target.ci), ","))
    #ci[grepl("%",ci)] <- as.numeric(sub("%","",ci[grepl("%",ci)]))/100
    #ci <- as.numeric(ci)
    ci <- target.ci
    beta_obs <- seq(0,1,length=500)
    obs_inci <- beta_obs[beta_obs>min(ci) & beta_obs<max(ci)]
    obs_lci <- beta_obs[beta_obs<=min(ci)]
    obs_rci <- beta_obs[beta_obs>=max(ci)]
    beta_dist <- data.frame(cbind(beta_obs, dbeta(beta_obs,shape1,shape2)))
    beta_dist_inci <- data.frame(cbind(obs_inci, dbeta(obs_inci,shape1,shape2)))
    beta_dist_lci <- data.frame(cbind(obs_lci, dbeta(obs_lci,shape1,shape2)))
    beta_dist_rci <- data.frame(cbind(obs_rci, dbeta(obs_rci,shape1,shape2)))
    #beta_dist <- beta_dist[-1,]
    #beta_dist[,'in_ci'] <- (beta_dist$beta_obs>min(target.ci) & beta_dist$beta_obs<max(target.ci))
    colnames(beta_dist) <- c('obs','density')
    colnames(beta_dist_inci) <- c('obs','density')
    colnames(beta_dist_lci) <- c('obs','density')
    colnames(beta_dist_rci) <- c('obs','density')
    ci_prob <- format(round(pbeta(max(ci),shape1,shape2)-pbeta(min(ci),shape1,shape2),4),nsmall=4)
    label <- paste("Probability in ( ",min(ci),", ",max(ci),") = ",ci_prob, sep="")
    
    ggplot() +
      geom_line(data=beta_dist,aes(x=obs, y=density),color = "black") + 
      geom_area(data=beta_dist_inci,aes(x=obs,y=density,fill="lightgreen"), alpha=0.4) +
      geom_area(data=beta_dist_lci,aes(x=obs,y=density,fill="lightblue"), alpha=0.4) +
      geom_area(data=beta_dist_rci,aes(x=obs,y=density,fill="lightblue"), alpha=0.4) +
      #geom_ribbon(data=beta_dist_outci,aes(x=obs,ymin=0,ymax=density,fill="lightblue"), alpha=0.4) +
      #geom_ribbon(data=beta_dist,alpha=0.4,
      #            aes(x=obs, ymin=0, ymax=prob,
      #                fill=(inci==T))) +
      scale_fill_manual(values=c("lightblue","lightgreen","lightblue"), name="fill") +
      sapply(ci, 
             function(xint) geom_vline(aes(xintercept = xint),
                                       color="red",linetype="dashed")) +
      labs(#title=title,
           subtitle = label,
           x = 'y', y='Density') +
      theme(legend.position = 'NA',
            plot.title = element_text(size = 12)) +
      coord_cartesian(xlim = c(0, 1))
}
