:- op(600, xfx, langsung_ke).
jakarta langsung_ke bekasi.
jakarta langsung_ke bogor.
bogor langsung_ke bandung.
bogor langsung_ke sukabumi.
bekasi langsung_ke bandung.
bekasi langsung_ke cirebon.
bandung langsung_ke cirebon.
bandung langsung_ke tasikmalaya.
cirebon langsung_ke tasikmalaya.
cirebon langsung_ke tegal.
tegal langsung_ke pekalongan.
pekalongan langsung_ke semarang.
pekalongan langsung_ke yogyakarta.
semarang langsung_ke surakarta.
semarang langsung_ke surabaya.
yogyakarta langsung_ke semarang.
yogyakarta langsung_ke surakarta.
surakarta langsung_ke madiun.
madiun langsung_ke kediri.
madiun langsung_ke surabaya.
kediri langsung_ke malang.
surabaya langsung_ke malang.

:- op(600,xfx,ke).
ke(X,Y):- langsung_ke(X,Y).
ke(X,Y):- langsung_ke(X,Z), ke(Z,Y).

:- op(600,xfx,menuju).