
######
library(lawstat)
library(perm)
library(brunnermunzel)
library(MKinfer)
library(sgof)
library(BiocManager)
library(qvalue)
library(BonEV)
library(dplyr)

big<-function(1){
  avgsd2<-function(nx,meanx,sdx, ny,meany,sdy){
    x<-rnorm(n=nx,mean=meanx,sd=sdx)
    y<-rnorm(n=ny,mean=meany,sd=sdy)
    wtest <- t.test(x, y)
    wtest_perm <- perm.t.test(x,y)
    BM_Perm <- brunnermunzel.permutation.test(x,y,force = TRUE)
    BM <- brunnermunzel.test(x,y)
    out_p1 <- list(p_w = wtest$p.value, p_w_perm = wtest_perm$perm.p.value, p_BM_Perm = BM_Perm$p.value, p_BM = BM$p.value, id = 1)
    return(out_p1)
   }
  
  
  num.rep<-950
  df1<-replicate(num.rep, avgsd2(nx=10,meanx=5,sdx=2, ny=10,meany=5,sdy=2))
 
  avgsd3<-function(nx,meanx,sdx, ny,meany,sdy){
    x<-rnorm(n=nx,mean=meanx,sd=sdx)
    y<-rnorm(n=ny,mean=meany,sd=sdy)
    wtest <- t.test(x, y)
    wtest_perm <- perm.t.test(x,y)
    BM_Perm <- brunnermunzel.permutation.test(x,y,force = TRUE)
    BM <- brunnermunzel.test(x,y)
    out_p2 <- list(p_w = wtest$p.value, p_w_perm = wtest_perm$perm.p.value, p_BM_Perm = BM_Perm$p.value, p_BM = BM$p.value, id = 0)
    return(out_p2)
   }
  
  
  num.rep<-50
  df2<-replicate(num.rep, avgsd3(nx=10,meanx=8,sdx=2, ny=10,meany=4,sdy=2))
  out_pd<-list(cbind(df1,df2))
  out_t <- as.data.frame(out_pd)
  out_pdtu <- sapply(out_t, unlist)
  out_pv <- t(out_pdtu)
  out_pvd <- as.data.frame(out_pv)
  
  #outputting p_w with id
  
  data_pw <-subset(out_pvd, select = - c(p_w_perm, p_BM_Perm, p_BM))
  data_pw <- data_pw[order(data_pw$p_w),]
  
  #outputting p_w_perm with id
  data_pw_perm <-subset(out_pvd, select = - c(p_w, p_BM_Perm, p_BM))
  data_pw_perm <- data_pw_perm[order(data_pw_perm$p_w_perm),]
  
  #outputting p_BM_Perm with id
  data_BM_perm <-subset(out_pvd, select = - c(p_w, p_w_perm, p_BM))
  data_BM_perm <- data_BM_perm[order(data_BM_perm$p_BM_Perm),]
  
  #outputting p_BM with id
  data_BM <-subset(out_pvd, select = - c(p_w, p_w_perm, p_BM_Perm))
  data_BM <- data_BM[order(data_BM$p_BM),]
  
  # #Benjamini-Hochberg for All FOUR
  # 
  # data_pw$p_w_BH <- p.adjust(data_pw$p_w, "BH")
  # data_pw$p_w_perm_BH <- p.adjust(data_pw_perm$p_w_perm, "BH")
  # data_pw$p_BM_Perm_BH <- p.adjust(data_BM_perm$p_BM_Perm, "BH")
  # data_pw$p_BM_BH <- p.adjust(data_BM$p_BM, "BH")
  # 
  # 
  # # qvalues for p_w
  # qobj_pw = qvalue(data_pw$p_w)
  # data_pw$q_pw = qobj_pw$qv
  # 
  # qobj_pw_perm = qvalue(data_pw_perm$p_w_perm)
  # data_pw$q_pw_perm = qobj_pw_perm$qv
  # 
  # qobj_BM_perm = qvalue(data_BM_perm$p_BM_Perm)
  # data_pw$q_BM_perm = qobj_BM_perm$qv
  # 
  # qobj_BM = qvalue(data_BM$p_BM)
  # data_pw$q_BM = qobj_BM$qv
  
  # summary(qobj_pw)
  # plot(qobj_pw)
  # hist(qobj_pw)
  
  # BON-EV procedure
  adjp = Bon_EV(data_pw$p_w, 0.05)
  data_pw$BEV_w = adjp$raw_P_value
  data_pw$BEV_w_BH = adjp$BH_adjp
  data_pw$BEV_w_Storey = adjp$Storey_adjp
  data_pw$BEV_w_BON = adjp$Bon_EV_adjp
  
  adjp_pw_perm = Bon_EV(data_pw_perm$p_w_perm, 0.05)
  data_pw$BEV_pw = adjp_pw_perm$raw_P_value
  data_pw$BEV_pw_BH = adjp_pw_perm$BH_adjp
  data_pw$BEV_pw_Storey = adjp_pw_perm$Storey_adjp
  data_pw$BEV_pw_BON = adjp_pw_perm$Bon_EV_adjp
  
  adjp_BM_perm = Bon_EV(data_BM_perm$p_BM_Perm, 0.05)
  data_pw$BEV_pBM = adjp_BM_perm$raw_P_value
  data_pw$BEV_pBM_BH = adjp_BM_perm$BH_adjp
  data_pw$BEV_pBM_Storey = adjp_BM_perm$Storey_adjp
  data_pw$BEV_pBM_BON = adjp_BM_perm$Bon_EV_adjp
  
  adjp_BM = Bon_EV(data_BM$p_BM, 0.05)
  data_pw$BEV_BM = adjp_BM$raw_P_value
  data_pw$BEV_BM_BH = adjp_BM$BH_adjp
  data_pw$BEV_BM_Storey = adjp_BM$Storey_adjp
  data_pw$BEV_BM_BON = adjp_BM$Bon_EV_adjp
  
  # plot(data_pw$BEV_pw, data_pw$BEV_pw_BH, type="o", col="blue", pch="o", ylab="y", lty=1)
  # points(data_pw$BEV_pw, data_pw$BEV_pw_Storey, col="red", pch="*")
  # lines(data_pw$BEV_pw, data_pw$BEV_pw_Storey, col="red",lty=2)
  # points(data_pw$BEV_pw, data_pw$BEV_pw_BON, col="black", pch="+")
  # lines(data_pw$BEV_pw, data_pw$BEV_pw_BON, col="black",lty=3)
  
  #Calculating FDR
   data_pw$fdr_w_BH= ifelse(data_pw$BEV_w_BH <.05, 1,0)
   data_pw$fdr_w_Storey= ifelse(data_pw$BEV_w_Storey <.05, 1,0)
   data_pw$fdr_w_BON= ifelse(data_pw$BEV_w_BON <.05, 1,0)
   
   data_pw$fdr_pw_BH= ifelse(data_pw$BEV_pw_BH <.05, 1,0)
   data_pw$fdr_pw_Storey= ifelse(data_pw$BEV_pw_Storey <.05, 1,0)
   data_pw$fdr_pw_BON= ifelse(data_pw$BEV_pw_BON  <.05, 1,0)
   
   data_pw$fdr_pBM_BH= ifelse(data_pw$BEV_pBM_BH <.05, 1,0)
   data_pw$fdr_pBM_Storey= ifelse(data_pw$BEV_pBM_Storey <.05, 1,0)
   data_pw$fdr_pBM_BON= ifelse(data_pw$BEV_pBM_BON <.05, 1,0)
   
   data_pw$fdr_BM_BH= ifelse(data_pw$BEV_BM_BH <.05, 1,0)
   data_pw$fdr_BM_Storey= ifelse(data_pw$BEV_BM_Storey <.05, 1,0)
   data_pw$fdr_BM_BON= ifelse(data_pw$BEV_BM_BON <.05, 1,0)
  
  #calculating proportion WElch Test
    fmean_w_BH <- data_pw %>% group_by(fdr_w_BH) %>%
    summarise(count_fdr=n(), mean_fdr_w_BH = mean(id),tot_fdr=sum(id))
    fdr_outw_BH <- fmean_w_BH[2,3]
    
    fmean_w_Storey <- data_pw %>% group_by(fdr_w_Storey) %>%
    summarise(count_fdr=n(), mean_fdr_w_Storey = mean(id),tot_fdr=sum(id))
    fdr_outw_Storey <- fmean_w_Storey[2,3]
    
    fmean_w_BON <- data_pw %>% group_by(fdr_w_BON) %>%
    summarise(count_fdr=n(), mean_fdr_w_BON = mean(id),tot_fdr=sum(id))
    fdr_outw_BON <- fmean_w_BON[2,3]
    
    #calculating proportion PERM_Welch Test
    fmean_pw_BH <- data_pw %>% group_by(fdr_pw_BH) %>%
    summarise(count_fdr=n(), mean_fdr_pw_BH = mean(id),tot_fdr=sum(id))
    fdr_outpw_BH <- fmean_pw_BH[2,3]
    
    fmean_pw_Storey <- data_pw %>% group_by(fdr_pw_Storey) %>%
    summarise(count_fdr=n(), mean_fdr_pw_Storey = mean(id),tot_fdr=sum(id))
    fdr_outpw_Storey <- fmean_pw_Storey[2,3]
    
    fmean_pw_BON <- data_pw %>% group_by(fdr_pw_BON) %>%
    summarise(count_fdr=n(), mean_fdr_pw_BON = mean(id),tot_fdr=sum(id))
    fdr_outpw_BON <- fmean_pw_BON[2,3]
    
    #calculating proportion PERM_BM Test
    fmean_pBM_BH <- data_pw %>% group_by(fdr_pBM_BH) %>%
      summarise(count_fdr=n(), mean_fdr_pBM_BH = mean(id),tot_fdr=sum(id))
    fdr_outpBM_BH <- fmean_pBM_BH[2,3]
    
    fmean_pBM_Storey <- data_pw %>% group_by(fdr_pBM_Storey) %>%
      summarise(count_fdr=n(), mean_fdr_pBM_Storey = mean(id),tot_fdr=sum(id))
    fdr_outpBM_Storey <- fmean_pBM_Storey[2,3]
    
    fmean_pBM_BON <- data_pw %>% group_by(fdr_pBM_BON) %>%
      summarise(count_fdr=n(), mean_fdr_pBM_BON = mean(id),tot_fdr=sum(id))
    fdr_outpBM_BON <- fmean_pBM_BON[2,3]
    
    #calculating proportion BM Test
    fmean_BM_BH <- data_pw %>% group_by(fdr_BM_BH) %>%
      summarise(count_fdr=n(), mean_fdr_BM_BH = mean(id),tot_fdr=sum(id))
    fdr_outBM_BH <- fmean_BM_BH[2,3]
    
    fmean_BM_Storey <- data_pw %>% group_by(fdr_BM_Storey) %>%
      summarise(count_fdr=n(), mean_fdr_BM_Storey = mean(id),tot_fdr=sum(id))
    fdr_outBM_Storey <- fmean_BM_Storey[2,3]
    
    fmean_BM_BON <- data_pw %>% group_by(fdr_BM_BON) %>%
      summarise(count_fdr=n(), mean_fdr_BM_BON = mean(id),tot_fdr=sum(id))
    fdr_outBM_BON <- fmean_BM_BON[2,3]
   
    out_final_w <- list(outw_BH=fdr_outw_BH$mean_fdr_w_BH, outw_Storey=fdr_outw_Storey$mean_fdr_w_Storey, outw_BON=fdr_outw_BON$mean_fdr_w_BON)
    out_final_w
    
    out_final_pw <- list(outpw_BH=fdr_outpw_BH$mean_fdr_pw_BH, outpw_Storey=fdr_outpw_Storey$mean_fdr_pw_Storey, outpw_BON=fdr_outpw_BON$mean_fdr_pw_BON)
    out_final_pw
    
    out_final_pBM <- list(outpBM_BH=fdr_outpBM_BH$mean_fdr_pBM_BH, outpBM_Storey=fdr_outpBM_Storey$mean_fdr_pBM_Storey, outpBM_BON=fdr_outpBM_BON$mean_fdr_pBM_BON)
    out_final_pBM
    
    out_final_BM <- list(outBM_BH=fdr_outBM_BH$mean_fdr_BM_BH, outBM_Storey=fdr_outBM_Storey$mean_fdr_BM_Storey, outBM_BON=fdr_outBM_BON$mean_fdr_BM_BON)
    out_final_BM
    
    out_final <-c(out_final_w,out_final_pw,out_final_pBM,out_final_BM)
    return(out_final)
    
    
# if (data_pw$BEV_pw_BH<.05 && data_pw$id==1) {
#    data_pw$fdr<-1
#    } else if (data_pw$BEV_pw_BH<.05 && data_pw$id==0) {
#      data_pw$fdr<-5
#   } else {
#        data_pw$fdr<-2 
#   }
  
  # a <- as.data.frame((out_p[ ,(6:7)]))
  # b <- data.matrix(a)
  # c <- b[order(b[ , 1]),]
  #out_pvd$p_w_s <- sort(out_pvd$p_w)
  #data_pw <- out_pvd[order(out_pvd$p_w),]
  #data_pw <- out_pv[order(out_pv[ , 1]),]
    
 }
num.rep<-2
attempt<-replicate(num.rep,big(1))
out_f<-t(attempt)
out_final1 <- as.data.frame(out_f)
out_final2 <- sapply(out_final1, unlist)
colMeans(out_final2)
print(nrow(out_final2))

