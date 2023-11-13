% using time delay 

figure (1)
ax(1) = subplot(3,1,1);
plot(s1)
ylabel("s1")
grid on
ax(2) = subplot(3,1,2); 
plot(s2,"k")
ylabel("s2")
grid on
ax(3) = subplot(3,1,3); 
plot(s3,"r")
ylabel("s3")
grid on
xlabel("Samples")
linkaxes(ax,"xy")


%% time delay
t21 = finddelay(s1,s2)

t31 = finddelay(s1,s3)


%align signals
s1 = alignsignals(s1,s3);
s2 = alignsignals(s2,s3);

figure (2)
ax(1) = subplot(3,1,1);
plot(s1)
grid on 
title("s1")
axis tight
ax(2) = subplot(3,1,2);
plot(s2)
grid on 
title("s2")
axis tight
ax(3) = subplot(3,1,3); 
plot(s3)
grid on 
title("s3")
axis tight
linkaxes(ax,"xy")
