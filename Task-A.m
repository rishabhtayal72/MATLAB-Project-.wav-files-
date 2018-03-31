%SSC PROJECT
%TOPIC : A - SIGNAL MATCHING
%CREATED BY: RISHABH TAYAL, VAIBHAV MAHESHWARI, AKSHAT AIRAN, RIDDHI GUPTA
%CREATED ON : 23 FEB,2017

clc;
clear all;
close all;

%READING ALL THE AUDIO FILES
[drums,fs] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\drums.wav');
[guitar,fs1] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\guitar.wav');
[bass,fs2] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\bass.wav');

t1 = drums(fs*10 : fs*20);      %Extracting drum from 10th sec to 20th sec.
t10 = drums(fs*10 : fs*20);     %Extracting drum from 10th sec to 20th sec.

t2 = guitar(fs1*10 : fs1*20);   %Extracting drum from 10th sec to 20th sec.
t3 = bass(fs2*10 : fs2*20);     %Extracting drum from 10th sec to 20th sec.
t4 = t1 + t2 + t3;              %mixing all 3 signals
t5 = t1 + t2 + 3*t3;            %Increase the bass part to 3 times and adding.

figure(1);
plot(t10)
ramp = 0 : 1/(fs*10) : 1;       %Ramp fuction to increase the amplitude of the drums
n = length(ramp);
ramp = transpose(ramp);
t10(1:n) = t10(1:n).*ramp;
hold on 
plot(t10, 'r');
t7 = t10 + t2 + t3;             


TL = t1 + t3;
TR = t2;
t8 = [TL, TR];                  %creating stereo audio signal   

t9 = [t4*0.8 , t4*0.1];         %creating 2nd stereo audio signal

flag = true;
while flag
    fprintf('Press 1 to play drums\n');
    fprintf('Press 2 to play guitar\n');
    fprintf('Press 3 to play bass\n');
    fprintf('Press 4 to play all 3 cosecutively\n');
    fprintf('Press 5 to increase bass part of signal to 3 times and then play the signal\n');
    fprintf('Press 6 to gradually increase the amplitude of drums\n');
    fprintf('Press 7 to play the stereo audio signal\n');
    fprintf('Press 8 to play diffrent stereo audio signal\n');
    fprintf('Press 0 to exit\n');
    
    x = input('');
    if x == 1
        sound(t1,fs);   %drums
    elseif x==2 
         sound(t2,fs1); %guitar
    elseif x==3
        sound(t3,fs2);  %bass
    elseif x==4
        sound(t4,fs);   %drums+guitar+bass
    elseif x==5         
        sound(t5,fs);   %drums+guitar+3*bass
    elseif x==6
        sound(t7,fs);   %gradually increase amplitude of drums
    elseif x==7
        sound(t8,fs);   %stereo audio signal
    elseif x==8
        sound(t9,fs);   %different stereo audio signal
    elseif x==0
        flag = false;   %exit
    end 
end 
