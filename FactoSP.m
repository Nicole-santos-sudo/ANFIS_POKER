%% Asking factors to estimate Stories
n = input('Insira o total de histórias a serem estimadas:');
list_nome = string.empty(n,0);
list_risc = double.empty(n,0);
list_dep = double.empty(n,0);
list_inc = double.empty(n,0);
list_com = double.empty(n,0);
%% Taking input data
for i = 1:n
    prompt = {'Insira nome da história:','Insira Risco:','Insira Dependência:','Insira Incerteza:','Insira Complexidade:'};
    title = 'Estimando as histórias';
    answer = inputdlg(prompt,title);
    nome = answer{1};
    risc = str2double(answer{2});
    dep = str2double(answer{3});
    inc = str2double(answer{4});
    comp = str2double(answer{5});

    list_nome(i) = nome;
    list_risc(i) = risc;
    list_dep(i)= dep;
    list_inc(i)= inc; 
    list_com(i)= comp; 
   
end
%% Opening FIS created using Fuzzy Logic Toolbox
fismat = readfis('FactoSP');
inputdat = transpose(cat(1,list_risc,list_dep,list_inc,list_com));
disp (inputdat);
out = evalfis(inputdat,fismat);
summary = transpose(list_nome);
inputdat2 = cat(2,summary,inputdat,out);
disp (inputdat2);

