% Set parameters
beta = 0.9;
gamma = 0.6;
kappa = 0.5;
omega = 7;
C_I = 100;
C_sd = 1;

% Solve ODE
[tv,Yv] = ode23('SIR_SD',[0 200],[0.99;0.01;0;0.2;beta;gamma;kappa;omega;C_sd;C_I]);

% Threshold
I_star = - 1/beta * log(1 - C_sd/C_I);
I_star_v = I_star*ones(length(tv),1);

% Plot SIR-SD
figure(1); plot(tv,Yv(:,1),'-b',tv,Yv(:,2),'-r',tv,Yv(:,3),'-g',tv,Yv(:,4),'-','Linewidth',2)
legend('S','I','R','SD','Fontsize',15)
xlabel('Time','Fontsize',15); ylabel('Fraction of the population','Fontsize',20);
set(gca,'FontSize',15)

% Plot Infected
figure(2); plot(tv,Yv(:,2),'-r',tv,I_star_v,'--c','Linewidth',2)
xline(49.5,'--','Linewidth',2);
legend('I','I^*','Herd immunity','Fontsize',15)
xlabel('Time','Fontsize',15); ylabel('Fraction of the population','Fontsize',20);
set(gca,'FontSize',15)
