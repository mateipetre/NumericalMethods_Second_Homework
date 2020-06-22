function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A
  % folosind factorizari Gram-Schmidt
	% Folosesc Gram_Schmidt o data pentru a obtine matricele Q si R
  % Q - matrice ortogonala, R - matrice triunghiulara
  % A = Q * R
  % Rezolv n sisteme superior triunghiulare de forma:
  % R * bk = qk
  % bk = coloanele din B, k = 1:n
  % qk = liniile din Q, k = 1:n
  % B = inversa lui A
  [n n] = size(A); % dimensiunea matricei
  Q = zeros(n);
  R = zeros(n);
  for k = 1:n
    R(k,k) = norm(A(:,k));
    Q(:,k) = A(:,k) / R(k,k);
    R(k,k+1:n) = Q(:,k)' * A(:,k+1:n);
    A(:,k+1:n) = A(:,k+1:n) - Q(:,k) * R(k,k+1:n);
  endfor
  for k = 1:n
    B(:,k) = SST(R, Q(k,:));
  endfor
endfunction