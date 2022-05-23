function [time,amp] = plotter_2(BF, BDC, TF, TDC, length)
%PLOTTER Summary of this function goes here
%   Detailed explanation goes here

% clc
tick_time = 1:(length*100);
time = tick_time/100000;
amp = zeros(1,length*100);
intensity = zeros(1,length*100);
texture = zeros(1,length*100);
Beat = zeros(1,length*100);
state = zeros(1,length*100);

PuF = 2000;
%
MaxNP = round (TF/BF);
NP = round(TF/BF*BDC/100);
%
MaxNs = round (PuF/TF);
NS = ceil(MaxNs*TDC/100);
IPD = MaxNs-NS;
%
NB = ceil(BF/2);
MaxNx = round(PuF/BF);
IBD= MaxNx - NP*MaxNs;
%
% NB = 3;
% IBD = 0;
% NP = 1;
% IPD = 0;
% NS = 16;
% wp = (IPD + NS);
% wb = IBD + NP*wp;

current_state = 1;
word_counter = 0;
Pack_cntr = 0;
Pack_life = 0;
Bundle_life = 0;
Current_amp = 1;

texture_counter = 1;

intensity(1) = 1; 
texture(1) = 1;
Beat(1) =1;

   for n = 1:length*100
       word_counter = word_counter + 1;
       if((word_counter <= 12))
           amp(n)= Current_amp;
           intensity (n) = 1;
       elseif(( 12 < word_counter) && (word_counter <= 24))
           amp(n)= 0;
           intensity (n) = 0;
       elseif(( 24 < word_counter) && (word_counter <= 36))
           amp(n)= -1*Current_amp;
           intensity (n) = -1;
       elseif(( 36 < word_counter) && (word_counter < 50))
           amp(n) = 0;
           intensity (n) = 0;
       else
           word_counter = 0;
           Pack_cntr = Pack_cntr +1;
           texture_counter = texture_counter + 1;
       end
       
       state(n) = current_state;
            
       if(current_state == 1)
           Beat(n) =1;
           if(Pack_cntr >= round(NS))
               word_counter = 0;
               Pack_cntr = 0;
               Current_amp = 0;
               current_state = 2;
           else
               Current_amp =1;
           end
       elseif(current_state == 2)
           Beat(n) = 1; 
          if(Pack_cntr >= IPD)
            word_counter = 0;
            Pack_cntr = 0;
            Pack_life = Pack_life + 1 ;
            if(Pack_life >= NP)
                Pack_life =0;
                current_state = 3;
            else
                current_state = 1;
            end
          end
       elseif(current_state == 3)
           Beat(n) = 0; 
           if(Pack_cntr >= IBD)
                word_counter = 0;
                Pack_cntr = 0;
                Bundle_life = Bundle_life +1 ;
                if(Bundle_life >= NB)
                    Bundle_life =0;
                    Current_amp = 0;
                    current_state = 4;
                else
                    current_state = 1;
                end
           end
       end
       
       if (texture_counter <= NS)
           texture(n) = 1;
       elseif (texture_counter < MaxNs)
           texture(n) = 0;
       else
           texture(n) = 0;
           texture_counter = 0;
       end
               
   end
end

