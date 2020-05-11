% _____________________________________________________________
% Exercice 4 : Évaporateur flash
% _____________________________________________________________
clc;
clear all;
%allo

% ---------- Données du problème ----------
A1=4.35647;
B1=1277.03;
C1=237.23;
A2=3.96288;
B2=1106.94;
C2=218.552;
sol='Acetone-Chloroforme';
x1=0.60;
T=58;
y2=0.75;


% ---------- Appel de la fonction activite ----------
a = activite(sol,x1);

% ---------- Appel de la fonction antoine ----------
P_sat = antoine(A1,B1,C1,T);

% ---------- Appel de la fonction pression ----------
P = pression(x1,1-y2,P_sat,a(1));

% Affichage
 fprintf('La pression totale de l''évaporateur flash est de %f bar.\n',P)

% ---------- Graphique ----------
aa=[]; %matrice des activites selon la fraction molaire
x11=0:0.1:1;%fraction molaire
for i=1:length(x11)
    aa(i,:) = activite(sol,x11(i));
end
figure(1)
plot(x11,aa(:,1),x11,aa(:,2))
legend('Premier composé','Deuxième composé','Location','best')
xlabel('Fraction molaire du composé 1')
ylabel('Coefficient dactivité')
title('Coefficient dactivité de chacun des composés de la solution en fonction de la fraction molaire du premier composé')
% ---------- CORRECTION ----------
res = evaporateur_corr();
