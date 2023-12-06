## SLERP animation

1. Implement function SLerp[$q_1$, $q_2$, $t_m$, $t$] which returns unit quaternion $q$ that represents *SLerp* interpolation between quaternions $q_1$ and $q_2$ im moment $t \in (0, t_m)$.
Quaternions $q_1$ and $q_2$ are unit quaternions, and SLerp[$q_1$, $q_2$, $t_m$, $0$] = $q_1$, SLerp[$q_1$, $q_2$, $t_m$, $t_m$] = q2 holds.

2. Then make animation for given object in two positions.
  - initial position has center in coordinate origin, with orientation given in Euiler angles $\psi = 0, \theta = \frac{\pi}{2}, \phi =0$
  - final position with center translated to some arbitrary point, say $(1, 2, 3)$, and orientation given with Euler angles from the third homework, dependent on student index number.

Make animation which transforms one object into another using linear interpolation between object centers for translation and SLerp interpolation for orientation.