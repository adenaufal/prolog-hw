/* This program, known as 'Genap and Ganjil', will define the number is odd or even, based on your input. */
	
ganjilgenap :-
	nl,
	write('Masukkan nilai: '),read(N),
	Result is N mod 2,
	Result is 0,
	write('Nilai genap');
	write('Nilai ganjil').
	
/* Genap and Ganjil are also set of traffic rules which applied in Jakarta right now. The rules are:

1) odd-number car plates can enter roads on odd dates,
2) even-number car plates can enter roads on even dates.

There are some exceptions, i.e. other vehicles like motorcycles etc aren't included in these rules. */

platgenapganjil(X,Y) :-
	0 is mod(X, 2),
	0 is mod(Y, 2),
	write("Plat genap dapat melewati jalan tertentu di tanggal genap");
	1 is mod(X, 2),
	1 is mod(Y, 2),
	write("Plat ganjil dapat melewati jalan tertentu di tanggal ganjil");
	1 is mod(X, 2),
	0 is mod(Y, 2),
	write("Plat ganjil tidak dapat melewati jalan tertentu di tanggal genap");
	0 is mod(X, 2),
	1 is mod(Y, 2),
	write("Plat genap tidak dapat melewati jalan tertentu di tanggal ganjil").
