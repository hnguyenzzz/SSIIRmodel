time=[0:0.01:10]; %suppose in days
ke = 35; % average degree of educated individuals (using social media to communication) 
         % suppose it's number of people may see the rumor through social media in a day 
ku = 6;  % average degree of uneducated individuals (person-to-person communication
         % suppose it's number of people may hear the rumor through direct communication 

lambdaE = 0.6; %probability of people in educated group disseminates rumor and change into spreader
lambdaU = 0.9; %probability of people in uneducated group disseminates rumor and change into spreader
gammaE = 0.3;  %probability of people in educated group that may doubt the creadibility of rumor 
gammaU = 0.1;  %probability of people in uneducated group that may doubt the creadibility of rumor 
etaE = 0.3;    %probability of people in educated group that change into stifler when contact a stifler 
etaU = 0.2;    %probability of people in educated group that change into stifler when contact a stifler 
delta = 0.02;  %probability of people that lose interest or forget about rumor

N  = 37289406; %Sudan population:    http://en.wikipedia.org/wiki/List_of_countries_by_population
pe = 0.21;     %Sudan Internet users:http://en.wikipedia.org/wiki/List_of_countries_by_number_of_Internet_users
pu = 0.79;

YInit=[(pe*N-1)/N (pu*N-1)/N 1/N 1/N 0]; 
options=[ ];
[t,PredY]=ode45(@SSIIRode, time,YInit, options, ke, ku, lambdaE, lambdaU, gammaE, gammaU, etaE, etaU, delta);
%digits(15)
%vpa(N*PredY)

PredIe = PredY(:,1);
PredIu = PredY(:,2);
PredSe = PredY(:,3);
PredSu = PredY(:,4);
PredR  = PredY(:,5);
figure;
plot(t, PredIe, t, PredIu, t,PredSe, t, PredSu,t,PredR) 
%plot(t, PredIe, t, PredIu)
%plot(t,PredSe, t, PredSu) 
%plot(t, PredR)
ylabel('Probability')
xlabel('Time') 
legend('Educated Ignorant ', 'Uneducated Ignorant' , 'Educated Spreaders ', 'Uneducated Spreaders ','Stiflers')
%legend('Educated Ignorant ', 'Uneducated Ignorant')
%legend('Educated Spreaders ', 'Uneducated Spreaders ')
%legend('Stiflers')

title('SSIIR model')
axis([0 10 -0.15 1.15]) 

%changing delta 
delta1 = 0.02;
delta2 = 0.08;
delta3=  0.15;
delta4 = 0.45;
delta5 = 0.80;
[t,PredY1]=ode45(@SSIIRode, time,YInit, options, ke, ku, lambdaE, lambdaU, gammaE, gammaU, etaE, etaU, delta1);
[t,PredY2]=ode45(@SSIIRode, time,YInit, options, ke, ku, lambdaE, lambdaU, gammaE, gammaU, etaE, etaU, delta2);
[t,PredY3]=ode45(@SSIIRode, time,YInit, options, ke, ku, lambdaE, lambdaU, gammaE, gammaU, etaE, etaU, delta3);
[t,PredY4]=ode45(@SSIIRode, time,YInit, options, ke, ku, lambdaE, lambdaU, gammaE, gammaU, etaE, etaU, delta4);
[t,PredY5]=ode45(@SSIIRode, time,YInit, options, ke, ku, lambdaE, lambdaU, gammaE, gammaU, etaE, etaU, delta5);
PredIe1 = PredY1(:,1); PredIu1 = PredY1(:,2); PredSe1 = PredY1(:,3); PredSu1 = PredY1(:,4);PredR1  = PredY1(:,5);
PredIe2 = PredY2(:,1); PredIu2 = PredY2(:,2); PredSe2 = PredY2(:,3); PredSu2 = PredY2(:,4);PredR2  = PredY2(:,5);
PredIe3 = PredY3(:,1); PredIu3 = PredY3(:,2); PredSe3 = PredY3(:,3); PredSu3 = PredY3(:,4);PredR3  = PredY3(:,5);
PredIe4 = PredY4(:,1); PredIu4 = PredY4(:,2); PredSe4 = PredY4(:,3); PredSu4 = PredY4(:,4);PredR4  = PredY4(:,5);
PredIe5 = PredY5(:,1); PredIu5 = PredY5(:,2); PredSe5 = PredY5(:,3); PredSu5 = PredY5(:,4);PredR5  = PredY5(:,5);
figure; 
plot(t, PredIe1, t, PredIe2, t, PredIe3, t, PredIe4, t, PredIe5)
ylabel('Probability')
xlabel('Time') 
legend('\delta = 0.02', '\delta = 0.08', '\delta = 0.15', '\delta = 0.45', '\delta = 0.80')

title('Educated Ignorant - Changing probability of people that lose interest or forget about rumor')
axis([0 10 0 0.25]) 

figure; 
plot(t, PredIu1, t, PredIu2, t, PredIu3, t, PredIu4, t, PredIu5)
ylabel('Probability')
xlabel('Time') 
legend('\delta = 0.02', '\delta = 0.08', '\delta = 0.15', '\delta = 0.45', '\delta = 0.80')

title('Uneducated Ignorant - Changing probability of people that lose interest or forget about rumor')
axis([0 10 -0.15 1.15])

figure; 
plot(t, PredSe1, t, PredSe2, t, PredSe3, t, PredSe4, t, PredSe5)
ylabel('Probability')
xlabel('Time') 
legend('\delta = 0.02', '\delta = 0.08', '\delta = 0.15', '\delta = 0.45', '\delta = 0.80')

title('Educated Spreaders - Changing probability of people that lose interest or forget about rumor')
axis([0 10 -0.01 0.10])

figure; 
plot(t, PredSu1, t, PredSu2, t, PredSu3, t, PredSu4, t, PredSu5)
ylabel('Probability')
xlabel('Time') 
legend('\delta = 0.02', '\delta = 0.08', '\delta = 0.15', '\delta = 0.45', '\delta = 0.80')

title('Uneducated Spreaders - Changing probability of people that lose interest or forget about rumor')
axis([0 10 -0.05 0.5])

figure; 
plot(t, PredR1, t, PredR2, t, PredR3, t, PredR4, t, PredR5)
ylabel('Probability')
xlabel('Time') 
legend('\delta = 0.02', '\delta = 0.08', '\delta = 0.15', '\delta = 0.45', '\delta = 0.80')

title('Stiflers - Changing probability of people that lose interest or forget about rumor')
axis([0 10 -0.15 1.15])