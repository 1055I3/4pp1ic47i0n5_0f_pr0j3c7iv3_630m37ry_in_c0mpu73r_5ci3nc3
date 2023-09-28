## SLERP animation

1. Implementirati funkciju slerp[q1, q2, tm, t] - vraća  jedinični kvaternion q koji predstavlja SLerp interpolaciju izmedju kvaterniona q1 i q2, u trenutku t ∈ (0, tm). Kvaternioni q1, q2 su jednični (važi slerp[q1, q2, tm, 0] = q1, slerp[q1, q2, tm, tm] = q2.) 

2. Zatim napraviti animaciju koja radi sledeće: zadaje objekat (po vašem izboru) u dve položaja 
  - pocetni polozaj sa centrom u koordinatnom pocetku, orjentacija zadata Ojlerovim uglovima  $\psi = 0, \theta = \frac{\pi}{2}, \phi =0$
  - krajnji polozaj sa centrom transliranim u neku tacku (recimo (1,2,3)), orjentacija zadata Ojlerovim uglovima iz treceg domaceg (zavise od broja indeksa)

Zatim pravite animaciju koja prevodi jedna objekat u drugi (linearno interpolira translaciju izmedju centara objekata, a Slerp interpolira njihovu orjentaciju). Koristiti programski jezik po vasem izboru.