%MRE: sample/starter code for backprojection summation reconstruction
%
%load text files created from your VI. Note: if your VI outputs a
%continuous line, then use the transpose function in Matlab (')where
%necessary to achieve your desired results. Plot the projections.
%Concatenate the projections into the Radon Transform. Take the inverse
%Radon Transform with no filtering (i.e. straight backprojection summation)

clear all;close all;

%load the text files containing your projections that you generated with
%your VI. 
%note #1: if you generated a continuous text line, you will need
%to use the Matlab transpose function (') where necessary. 
%note #2: With this format,you need to have the txt files in the same
%directory from which you are running this code

load SummedEcho_0_v3.xlsx
load SummedEcho_22_5_v3.xlsx
load SummedEcho_45.xlsx
load SummedEcho_67_5.xlsx
load SummedEcho_90.xlsx
load SummedEcho_112_5.xlsx
load SummedEcho_135.xlsx
load SummedEcho_157.xlsx

%plot the projections

figure;
subplot(421);plot(proj0);title('0 degrees');
subplot(422);plot(proj22_5);title('22.5 degrees');
subplot(423);plot(proj45);title('45 degrees');
subplot(424);plot(proj67_5);title('67.5 degrees');
subplot(425);plot(proj90);title('90 degrees');
subplot(426);plot(proj112_5);title('112.5 degrees');
subplot(427);plot(proj135);title('135 degrees');
subplot(428);plot(proj157_5);title('157.5 degrees');

%Concatenate your projections to form a Radon Transform

R=[proj0 proj22_5 proj45 proj67_5 proj90 proj112_5 proj135 proj157_5];

%Take the inverse Radon Transform with no filtering (i.e. backprojection
%summation)

I=iradon(R,0:22.5:157.5,'none');        %if you choose to acquire more 
                                        %projections, this will need to be 
                                         %changed appropriately
                                         
%plot the Radon Transform and the reconstructed image

figure;imagesc(R');colormap(gray);
figure;imagesc(I);colormap(gray);title('Straight Backprojection Summation Recon');


