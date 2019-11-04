% Static force analysis of nonminimal prism with 4 bars (Fig 3.43 of Skelton & de Oliviera 2009)
clear; clf; figure(1);

% Free [Q=Q_(dim x q)] and fixed [Q=Q_(dim x q)] node locations
Q(:,1)=[0; 0; -0.5];
Q(:,2)=[0; 0; 0.5];
Q(:,3)=[0.5 * sin(0*pi/3); 0.5 * cos(0*pi/3);      0];
Q(:,4)=[0.5 * sin(1*pi/3); 0.5 * cos(1*pi/3);      0];
Q(:,5)=[0.5 * sin(2*pi/3); 0.5 * cos(2*pi/3);      0];
Q(:,6)=[0.5 * sin(3*pi/3); 0.5 * cos(3*pi/3);      0];
Q(:,7)=[0.5 * sin(4*pi/3); 0.5 * cos(4*pi/3);      0];
Q(:,8)=[0.5 * sin(5*pi/3); 0.5 * cos(5*pi/3);      0];
P=[];
[dim,q]=size(Q); p=size(P,2); n=q+p; 

% Connectivity matrix
C(  1,1)=1; C(  1,2)=-1;       % bars 
C(  2,3)=1; C(  2,6)=-1;
C(  3,4)=1; C(  3,7)=-1;
C(  4,5)=1; C(  4,8)=-1; b=4;
C(b+1,1)=1; C(b+1,3)=-1;       % strings 
C(b+2,1)=1; C(b+2,4)=-1;    
C(b+3,1)=1; C(b+3,5)=-1;    
C(b+4,1)=1; C(b+4,6)=-1;    
C(b+5,1)=1; C(b+5,7)=-1;    
C(b+6,1)=1; C(b+6,8)=-1;    
C(b+7,2)=1; C(b+7,3)=-1;    
C(b+8,2)=1; C(b+8,4)=-1;    
C(b+9,2)=1; C(b+9,5)=-1;  
C(b+10,2)=1; C(b+10,6)=-1;  
C(b+11,2)=1; C(b+11,7)=-1;  
C(b+12,2)=1; C(b+12,8)=-1;  
C(b+13,3)=1; C(b+13,4)=-1;    
C(b+14,4)=1; C(b+14,5)=-1;    
C(b+15,5)=1; C(b+15,6)=-1;  
C(b+16,6)=1; C(b+16,7)=-1;  
C(b+17,7)=1; C(b+17,8)=-1;  
C(b+18,8)=1; C(b+18,3)=-1;  
s=18; m=b+s;

% Applied external force U=U_(dim x q)
U(1:dim,1:8)=0; U(2,3)=-1; U(2,6)=1;

% Solve for the forces at equilibrium, and plot
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,1,0.08); grid on;