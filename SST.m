function x = SST(A, b)
  % Functia care rezolva un sistem superior triunghiular
  % de forma A * x = b
	[n n] = size(A);
	x = zeros(n,1);
	for i = n:-1:1
    x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)) / A(i,i);
	endfor
endfunction