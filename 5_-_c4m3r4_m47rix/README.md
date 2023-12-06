## Camera matrix

1. Write function *ParametriKamere*(*T*) which for given $3 \times 4$ camera matrix *T* calculates camera parameters *K*, *A*, *C* respectively. The first matrix should be normed by $k_{33}$.
Feel free to use any function at hand for *QR* matrix decomposition.

2. Write function *CameraDLP*(*originali*, *projekcije*)  which for given $n$, $n \ge 6$, points in space and their $n$ respective projections in pixel coordinates calculates $3 \times 4$ projection matrix.

3. Setup 3D scene using arbitrary objects.
Select at least 6 points, paying attention not to select points in the same plane, measure 3D coordinates as distance from the walls and floor and measure pixel coordinates for projections.
Using the just implemented function calculate camera matrix *T*, and then camera parameters *K*, as well as camera position *C* and *A*.
