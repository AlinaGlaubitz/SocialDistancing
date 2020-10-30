% Graphics for different values CI
% Set parameters
beta = 0.8;
gamma = 0.5;
I0 = 0.01;
E0 = 0.2;


% Different values of C_I
C_sd1 = 1;
C_sd2 = 2;
C_sd3 = 3;
omega = 1;
kappa = 0.5;

% Solve ODE for different CI
C_i_v = 10:1:450;
r_infty1 = ones(1,length(C_i_v));
r_infty2 = ones(1,length(C_i_v));
r_infty3 = ones(1,length(C_i_v));
i=0;
for ci = 10:1:450
    [~,SIR_SD1] = ode23('SIR_SD',[0,2000],[1-I0;I0;0;E0;beta;gamma;kappa;omega;C_sd1;ci]);
    [~,SIR_SD2] = ode23('SIR_SD',[0,2000],[1-I0;I0;0;E0;beta;gamma;kappa;omega;C_sd2;ci]);
    [~,SIR_SD3] = ode23('SIR_SD',[0,2000],[1-I0;I0;0;E0;beta;gamma;kappa;omega;C_sd3;ci]);
    i = i+1;
    r_infty1(i) = SIR_SD1(end,3);
    r_infty2(i) = SIR_SD2(end,3);
    r_infty3(i) = SIR_SD3(end,3);
end

% Plot
figure(1); plot(C_i_v,r_infty1,'-',C_i_v,r_infty2,'-',C_i_v,r_infty3,'-','Linewidth',2)
xlabel('C_I','FontSize',15); ylabel('R(\infty)','FontSize',15);
axis([10 450 0.35 0.7]);
legend('C_{sd}=1','C_{sd}=2','C_{sd}=3','FontSize',15)
set(gca,'FontSize',15)


% Graphics for different values of omega, kappa, C_I, C_sd
% Set parameters
beta = 0.9;
gamma = 0.6;
I0 = 0.01;
E0 = 0.2;

% Set parameters
C_I = 125;
C_sd = 1;
omega1 = 1;
omega2 = 1.5;

% Solve ODE for different omega
kappa_v = 0.3:0.05:10;
r_infty1 = ones(1,length(kappa_v));
r_infty2 = ones(1,length(kappa_v));
r_infty4 = ones(1,length(kappa_v));
PA = ones(1,length(kappa_v));
i=0; 
[~,SIR] = ode23('SIR',[0,500],[1-I0,I0,0]);
for kappa = 0.3:0.05:10
    I_star = -log(1 - C_sd/C_I)/beta;
    [~,SIR_SD1] = ode23('SIR_SD',[0,2000],[1-I0;I0;0;E0;beta;gamma;kappa;omega1;C_sd;C_I]);
    [~,SIR_SD2] = ode23('SIR_SD',[0,2000],[1-I0;I0;0;E0;beta;gamma;kappa;omega2;C_sd;C_I]);
    i = i+1;
    r_infty1(i) = SIR_SD1(end,3);
    r_infty2(i) = SIR_SD2(end,3);
    PA(i) = gamma*lambertw(-exp(-I_star*beta/gamma -1))/beta + 1;
end

% Plot
figure(2); plot(kappa_v,r_infty1,'-',kappa_v,r_infty2,'-',kappa_v,PA,'--','Linewidth',2)
xlabel('\kappa','FontSize',15); ylabel('R(\infty)','FontSize',15);
axis([0.3 10 0.35 0.47])
legend('\omega=1','\omega=3','perf. Ad.','FontSize',15)
set(gca,'FontSize',15)


% Graphics for different values of omega
beta = 0.4;
gamma = 0.2;
I0 = 0.01;
E0 = 0.2;

% Different values of omega
C_I = 250;
C_sd = 1;
kappa1 = 1;
kappa2 = 5;


% Solve ODE for different omega
omega_v = 0.3:0.01:10;
r_infty1 = ones(1,length(omega_v));
r_infty2 = ones(1,length(omega_v));
PA = ones(1,length(omega_v));
i=0;
for omega = 0.3:0.01:10
    I_star = -log(1 - C_sd/C_I)/beta;
    [~,SIR_SD1] = ode23('SIR_SD',[0,1000],[1-I0;I0;0;E0;beta;gamma;kappa1;omega;C_sd;C_I]);
    [~,SIR_SD3] = ode23('SIR_SD',[0,1000],[1-I0;I0;0;E0;beta;gamma;kappa2;omega;C_sd;C_I]);
    i = i+1;
    r_infty1(i) = SIR_SD1(end,3);
    PA(i) = gamma*lambertw(-exp(-I_star*beta/gamma -1))/beta + 1;
    r_infty2(i) = SIR_SD3(end,3);
end

%Plot
figure(3); plot(omega_v,r_infty1,'-',omega_v,r_infty2,'-',omega_v,PA,'-','Linewidth',2)
xlabel('\omega','FontSize',15); ylabel('R(\infty)','FontSize',15);
axis([0.5 10 0.56 0.61])
legend('\kappa=1.5','\kappa=5','perf. Ad.','FontSize',15)
set(gca,'FontSize',15)

% Graphics for different values of CSD
% Set parameters
beta = 0.4;
gamma = 0.3;
I0 = 0.01;
E0 = 0.2;

% Different values of CSD
C_I1 = 100;
C_I2 = 50;
C_I3 = 150;
omega = 2;
kappa = 0.5;

% Solve ODE for different CSD
C_sd_v = 0.5:0.05:3.5;
r_infty1 = ones(1,length(C_sd_v));
r_infty2 = ones(1,length(C_sd_v));
r_infty3 = ones(1,length(C_sd_v));
i=0;
for csd = 0.5:0.05:3.5
    I_star = -log(1 - csd/C_I1)/beta;
    [~,SIR_SD1] = ode23('SIR_SD',[0,1500],[1-I0;I0;0;E0;beta;gamma;kappa;omega;csd;C_I1]);
    [~,SIR_SD2] = ode23('SIR_SD',[0,1500],[1-I0;I0;0;E0;beta;gamma;kappa;omega;csd;C_I2]);
    [~,SIR_SD3] = ode23('SIR_SD',[0,1500],[1-I0;I0;0;E0;beta;gamma;kappa;omega;csd;C_I3]);
    i = i+1;
    r_infty1(i) = SIR_SD1(end,3);
    r_infty2(i) = SIR_SD2(end,3);
    r_infty3(i) = SIR_SD3(end,3);
end

%Plot
figure(4); plot(C_sd_v,r_infty2,'-',C_sd_v,r_infty1,'-',C_sd_v,r_infty3,'-','Linewidth',2)
xlabel('C_{sd}','FontSize',15); ylabel('R(\infty)','FontSize',15);
axis([0.5 3.5 0.3 0.55]);
set(gca,'FontSize',15)
legend('C_I=50','C_I=100','C_I=150','FontSize',15)
