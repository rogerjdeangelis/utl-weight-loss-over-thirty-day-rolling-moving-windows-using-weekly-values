Weight loss over 30 day rolling windows moving using weekly values                                                           
                                                                                                                             
github                                                                                                                       
https://tinyurl.com/y38rdb6d                                                                                                 
https://github.com/rogerjdeangelis/utl-weight-loss-over-thirty-day-rolling-moving-windows-using-weekly-values                
                                                                                                                             
SAS Forum                                                                                                                    
https://tinyurl.com/y528hhck                                                                                                 
https://communities.sas.com/t5/SAS-Programming/Change-in-weight-every-30-days/m-p/545241                                     
                                                                                                                             
*_                   _                                                                                                       
(_)_ __  _ __  _   _| |_                                                                                                     
| | '_ \| '_ \| | | | __|                                                                                                    
| | | | | |_) | |_| | |_                                                                                                     
|_|_| |_| .__/ \__,_|\__|                                                                                                    
        |_|                                                                                                                  
;                                                                                                                            
                                                                                                                             
options validvarname=upcase;                                                                                                 
libname sd1 "d:/sd1";                                                                                                        
data sd1.have;                                                                                                               
  retain id dte dif 0;                                                                                                       
  format dte mmddyy10.;                                                                                                      
  do id= 1 to 3;                                                                                                             
    do dte=21628 to 22728 by 7;                                                                                              
       if dte=21628 then dif=0;                                                                                              
       else dif=-int(10*uniform(1233));                                                                                      
       output;                                                                                                               
    end;                                                                                                                     
  end;                                                                                                                       
run;quit;                                                                                                                    
                                                                                                                             
                                                                                                                             
SD1.HAVE total obs=474                                                                                                       
                                                                                                                             
Obs    ID       DTE        DIF                                                                                               
                                                                                                                             
  1     1    03/20/2019      0                                                                                               
  2     1    03/27/2019      0                                                                                               
  3     1    04/03/2019     -1                                                                                               
  4     1    04/10/2019     -9                                                                                               
  5     1    04/17/2019     -8                                                                                               
  6     1    04/24/2019     -3                                                                                               
  7     1    05/01/2019     -1                                                                                               
  8     1    05/08/2019     -4                                                                                               
  9     1    05/15/2019     -5                                                                                               
 10     1    05/22/2019     -3                                                                                               
....                                                                                                                         
                                                                                                                             
*            _               _                                                                                               
  ___  _   _| |_ _ __  _   _| |_                                                                                             
 / _ \| | | | __| '_ \| | | | __|                                                                                            
| (_) | |_| | |_| |_) | |_| | |_                                                                                             
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                            
                |_|                                                                                                          
;                                                                                                                            
                                                                                                                             
WORK.WANTWIN total obs=54                                                                                                    
                                                                                                                             
                                             WEIGHT                                                                          
Obs  ID   DATE_START     DATE_END     DAYS     LOSS                                                                          
                                                                                                                             
  1   1   12/07/2020    01/06/2021     30      -34                                                                           
  2   1   12/08/2020    01/07/2021     30      -34                                                                           
  3   1   12/14/2020    01/13/2021     30      -33                                                                           
  4   1   12/15/2020    01/14/2021     30      -33                                                                           
  5   1   10/11/2021    11/10/2021     30      -36                                                                           
  6   1   10/12/2021    11/11/2021     30      -36                                                                           
  7   1   10/18/2021    11/17/2021     30      -37                                                                           
  8   1   10/19/2021    11/18/2021     30      -37                                                                           
  9   1   10/25/2021    11/24/2021     30      -36                                                                           
 10   1   10/26/2021    11/25/2021     30      -36                                                                           
,,,                                                                                                                          
                                                                                                                             
*          _       _   _                                                                                                     
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                          
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                         
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                        
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                        
                                                                                                                             
;                                                                                                                            
                                                                                                                             
                                                                                                                             
* generate every day;                                                                                                        
                                                                                                                             
