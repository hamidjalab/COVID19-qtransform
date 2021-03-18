clc;
clear;
close all;
%%%%%%%%%%%% with enhancement %%%%%%%%%%%%%%%%
 load  CTFHTN% Healthy image features 
  load  CTFHTAB% COVID-19 image Features
  
   

L1=length(CTFHTN);%
L2=length(CTFHTAB);%
 %%%% add targets %%%%%%%%%%%%%%%%%
  T1(1:L1)=0;%Healty
  T2(1:L2)=1;%Covid
 T=[T1';T2'];% Targets
%
ALLF=[CTFHTN;CTFHTAB];%
 ALLFTCT=[ALLF,T];% Final features for classification
save('ALLFTCT','ALLFTCT')
