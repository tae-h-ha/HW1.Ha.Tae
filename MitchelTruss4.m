% Static force analysis of 2D Mitchel Truss order 4 (Fig 4.6 of Skelton & de Oliviera 2009)
clear; clf; figure(1);

% Free [Q=Q_(dim x q)] and fixed [Q=Q_(dim x q)] node locations
phi = pi/16; beta = pi/6;
a = sin(beta) / sin(beta + phi);
r = 2;

Q(:,1) = [r; 0];
Q(:,2) = [r*a * cos(phi); r*a * sin(phi)];
Q(:,3) = [r*a * cos(phi); r*a * -sin(phi)];
Q(:,4) = [r*a^2 * cos(2*phi); r*a^2 * sin(2*phi)];
Q(:,5) = [r*a^2 * cos(2*phi); r*a^2 * -sin(2*phi)];
Q(:,6) = [r*a^3 * cos(3*phi); r*a^3 * sin(3*phi)];
Q(:,7) = [r*a^3 * cos(3*phi); r*a^3 * -sin(3*phi)];

Q(:,8) = [r*a^2 * cos(0*phi); r*a^2 * sin(0*phi)];
Q(:,9) = [r*a^3 * cos(1*phi); r*a^3 * sin(1*phi)];
Q(:,10) = [r*a^3 * cos(1*phi); r*a^3 * -sin(1*phi)];

P(:,1) = [r*a^4 * cos(4*phi); r*a^4 * sin(4*phi)];
P(:,2) = [r*a^4 * cos(4*phi); r*a^4 * -sin(4*phi)];
P(:,3) = [r*a^4 * cos(2*phi); r*a^4 * sin(2*phi)];
P(:,4) = [r*a^4 * cos(2*phi); r*a^4 * -sin(2*phi)];
P(:,5) = [r*a^4 * cos(0*phi); r*a^4 * -sin(0*phi)];

[dim,q]=size(Q); p=size(P,2); n=q+p; 

% Connectivity matrix
C(  1,1)=1; C(  1,2)=-1;       % bars 
C(  2,1)=1; C(  2,3)=-1;    
C(  3,2)=1; C(  3,4)=-1;   
C(  4,2)=1; C(  4,8)=-1; 
C(  5,3)=1; C(  5,5)=-1;    
C(  6,3)=1; C(  6,8)=-1;   
C(  7,8)=1; C(  7,9)=-1; 
C(  8,8)=1; C(  8,10)=-1;    
C(  9,4)=1; C(  9,6)=-1;   
C(  10,4)=1; C(  10,9)=-1; 
C(  11,5)=1; C(  11,7)=-1;    
C(  12,5)=1; C(  12,10)=-1;   
C(  13,9)=1; C(  13,13)=-1; 
C(  14,9)=1; C(  14,15)=-1; 
C(  15,10)=1; C(  15,14)=-1;    
C(  16,10)=1; C(  16,15)=-1;   
C(  17,6)=1; C(  17,11)=-1; 
C(  18,6)=1; C(  18,13)=-1;    
C(  19,7)=1; C(  19,12)=-1;   
C(  20,7)=1; C(  20,14)=-1; 
b=20;                                           
s=0; m=b+s;

% Applied external force U=U_(dim x q)
U(1:dim,1:10)=0; U(2,1)=-0.1;

% Solve for the forces at equilibrium, and plot
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,2.0); grid on;

% end script TBar