data sd1.havAll(keep=id dte);                                                                                                
 format dte mmddyy10.;                                                                                                       
 do until(last.id);                                                                                                          
   set have;                                                                                                                 
   by id;                                                                                                                    
   if first.id then do; dteBeg=dte; dif=0; end;                                                                              
   if  last.id then dteEnd=dte;                                                                                              
 end;                                                                                                                        
 do dte=dteBeg to dteEnd;                                                                                                    
   output;                                                                                                                   
 end;                                                                                                                        
run;quit;                                                                                                                    
                                                                                                                             
/*                                                                                                                           
SD1.HAVALL total obs=3,300                                                                                                   
                                                                                                                             
 Obs  ID      DTE                                                                                                            
                                                                                                                             
   1   1   03/20/2019                                                                                                        
   2   1   03/21/2019                                                                                                        
   3   1   03/22/2019                                                                                                        
   4   1   03/23/2019                                                                                                        
   5   1   03/24/2019                                                                                                        
   6   1   03/25/2019                                                                                                        
   7   1   03/26/2019                                                                                                        
   8   1   03/27/2019                                                                                                        
....                                                                                                                         
*/                                                                                                                           
                                                                                                                             
proc sql;                                                                                                                    
  create                                                                                                                     
     table sd1.havFil do until(last.s);set c;by s;a+ag;end;do until(last.s);set c;by s;output;end;a=0as                      
  select                                                                                                                     
     l.id                                                                                                                    
    ,l.dte                                                                                                                   
    ,coalesce(r.dif,0) as dif                                                                                                
  from                                                                                                                       
     sd1.havAll as l left join sd1.have as r                                                                                 
  on                                                                                                                         
     l.dte = r.dte and                                                                                                       
     l.id  = r.id                                                                                                            
  order                                                                                                                      
     by id, dte                                                                                                              
;quit;                                                                                                                       
                                                                                                                             
