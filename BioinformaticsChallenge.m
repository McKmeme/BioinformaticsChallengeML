%McKeon Laws
%Bioinformatics 430 
%Challenge E+
%This code will: 
%1. Accept a fasta file with multiple proteins
%2. Find hydropathy at each position 
%3. Create a plots of hydropathy by position for each protein 

clear
clc
%Standard start of a code to ensure no saved variables from previous runs
%interfere with this run and the command window is cleared  

%%1. Accept a fasta file with a single protein
%Ask User for the name of their FASTA file and save as a matrix
%In MATLAB the file must be in the same folder as the code
prompt = "What is the name of your FASTA Sequence? \nplease submit as a txt file and include .txt \n" ; 
filename = input(prompt,"s"); 
%read file and obtain each line in a matrix
file = readcell(filename,'TextType','char');
%Convert the second line (sequence) to a single matrix
h = height(file);
%To find multiple proteins look for lines starting with carrot, use that as
%the seq name and current line plus one for the sequence 
for j=1:1:h
    A = char(file(j,1));
    startmatch = ~isempty(regexp(A,"^>"));
    if startmatch
cellseq = file(j+1,1); 
%Convert the sequence to an array 
seq = cellseq{1};
%Find title of sequence by removing the carrot 
toprow = string(file(j,:));
%use a regular epxression to remove the carrot and add the second column
seqtitle = regexp(toprow(1,1),"[^>].+",'match')+toprow(2:2);
%Fasta file loaded, 1. complete 

%%2. Find hydropathy at each position 
%Find length of the sequence 
l = length(seq);
%Create empty vector, the will increase program speed 
hyd = zeros(1,l);
%Use i as the index, this notation starts the loop at 1, moves forward by 1
%until it reaches l
for i= 1:1:l
%For each possible instance an if/elseif/else statment exists 
%The hydropathy value will be complied in the matrix hyd
    if seq(1,i) == "R" 
        hyd(1,i) = -2.5;
        %Reapeat for each amino acid and if an incorrect letter used 
    elseif seq(1,i) == "D"
        hyd(1,i) = -0.9;
    elseif seq(1,i) == "N"
        hyd(1,i) = -.078;
    elseif seq(1,i) == "H"
        hyd(1,i) = 0.4;
    elseif seq(1,i) == "T"
        hyd(1,i) = -0.05;
    elseif seq(1,i) == "Y"
        hyd(1,i) = 0.26;
    elseif seq(1,i) == "G"
        hyd(1,i) = 0.48;
    elseif seq(1,i) == "M"
        hyd(1,i) = 0.64;
    elseif seq(1,i) == "L"
        hyd(1,i) = 1.1;
    elseif seq(1,i) == "X"
        hyd(1,i) = 0;
    elseif seq(1,i) == "K"
        hyd(1,i) = -1.5;
    elseif seq(1,i) == "Q"
        hyd(1,i) = -0.85;
    elseif seq(1,i) == "E"
        hyd(1,i) = -0.74;
    elseif seq(1,i) == "S"
        hyd(1,i) = -0.18;
    elseif seq(1,i) == "C"
        hyd(1,i) = 0.29;
    elseif seq(1,i) == "A"
        hyd(1,i) = 0.62;
    elseif seq(1,i) == "W"
        hyd(1,i) = 0.81;
    elseif seq(1,i) == "V"
        hyd(1,i) = 1.1;
    elseif seq(1,i) == "I"
        hyd(1,i) = 1.4;
    elseif seq(1,i) == "P"
        hyd(1,i) = 0;
    else
        hyd(1,i) = "undefined";
    end
end
%hyd now contains hydropathy values corresponding to AA position 
%2. is complete 

%3. Create a plot of hydropathy by position
%Create x and y values for the plot 
%x is position, not amino acid species, x goes from 1 to l by 1
x = 1:1:length(hyd);
%y is the hydropathy values, the variable y will be zeros to create the
%middle line 
figure
y = zeros(1,length(hyd));
plot(x,hyd,"blue-",x,y,"black") %x,y,"black"
xlabel("Amino Acid Position")
xlim([1 l])
ylabel("Hydropathy Value")
ylim([-2.7 2.7])
title("Hydropathy Plot of",(seqtitle))
%Hydropathy plot created and its nice and pretty, 3. complete
%The plot is inside of the for loop so that a new one is created for each
%protein. figure is used to output each plot even though its in the loop.
    else 
    end
end