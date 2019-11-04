% Static force analysis of nonminimal prism with 4 bars (Fig 3.43 of Skelton & de Oliviera 2009)
clear; clf; figure(1);

% Free [Q=Q_(dim x q)] and fixed [Q=Q_(dim x q)] node locations
% Q(:,1)=[0; 0; -0.5];
% Q(:,2)=[0; 0; 0.5];
Q(:,1)=[0.5 * sin(0*pi/3); 0.5 * cos(0*pi/3);      0];
Q(:,2)=[0.5 * sin(1*pi/3); 0.5 * cos(1*pi/3);      0];
Q(:,3)=[0.5 * sin(2*pi/3); 0.5 * cos(2*pi/3);      0];
Q(:,4)=[0.5 * sin(3*pi/3); 0.5 * cos(3*pi/3);      0];
Q(:,5)=[0.5 * sin(4*pi/3); 0.5 * cos(4*pi/3);      0];
Q(:,6)=[0.5 * sin(5*pi/3); 0.5 * cos(5*pi/3);      0];
P(:,1)=[0; 0; -0.5];
P(:,2)=[0; 0; 0.5];
[dim,q]=size(Q); p=size(P,2); n=q+p; 

% Connectivity matrix
C(  1,7)=1; C(  1,8)=-1;       % bars 
C(  2,1)=1; C(  2,4)=-1;
C(  3,2)=1; C(  3,5)=-1;
C(  4,3)=1; C(  4,6)=-1; b=4;
C(b+1,7)=1; C(b+1,1)=-1;       % strings 
C(b+2,7)=1; C(b+2,2)=-1;    
C(b+3,7)=1; C(b+3,3)=-1;    
C(b+4,7)=1; C(b+4,4)=-1;    
C(b+5,7)=1; C(b+5,5)=-1;    
C(b+6,7)=1; C(b+6,6)=-1;    
C(b+7,8)=1; C(b+7,1)=-1;    
C(b+8,8)=1; C(b+8,2)=-1;    
C(b+9,8)=1; C(b+9,3)=-1;  
C(b+10,8)=1; C(b+10,4)=-1;  
C(b+11,8)=1; C(b+11,5)=-1;  
C(b+12,8)=1; C(b+12,6)=-1;  
C(b+13,1)=1; C(b+13,2)=-1;    
C(b+14,2)=1; C(b+14,3)=-1;    
C(b+15,3)=1; C(b+15,4)=-1;  
C(b+16,4)=1; C(b+16,5)=-1;  
C(b+17,5)=1; C(b+17,6)=-1;  
C(b+18,6)=1; C(b+18,1)=-1;
s=18; m=b+s;

% Applied external force U=U_(dim x q)
U(1:dim,1:6)=0; U(3,1)=-1;

% Solve for the forces at equilibrium, and plot
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,1,0.08); grid on;