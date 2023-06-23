% plot
time=0:tau:(run_time-tau);

figure
plot(time,outputs(1,:)*(180/pi),'-','Linewidth',2);
hold on
plot(time,ref*(180/pi),'--','Linewidth',2)
plot(time,x_hat(1,:)*(180/pi),'-.','Linewidth',2)
% plot(time,x_rkf(1,:)*(180/pi),'-.','Linewidth',2)
grid on
xlabel('Time (s)')
ylabel('Angel in dergess')
title('State 1 position')
legend('Angle of Pendulum','Reference','Estimated KF','Location','Best')
% print('-dpng','-r300','fig3')

axes('Position',[.20 .35 .3 .2])
box on
rng=(1980:2505);
plot(time(1,rng),outputs(1,rng)*(180/pi),'-','Linewidth',2)
hold on
plot(time(1,rng),ref(1,rng)*(180/pi),'--','Linewidth',2)
plot(time(1,rng),x_hat(1,rng)*(180/pi),'-.','Linewidth',2)
% plot(time(1,rng),x_rkf(1,rng)*(180/pi),'-.','Linewidth',2)
grid on

figure
plot(time,outputs(2,:)*(180/pi),'-','Linewidth',2);
hold on
% plot(time,ref*(180/pi),'--','Linewidth',2)
plot(time,x_hat(2,:)*(180/pi),'-.','Linewidth',2)
% plot(time,x_rkf(2,:),'-.','Linewidth',2)
grid on
xlabel('Time (s)')
ylabel('Speed of pendulum')
title('State 2 speed')
legend('Speed of Pendulum','Estimated Speed','Location','Best')

% figure
% plot(time,exp_F,'-','LineWidth',2)
% hold on
% plot(time,x_hat(3,:),'--','LineWidth',2)
% % plot(time,x_hat2(3,:),'-.','LineWidth',2)
% grid on
% xlabel('Time (s)')
% ylabel('Non linearities')
% legend('F via Lie derivatives','Calculated F using KF','Location','Best')
% axes('Position',[.550 .15 .3 .2])
% box on
% rng=(1980:2505);
% plot(time(1,rng),exp_F(1,rng),'-','Linewidth',2)
% hold on
% plot(time(1,rng),x_hat(3,rng),'--','Linewidth',2)
% % plot(time(1,rng),x_hat2(3,rng),'-.','LineWidth',2)
% grid on
% % print('-dpng','-r300','Fig4')
% 

% figure
% subplot(4,2,1)
% histogram(Errors(1,:),30)
% title('Sensor 1 Position')
% 
% subplot(4,2,2)
% histogram(Errors(2,:),30)
% title('Sensor 2 Speed')
% 
% subplot(4,2,3)
% histogram(Errors(3,:),30)
% title('Sensor 3 Position')
% 
% subplot(4,2,4)
% histogram(Errors(2,:),30)
% title('Sensor 4 Speed')
% 
% subplot(4,2,5)
% histogram(Errors(5,:),30)
% title('Sensor 5 Position')
% 
% subplot(4,2,6)
% histogram(Errors(6,:),30)
% title('Sensor 6 Speed')
% 
% subplot(4,2,7)
% histogram(Errors(7,:))
% title('RBGMKF position')
% 
% subplot(4,2,8)
% histogram(Errors(8,:))
% title('RBGMKF Speed')
% 



% figure
% subplot(3,2,1)
% histogram(PSi(:,1),30)
% hold on
% % vline([2.25 2.25],{'r','LineWidth',2})
% % histogram(PSi(2000:2500,1),30)
% title('Sensor 1 Position')
% xlabel('Projection Statistics values')
% ylabel('Frequency')
% grid
% 
% subplot(3,2,2)
% histogram(PSi(:,2),30)
% title('Sensor 2 Speed')
% xlabel('Projection Statistics values')
% ylabel('Frequency')
% grid
% 
% subplot(3,2,3)
% histogram(PSi(:,3),30)
% title('Sensor 3 Position')
% xlabel('Projection Statistics values')
% ylabel('Frequency')
% grid
% 
% subplot(3,2,4)
% histogram(PSi(:,4),30)
% title('Sensor 4 Speed')
% xlabel('Projection Statistics values')
% ylabel('Frequency')
% grid
% 
% subplot(3,2,5)
% histogram(PSi(:,5),30)
% title('Sensor 5 Position')
% xlabel('Projection Statistics values')
% ylabel('Frequency')
% grid
% 
% subplot(3,2,6)
% histogram(PSi(:,6),30)
% title('Sensor 6 Speed')
% xlabel('Projection Statistics values')
% ylabel('Frequency')
% grid
% print('Fig12','-dpng','-r300')
% 
% subplot(4,2,7)
% histogram(PSi(:,7))
% title('RBGMKF position')
% 
% subplot(4,2,8)
% histogram(PSi(:,8))
% title('RBGMKF Speed')