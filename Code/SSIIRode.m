function [Ydot]=SSIIRode(time,YInit,ke, ku, lambdaE, lambdaU, gammaE, gammaU, etaE, etaU, delta ) 

Ie = YInit(1); %initial value of I 
Iu = YInit(2); %initial value of I 
Se = YInit(3); %initial value of Se
Su = YInit(4); %initial value of Su
R  = YInit(5); %initial value of R

Ydot(1)=-ke*Ie*Se;
Ydot(2)=-ku*Iu*Su;
Ydot(3)=ke*lambdaE*Ie*Se - ke*Se*(gammaE*Se + etaE*R) -delta*Se;
Ydot(4)=ku*lambdaU*Iu*Su - ku*Su*(gammaU*Su + etaU*R) -delta*Su;
Ydot(5)=(1-lambdaE)*ke*Se*Ie + (1-lambdaU)*ku*Su*Iu + ke*Se*(gammaE*Se + etaE*R) + delta*Se + ku*Su*(gammaU*Su + etaU*R) + delta*Su;

Ydot=Ydot'; % must return a column vector