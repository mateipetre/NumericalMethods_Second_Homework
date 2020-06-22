function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2
  % si care calculeaza valoarea functiei membru in fiecare punct din x.
	% Stim ca 0 <= x(i) <= 1 ; i = 1:n
  N = size(x,1); % numarul de pagini
  y = zeros(N,1); % vectorul gradelor de apartenenta
  % valorile a si b pt care functia membru e continua
  a = 1 / (val2 - val1); 
  b = - val1 / (val2 - val1);
  % definitia functiei membru = gradul de apartenenta
  for i = 1:N
    if ((x(i) >= val1) && (x(i) <= val2))
      y(i) = a * x(i) + b;
    else
      if ((x(i) > val2) && (x(i) <= 1))
        y(i) = 1;
      endif
    endif
  endfor
endfunction