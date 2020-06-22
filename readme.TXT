MATEI Alexandru-Petrut
323AC
		=============  In spatele unui motor de cautare =============
				======== Tema 2 - MN ========


	In cadrul temei am implementat 6 functii, dupa cum urmeaza:

	- functia Iterative care calculeaza vectorul de PageRank-uri ale paginilor
	analizate intr-un mod iterativ, astfel:
		- deschide fisierul de intrare cu numele din antet
		- salveaza prima linie ca fiind numarul N de pagini ca un nr. real
		- parcurge fisierul pe N linii, adica graful dat prin listele de 
		adiacenta (
		- salveaza fiecare linie ca un vector de numere reale
		(fiecare pagina, numarul de pagini continute de fiecare, paginile continute)
		- parcurge toata lista de pagini continute de pagina curenta si se
		asigura ca nu e tot ea, si creeaza matricea de adiacenta, marcand legatura
		dintre o pagina si o pagina continuta de aceasta cu 1, altfel 0
		- de asemenea, nu ia in calcul link-ul catre fiecare pagina insasi pentru
		calculul inversei matricei diagonale K din algoritmul dat la sursa [1]
		- cum K contine pe diagonala gradele exterioare ale nodurilor grafului,
		(paginilor) si in rest 0 (fiind matrice diagonala), functia calculeaza
		inv_K inversand elementele de pe diagonala
		- inchide fisierul de intrare
		- calculeaza matricea M dupa formula data
		- seteaza un vector coloana initial al PageRank-urilor, fiecare pagina avand
		PageRank-ul de 1/N (la momentul t = 0)
		- calculez vectorul de PageRank-uri pana ce diferenta absoluta, dintre 
		vectorul calculat la momentul t+1 de timp si vector calculat la momentul
		anterior t, este mai mica decat o eroare eps, precizata la apel
		- salvez de fiecare data in R_anterior vechiul vector de PageRank-uri
		- functia intoarce vectorul de dinainte de ultima iteratie pt ca 
		convergenta se atinge inainte cu un pas

	- functia Algebraic care calculeaza vectorul de PageRank-uri ale paginilor
	analizate intr-un mod algebric, astfel:
		- deschide fisierul de intrare cu numele din antet
		- salveaza prima linie ca fiind numarul N de pagini ca un nr. real
		- parcurge fisierul pe N linii, adica graful dat prin listele de 
		adiacenta (
		- salveaza fiecare linie ca un vector de numere reale
		(fiecare pagina, numarul de pagini continute de fiecare, paginile continute)
		- parcurge toata lista de pagini continute de pagina curenta si se
		asigura ca nu e tot ea, si creeaza matricea de adiacenta, marcand legatura
		dintre o pagina si o pagina continuta de aceasta cu 1, altfel 0
		- de asemenea, nu ia in calcul link-ul catre fiecare pagina insasi pentru
		calculul inversei matricei diagonale K din algoritmul dat la sursa [1]
		- cum K contine pe diagonala gradele exterioare ale nodurilor grafului,
		(paginilor) si in rest 0 (fiind matrice diagonala), functia calculeaza
		inv_K inversand elementele de pe diagonala
		- inchide fisierul de intrare
		- calculeaza matricea M cu formula data
		- calculeaza matricea dM cu formula data
		- calculeaza inversa lui dM prin intermediul functiei PR_Inv
		- intoarce vectorul R calculat dupa formula algebrica

	- functia PR_Inv care calculeaza inversa matricii A folosind factorizari Gram- Schmidt,
	astfel:
		- foloseste Gram-Schmidt o data pentru a obtine o factorizare QR
		- se obtin matricele Q - ortogonala si R- triunghiulara, astfel incat A = Q * R
		- rezolva n sisteme, unde n e nr. de linii/coloane ale matricii A, sisteme
		care sunt superior triunghiulare, pe baza matricelor R si Q
		- sistemele sunt rezolvate la apelul functiei SST 

	- functia SST care rezolva un sistem superior triunghiular, plecand de la ecuatia 
	cu cei mai multi coeficienti de 0, adica cea construita prin inmultirea cu ultima
	linie (a n-a) din matricea A asociata sistemului si ajungand la ecuatia reprezentata
	de prima linie a matricii A

	- functia Apartenenta care calculeaza gradul de apartenenta pentru fiecare PageRank
	asociat fiecarei pagini web, adica valoarea functiei membru in fiecare punct din 	
	vectorul de intrare x de PageRank-uri, acest lucru facandu-l astfel:
		- salveaza numarul de pagini
		- calculeaza valorile parametrilor a si b pentru care functia de apartenenta
		e continua 
		- afla gradul de apartenenta, conform fiecarei ramuri a functiei date in
		cerinta, fiecarui element din x, rezultand vectorul y
	
	- functia PageRank care calculeaza indicii PageRank pt cele 3 cerinte si creeaza
	fisierul de iesire in care apar acesti indici si un clasament referitor la
	importanta paginii in multimea paginilor importante, astfel:
		- creeaza fisierul de iesire 
		- deschide fisierele de intrare si iesire 
		- salveaza, prin apel la Iterative, vectorul de PageRank-uri aflate iterativ R1
		- salveaza, prin apel la Algebraic, vectorul de PageRank-uri aflate algebric R2
		- retine numarul de pagini analizate si il afiseaza in prima linie din fisier
		- afiseaza pe N linii elementele din vectorul R1 salvat
		- afiseaza un rand gol
		- afiseaza pe N linii elementele din vectorul R2 salvat
		- afiseaza iar un rand gol
		- sorteaza descrescator, prin intermediul functiei predefinite Octave - sort,
		vectorul R2 si il salveaza
		- citeste din fisier val1 si val2 ca nr. reale
		- afiseaza clasamentul astfel, pt fiecare pagina in parte:
			- locul obtinut de pagina in ordine crescatoare pe coloana 1
			- numarul paginii care a obtinut acel loc pe coloana 2
			- gradul de apartenenta al acelei pagini
		- inchide fisierele

	FEEDBACK: mi-a placut mult tema pentru ca a avut un caracter practic si asa a fost
                  mai usor de inteles


		