/*                                                                                                                           
Daily weight loss * fill in missing dates;                                                                                   
                                                                                                                             
 SD1.HAVFIL total obs=3,300                                                                                                  
                                                                                                                             
  Obs    ID       DTE        DIF                                                                                             
                                                                                                                             
    1     1    03/20/2019      0                                                                                             
    2     1    03/21/2019      0                                                                                             
    3     1    03/22/2019      0                                                                                             
    4     1    03/23/2019      0                                                                                             
    5     1    03/24/2019      0                                                                                             
    6     1    03/25/2019      0                                                                                             
    7     1    03/26/2019      0                                                                                             
    8     1    03/27/2019      0                                                                                             
    9     1    03/28/2019      0                                                                                             
   10     1    03/29/2019      0                                                                                             
   11     1    03/30/2019      0                                                                                             
   12     1    03/31/2019      0                                                                                             
   13     1    04/01/2019      0                                                                                             
   14     1    04/02/2019      0                                                                                             
   15     1    04/03/2019     -1                                                                                             
   16     1    04/04/2019      0                                                                                             
   17     1    04/05/2019      0                                                                                             
                                                                                                                             
                                                                                                                             
* install RollingWindow https://github.com/andrewuhl/RollingWindow                                                           
                                                                                                                             
library(devtools);                                                                                                           
install_github("andrewuhl/RollingWindow");                                                                                   
*/                                                                                                                           
                                                                                                                             
                                                                                                                             
%utl_submit_r64('                                                                                                            
library(haven);                                                                                                              
library(dplyr);                                                                                                              
library(SASxport);                                                                                                           
library(data.table);                                                                                                         
library(RollingWindow);                                                                                                      
have<-as.data.table(read_sas("d:/sd1/havfil.sas7bdat"));                                                                     
head(have);                                                                                                                  
have[,want := RollingSum(DIF,window = 30), by=ID];                                                                           
write.xport(have,file="d:/xpt/have.xpt");                                                                                    
');                                                                                                                          
                                                                                                                             
*_                                                                                                                           
| | ___   __ _                                                                                                               
| |/ _ \ / _` |                                                                                                              
| | (_) | (_| |                                                                                                              
|_|\___/ \__, |                                                                                                              
         |___/                                                                                                               
;                                                                                                                            
                                                                                                                             
libname xpt xport "d:/xpt/have.xpt";                                                                                         
data want;                                                                                                                   
  set xpt.have;                                                                                                              
run;quit;                                                                                                                    
libname xpt clear;                                                                                                           
                                                                                                                             
data wantWin;                                                                                                                
  retain                                                                                                                     
    DATE_START                                                                                                               
    DATE_END                                                                                                                 
    DAYS                                                                                                                     
    WANT_LOSS;                                                                                                               
  format date_start date_end mmddyy10.;                                                                                      
  set want;                                                                                                                  
  want_loss=coalesce(want,0);                                                                                                
  if want_loss< -32;                                                                                                         
  date_start=dte-30;                                                                                                         
  date_end=dte;                                                                                                              
  days=date_end-date_start;                                                                                                  
  keep                                                                                                                       
    DATE_START                                                                                                               
    DATE_END                                                                                                                 
    DAYS                                                                                                                     
    WANT_LOSS;                                                                                                               
run;quit;                                                                                                                    
                                                                                                                             
                                                                                                                             
>library(haven);                                                                                                             
>library(dplyr);                                                                                                             
>library(SASxport);                                                                                                          
>library(data.table);                                                                                                        
>library(RollingWindow);                                                                                                     
>have<-as.data.table(read_sas("d:/sd1/havfil.sas7bdat"));                                                                    
>head(have);have[,want:= RollingSum(DIF,window = 30), by=ID];                                                                
>write.xport(have,file="d:/xpt/have.xpt");                                                                                   
                                                                                                                             
    ID        DTE DIF                                                                                                        
1:  1 2019-03-20   0                                                                                                         
2:  1 2019-03-21   0                                                                                                         
3:  1 2019-03-22   0                                                                                                         
4:  1 2019-03-23   0                                                                                                         
5:  1 2019-03-24   0                                                                                                         
6:  1 2019-03-25   0                                                                                                         
>                                                                                                                            
NOTE: 10 lines were written to file PRINT.                                                                                   
Stderr output:                                                                                                               
                                                                                                                             
2405  libname xpt xport "d:/xpt/have.xpt";                                                                                   
NOTE: Libref XPT was successfully assigned as follows:                                                                       
      Engine:        XPORT                                                                                                   
      Physical Name: d:\xpt\have.xpt                                                                                         
2406  data want;                                                                                                             
2407    set xpt.have;                                                                                                        
2408  run;                                                                                                                   
                                                                                                                             
NOTE: There were 3300 observations read from the data set XPT.HAVE.                                                          
NOTE: The data set WORK.WANT has 3300 observations and 4 variables.                                                          
NOTE: DATA statement used (Total process time):                                                                              
      real time           0.01 seconds                                                                                       
      cpu time            0.00 seconds                                                                                       
                                                                                                                             
                                                                                                                             
2408!     quit;                                                                                                              
2409  libname xpt clear;                                                                                                     
NOTE: Libref XPT has been deassigned.                                                                                        
2410  data wantWin;                                                                                                          
2411    retain                                                                                                               
2412      DATE_START                                                                                                         
2413      DATE_END                                                                                                           
2414      DAYS                                                                                                               
2415      WANT_LOSS;                                                                                                         
2416    format date_start date_end mmddyy10.;                                                                                
2417    set want;                                                                                                            
2418    want_loss=coalesce(want,0);                                                                                          
2419    if want_loss< -32;                                                                                                   
2420    date_start=dte-30;                                                                                                   
2421    date_end=dte;                                                                                                        
2422    days=date_end-date_start;                                                                                            
2423    keep                                                                                                                 
2424      DATE_START                                                                                                         
2425      DATE_END                                                                                                           
2426      DAYS                                                                                                               
2427      WANT_LOSS;                                                                                                         
2428  run;                                                                                                                   
                                                                                                                             
NOTE: There were 3300 observations read from the data set WORK.WANT.                                                         
NOTE: The data set WORK.WANTWIN has 54 observations and 4 variables.                                                         
NOTE: DATA statement used (Total process time):                                                                              
      real time           0.06 seconds                                                                                       
      cpu time            0.04 seconds                                                                                       
                                                                                                                             
