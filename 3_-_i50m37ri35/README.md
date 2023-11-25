## Isometries

Implement and test 6 functions that connect different representations of motion in space.

1.  Euler2A[ $\phi$, $\theta$, $\psi$ ] - returns matrix $A = RZ(\psi)RY(\theta$)RX(\phi)$.

2. AxisAngle[A] - returns unit vector $p = (px; py; pz)$ and angle $\phi \in [0; \pi]$ such that $A = Rp(\phi)$.

3. Rodrigez[p; $\phi$] - returns rotation matrix for rotation around unit vector $p$ for angle $\phi$.

4. A2Euler[A] - for given orthogonal matrix $A$, i.e. $det(A) = 1$, returns Euler angles $\psi, \theta, \phi$ respectively.

5. AxisAngle2Q[p; $\phi$] - returns unit quaternion $q = (x; y; z; w)$ such that $Cq = Rp(\phi)$. Vector $p$ is a unit vector.

6. Q2AxisAngle[q] - returns unit vector $p = (px; py; pz)$ and angle $\phi \in [0; \pi]$ such that the quaternion represents rotation $Rp(\phi)$, i.e. $Cq = Rp(\phi)$.

Testing the first four functions.
Start with 3 Euler angles, based on your student index number.
First, calculate rotation matrix $A$ for the 3 Euler angles.
Follow by representing the matrix as a rotation using angle and axis.
Then, convert the axis and angle back into matrix representation of the rotation using Rodrigues' rotation formula.
Finally, convert back the matrix $A$ to Euler angles.
The resulting angles should be the same as the initial 4 angles.

Testing the final two functions.
Using previosly calculated rotation representation with angle and axis, calculate unit quaternion.
Follow by converting the quaternion back to axis and angle representation of the rotation.
Again, the resulting and initial numbers should be the same.