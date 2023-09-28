## Camera matrix

1. Napisati funkciju ParametriKamere(T) koja za datu 3x4 matricu kamere T odredjuje parametre kamere, redom K,A,C (prvu matricu normirati po k33). Koristiti neku biblioteku koja ima QR dekompoziciju matrice. 

2. Napisati funkciju CameraDLP(originali, projekcije) koja za datih n (n>=6) tačaka prostora i n njihovih projekcija u piksel koordinatama, odredjuje 3x4 matricu projektovanja.

3. Postaviti 3D scenu kao na slici sa proizvoljnim objektima. Izaberete najmanje 6  tacaka (vodite racuna da ne budu je jednoj ravni), odredite im 3D koordinate (mereci udaljenost od zidova i stola -  vidi prilog) i odredite pixel koordinate projekcija.  Koristeci funkciju pod 2. odredite matricu kamere T, a zatim koristeci funkciju pod 1. odrediti parametre kamere K, kao i polozaj kamere (C i A).
