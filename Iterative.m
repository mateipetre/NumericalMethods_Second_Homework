function [R] = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator
  % sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  file = fopen(nume, 'r');  % deschid fisierul pt a citi din el 
  first_line = fgetl(file); 
  N = str2double(first_line); % numarul de pagini
  A = zeros(N,N); % matricea de adiacenta
  i = 1;
  % parcurg fisierul linie cu linie
  % cat timp contine listele de adiacenta
  inv_K = zeros(N,N); % inversa matricei diagonale
  while (i <= N) 
    line = fgetl(file); % linia curenta
    % pun intr-un vector valorile de pe linie
    v = sscanf(line, "%f"); 
    % legatura intre pagina si celelalte pagini
    % catre care link-eaza
    for j = 1:v(2)
      if (v(1) != v(2+j))
        A(v(1),v(2+j)) = 1;
      else
        v(2)--; % nu iau in calcul link-ul catre ea insasi
      endif
    endfor 
    inv_K(i,i) = 1 / v(2); % contine pe diagonala gradele exterioare
    i++;
  endwhile
  fclose(file); % inchid fisierul de intrare
  M = (inv_K * A)'; 
  R_anterior(1:N) = 1 / N; % PageRank-urile la t = 0
  R_anterior = R_anterior'; 
  ok = 0; % nu s-a atins convergenta
  while (ok == 0)
    R = d * M * R_anterior + (1 - d) / N * ones(N,1);
    if ((abs(R - R_anterior) < eps) == ones(N,1))
      ok = 1; % s-a atins convergenta
    else
      %urmatoarea iteratie va lucra cu noul vector de pagerank-uri
      R_anterior = R; 
    endif
  endwhile
  % se face o iteratie in plus dupa convergenta
  R = R_anterior;
endfunction