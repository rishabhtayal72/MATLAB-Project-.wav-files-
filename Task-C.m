%SSC PROJECT
%TOPIC : C - SIGNAL MATCHING
%CREATED BY: AKSHAT AIRAN, VAIBHAV MAHESHWARI, RISHABH TAYAL, RIDDHI GUPTA
%CREATED ON : 17 FEB,2017

clc;
clear all;
close all;
disp('SSC Project');
%READING ALL THE AUDIO FILES
[y1,fs1] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\exp_C\one.wav');
[y2,fs2] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\exp_C\two.wav');
[y3 fs3] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\exp_C\three.wav');
[y4 fs4] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\exp_C\four.wav');
[y5 fs5] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\exp_C\five.wav');
[t1 fst] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\exp_C\test.wav');
[t2 fst2] = audioread('C:\ProgramData\BlueStacks\UserData\Library\My Apps\Desktop\project_SSC\exp_C\test2.wav');
%PLOTTING ALL THE AUDIO SUGNALS
subplot(3,3,1);
plot(y1);
title('one.wav');
subplot(3,3,2);
plot(y2);
title('two.wav');
subplot(3,3,3);
plot(y3);
title('three.wav');
subplot(3,3,4);
plot(y4);
title('four.wav');
subplot(3,3,5);
plot(y5);
title('five.wav');
subplot(3,3,6);
plot(t1);
title('test.wav');
subplot(3,3,7);
plot(t2);
title('test2.wav');


%TAKING THE INPUT FROM THE USER FOR NORMALIZED CROSS-CORRELATION
input1=input('Enter y1(one.wav), y2(two.wav) ,y3(three.wav) ,y4(four.wav) or y5(five.wav)');
input2=input('enter the test case number t1 or t2');
%NORMALIZED CROSS-CORRELATION FUNCTION
 if size(input1) > size(input2)
    c = normxcorr2(input2,input1);
 else
    c = normxcorr2(input1,input2);
 end   
 
 %3D PLOT OF THE NORMALIZED CROSS-CORRELATION 
 hSurface = surf(c);
 set(hSurface,'FaceColor',[1 0 0],'FaceAlpha',0.5);
 figure;
 [y x] = find(c==max(c(:))); %FINDING THE INDEX OF MAX VALUE IN MATRIX C
 disp(c(y,x));
 m=c(y,x);%MAX VALUE OF THE NORMALIZED CROSS-CORRELATION FUNCTION
 
 %COMPARING IF THE MAX VALUE IS LESS THAN OR EQUAL TO 1
 if abs(m-1) < 1e4*eps(min(abs(m),abs(1)))
     img = imread('right.jpg');
     imshow(img);
 else
    img = imread('wrong.jpg');
    imshow(img);
 end    
    