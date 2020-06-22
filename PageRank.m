function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  out_name = strcat(nume,".out");
  out_file = fopen(out_name,'w');  % deschid fisierul pt a scrie in el 
  in_file = fopen(nume,'r');  % deschid fisierul pt a citi din el 
  % vectorul de pagerank-uri generat de Iterative
  R1 = Iterative(nume, d, eps); 
  % % vectorul de pagerank-uri generat de Algebraic
  R2 = Algebraic(nume, d);
  N = size(R1,1); % nr pagini 
  % afisez numarul de pagini analizate
  fprintf(out_file, "%d\n\n", N);
  % afisez pe cate un rand pagerank-urile calculate iterativ
  for i = 1:N
    fprintf(out_file, "%f\n", R1(i));
  endfor
  % las un rand gol
  fprintf(out_file, "\n");
  % afisez pe cate un rand pagerank-urile calculate algebric
  for i = 1:N
    fprintf(out_file, "%f\n", R2(i));
  endfor
  % las un rand gol
  fprintf(out_file, "\n");
  % sortez descrescator pagerank-urile calculate algebric
  PR1 = sort(R2, "descend");
  % ma deplasez pe liniile fisierului de intrare
  % pana ajung la val1
  for i = 1:N+2
    line = fgetl(in_file); % linia curenta
    i++;
  endfor
  val1 = str2double(line); 
  line = fgetl(in_file); % linia curenta
  val2 = str2double(line);
  % vectorul gradelor de apartenenta ale paginilor 
  % pentru vectorul sortat de pagerank-uri calculate algebric
  u = Apartenenta(PR1, val1, val2);
  % afisez in fisierul de iesire datele
  % sub forma unui clasament al paginilor
  % i = locul obtinut de pagina in clasament
  % j = numarul paginii care a obtinut locul i
  % u(i) = gradul de apartenenta a acestei pagini 
  for i = 1:N
    for j = 1:N
      if (R2(j) == PR1(i))
        fprintf(out_file, "%d %d %f\n", i, j, u(i));
        j = N+1; % ma opresc pt ca pot fi mai multe valori identice
      endif
    endfor
  endfor
  % inchid fisierele
  fclose(in_file);
  fclose(out_file);
endfunction