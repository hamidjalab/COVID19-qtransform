clc;
clear;
close all;

%%%%%%%%%% healthy-scans %%%%%%%%%%%%%%%%%%%%%%
 pathname1 ='C:\Users\healthy-scans\';%
 dirlist1 = dir( [pathname1 '*.bmp'] );%

%  %%%%%%%%%%%%%***********************%%%%%%
 L=length(dirlist1);
m=1;%histogram spread
w=1;%histogram flatness
 for v =1:L

   Im1 = imread([pathname1, dirlist1(v).name]);

Name1=dirlist1(v).name;%1

    
    [rowSize colSize D]=size(Im1); 
    
    if D == 3
           IM1 = (rgb2gray(Im1));    % changing to double ; for no reason 
        
        else
            IM1=(Im1);
    end
%        imshow(IM1), title('input1');

      
   %%%%*** Enhancement Adaptive histogram equalization” (AHE) technique***%%
   Imout=adapthisteq(IM1);
n=16;     
f=n*n;
%************* split image**********
[rr cc ]=size(Imout); 
W1=cc/n;% 
W2=rr/n;%
 X1=zeros(n,n);
for j=1:n
    for k=1:n
        for J=1:W1
            for K=1:W2
                H(j,k,J,K)=Imout((J-1)*4+j,(K-1)*4+k);
                 
            end
        end
    end
end



mm=1;
       for i=1:W1
            for j=1:W2% 
              FH(mm)={H(:,:,i,j)};
              FFH=FH{1,mm};
              FFHH=round(FFH);
             I=double(FFHH);
             

q=0.5;
                featureVector=qTransforms(I,q)
                  HT{mm}=featureVector;
                    mm=mm+1;
            end
       end     
       
ALL=cell2mat(HT');%

  Autm1=mean( ALL); %mean
  Autv1=std( ALL); % std
 Aus1 = skewness( ALL); %
 Auk1 = kurtosis( ALL); %
  
 out1{v} =[Autm1,Autv1,Aus1,Auk1];
 end
CTFHTN=cell2mat(out1');
%*****************************************
 save('CTFHTN','CTFHTN');%Features for healthy-scans

 
 
%%%%covid19-scans %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathname2 ='C:\Users\covid19-scans\';
 dirlist2 = dir( [pathname2 '*.jpg'] );%118
 
 L=length(dirlist2);
m=1;%
w=1;%
 for v =1:L

  Im2 = imread([pathname2, dirlist2(v).name]);

Name2=dirlist2(v).name;%2
 
      
    [rowSize colSize D]=size(Im2); 
    
    if D == 3
           IM2 = (rgb2gray(Im2));    % changing to double ; for no reason 
        
        else
            IM2=(Im2);
    end

    [rowSize colSize D]=size(Im2); 
    
    if D == 3
           IM2 = (rgb2gray(Im2));    % changing to double ; for no reason 
        
        else
            IM2=(Im2);
    end

      
    
    %%%%*** Enhancement Adaptive histogram equalization” (AHE) technique***%%
   Imout=adapthisteq(IM2);
n=16;     
f=n*n;
%************* split image**********
[rr cc ]=size(Imout); 
W1=cc/n;% 
W2=rr/n;%
 X1=zeros(n,n);
for j=1:n
    for k=1:n
        for J=1:W1
            for K=1:W2
                H(j,k,J,K)=Imout((J-1)*4+j,(K-1)*4+k);
                
            end
        end
    end
end



mm=1;
       for i=1:W1
            for j=1:W2% 
              FH(mm)={H(:,:,i,j)};
              FFH=FH{1,mm};
              FFHH=round(FFH);
            I=double(FFHH);
             

q=0.5;
                featureVector=qTransforms(I,q)
                  HT{mm}=featureVector;
                    mm=mm+1;
            end
       end     
       
ALL=cell2mat(HT');%

  Autm1=mean( ALL(:,1)); %mean
  Autv1=std( ALL(:,1)); % std
 Aus1 = skewness( ALL(:,1)); %
 Auk1 = kurtosis( ALL(:,1)); %
 
  out1{v} =[Autm1,Autv1,Aus1,Auk1];
 end
CTFHTAB=cell2mat(out1');
%*****************************************
 save('CTFHTAB','CTFHTAB');%COVID-19 Scans Features
