function [R] = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind 
  % varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator
  % sa continue navigarea la o pagina urmatoare.
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
  dM = eye(N,N) - d * M;
  inv_dM = PR_Inv(dM); % calculez inversa cu PR_Inv
  R = inv_dM * (1 - d) / N * ones(N,1);
endfunction