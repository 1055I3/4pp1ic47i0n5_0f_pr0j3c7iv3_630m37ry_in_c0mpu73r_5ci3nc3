## Isometries

Implementirati i testirati 6 funkcija koji povezuju različito predstavljanje kretanja prostora (vidi ispod)

1. Euler2A[ \phi , \theta , \psi ] - vraca matricu A = RZ( \psi )RY ( \theta )RX( \phi ):

2. AxisAngle[A] - vraca jedinični vektor p = (px; py; pz) i ugao \phi \in [0;    \pi ] tako da A = Rp( \phi ):

3. Rodrigez[p; \phi ] - vraća matricu rotacije oko orjentisanog (jediničnog) vektora p za ugao \phi .

4. A2Euler[A] - za datu ortogonalnu matricu A, det(A) = 1, vraca Ojlerove uglove   \psi , \theta , \phi redom.

5. AxisAngle2Q[p; \phi ] - vraća jednični kvaternion q = (x; y; z;w) tako da Cq = Rp( \phi ). Vektor p je jednični.

6. Q2AxisAngle[q] - vraćajedinični vektor p = (px; py; pz) i ugao  \phi \in  [0; \pi ]  tako da kvaternion predstavlja rotaciju Rp( \phi ), tj. Cq = Rp( \phi )

Prve 4 funkcije: Krenuti od 3 Ojlerova ugla (na osnovu vaseg broja indeksa), za njih izracunati matricu A; nju da predstavi preko ose i ugla, za dobijenu osu i ugao da odredi matricu A  Rodrigezovom fomrulom, a zatim matricu A zapisati preko Ojlerovih uglova. 

Dobijeni uglovi bi trebali biti isti kao uglovi od kojih ste krenuli. 

5\. i 6. funkcija: Na osnovu rotacije preko ose i ugla koju ste prethodno koristili, dobijete jedinicni kvaternion, a zatim ga vratite u (trebalo bi opet istu) osu i ugao.