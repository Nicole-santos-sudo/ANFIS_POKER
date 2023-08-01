%Input DataBase:

load('dataEdu.mat');
load('dataTrain.mat');
load('dataOutput.mat');

for i = 1
prompt = {'Training the Neural Fuzzy Inference System...'};
title = 'Fuzzy';
answer = inputdlg(prompt,title);
end

%% Asking for number of Stories to be compared
n = input('Insira total histórias a comparar:');
list_summary = string.empty(n,0);
list_sp = double.empty(n,0);
list_vel = double.empty(n,0);
%% Taking input data
for i = 1:n
    prompt = {'Insira Cod. História','Insira Storie Points:','Insira Velocidade:'};
    title = 'Esforço';
    answer = inputdlg(prompt,title);
    summary = answer{1};
    storie = str2double(answer{2});
    velocity = str2double(answer{3});
    
    list_summary(i) = summary;
    list_sp(i) = storie;
    list_vel(i)= velocity;
   
end

%% Opening FIS2 created using Fuzzy Logic Toolbox

fismat = readfis('ANFIS-POKER');
inputdat = transpose(cat(1,list_sp,list_vel));
disp (inputdat);
out = evalfis(inputdat,fismat);
summary = transpose(list_summary);
inputdat2 = cat(2,summary,inputdat,out);
disp (inputdat2);

dataEsforco = [inputdat,out];


%horas_restante = (saida - out);

%List_horas_restante = horas_restante;

