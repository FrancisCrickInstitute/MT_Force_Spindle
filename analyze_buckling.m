% this program opens a file that contains multi-point representation of the
% microtubule shape to determine how curvature of the microtubule changes
% in time

a=load('sample_data.txt');

sza = size(a);
frames = unique(a(:,10));
N = length(frames);
figure
c = jet(N);
R = [];
Rm = [];
C = [];
Cm = [];
hmax = 0;
Ha1 = zeros(N,4);
Ha2 = zeros(N,4);
for i=1:N
    subplot(N,2,i*2-1)
    hold on
    
    % put together points that belong to this frame 'i'
    x = [];
    y = [];
    for j=1:sza(1)
        if a(j,10)==frames(i)
            x = [x a(j,8)];
            y = [y a(j,9)];
            at = 1;
        end
    end
    
    % move and turn them for a better fit
    if i==1
        p=polyfit(x,y,1);
        t = -atan(p(1));
        Rot = [cos(t) -sin(t);
            sin(t) cos(t)];
    end
    W=Rot*[x;y];
    x = W(1,:)+10;
    y = W(2,:)+10;
    
    % add extra points to the sides
    [x,ii]=sort(x);
    y = y(ii);
    p = polyfit(x(1:2),y(1:2),1);
    x = [x(1)-x(2)+x(1) x];
    y = [polyval(p,x(1)) y];
    p = polyfit(x(end-1:end),y(end-1:end),1);
    x = [x x(end)+x(end)-x(end-1)];
    y = [y polyval(p,x(end))];
    
    f=fit(x',y','smoothingspline');
    h = plot(x(2:end-1),y(2:end-1),'o');
    set(h,'Color',c(i,:));
    xt = linspace(x(2),x(end-1),20);
    xt=xt';
    h = plot(xt,f(xt),'-');
    set(h,'Color',c(i,:));
%     axis([50 170 55 85])
    axis equal
    title(['Frame: ' num2str(frames(i))])
    h1 = axis;
    Ha1(i,:) = h1;
    
    
    % Calculate the radius of curvature
    subplot(N,2,i*2)
    dx = mean(diff(xt));
    yt = f(xt);
    dy = diff(yt)./diff(xt);
    dy = movmean(dy,2);
    dy = dy(2:end);
    ddy = diff(yt,2)./diff(xt(1:end-1))./diff(xt(1:end-1));
    Rc = abs(((1+dy.*dy).^(3/2))./ddy);
%     plot(xt(2:end-1),1./Rc,'-')
    hold on
        
    plot(xt(2:end-1),movmean(1./Rc,3),'-')
    
    R(i) = min(Rc);
    C(i) = 1/R(i);
    Cm(i) = max(movmean(1./Rc,3));
    
    title(['Cmax = ' num2str(C(i)) ' ; Cmax(3 av) = ' num2str(Cm(i))])
    h1 = axis;
    Ha2(i,:) = h1;
    pause(0.1)
    if i==N
        Ha = [Ha1;Ha2];
        for j=1:N
            subplot(N,2,j*2-1)
            axis([min(Ha(:,1)) max(Ha(:,2)) min(Ha1(:,3)) max(Ha1(:,4))])
            axis equal
            subplot(N,2,j*2)
            axis([min(Ha(:,1)) max(Ha(:,2)) min(Ha2(:,3)) max(Ha2(:,4))])
        end
    end
end

% For plotting all shapes add them to the same variable:
% F{1}=[frames C']
% Then use Analyze_all_shapes.m
