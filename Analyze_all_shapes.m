% buckling data
load buckling_data
% in this file F is for EBHSET and G is for HSET only
figure
hold on
x = 0:1:35;
y = zeros(size(x));
n = zeros(size(x));
for i=1:length(F)
    Q = F{i};
    Q(:,2) = Q(:,2)/0.11;  % pixel size
    plot(Q(:,1)-Q(1,1),Q(:,2),'b')
    y1 = interp1(Q(:,1)-Q(1,1),Q(:,2),x);
    n = n + ~isnan(y1);
    y1(isnan(y1))=0;
    y = y + y1;
end
y = y./n;
h = plot(x,movmean(y,18),'b');
set(h,'LineWidth',4)


x = 0:1:35;
y = zeros(size(x));
n = zeros(size(x));
for i=1:length(G)
    Q = G{i};
    if i==1
        Q(:,2) = Q(:,2)/0.075;  % pixel size
    else
        Q(:,2) = Q(:,2)/0.11;  % pixel size
    end
    plot(Q(:,1)-Q(1,1),Q(:,2),'r')
    y1 = interp1(Q(:,1)-Q(1,1),Q(:,2),x);
    n = n + ~isnan(y1);
    y1(isnan(y1))=0;
    y = y + y1;
end
y = y./n;
h = plot(x,movmean(y,15),'r');
set(h,'LineWidth',4)

