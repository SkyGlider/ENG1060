% Name: Andrew Pang
% Date: 19 APR 2019  
% Task 4 :  Fourier series
clear all;close all;clc; 

c = 1:1:6;
cx = [ 1 7 8 17 22 27 ];
cy = [ 28 18 16 2 10 8 ];
cv = [ 5 11 1 9 7 6];
dx = 0:1:30;
dy = 0:1:30;



x_dist2 = [];
for i1 = dx
    x_dist1  = [];
    for i2 = c
        
        x_dist1 = [ x_dist1, ( cv(i2) * (i1 - cx(i2)) )^2 ];
       
    end
        
    x_dist2 = [x_dist2; x_dist1];
        
end

[x_minumumrowsum, x_minsumrowpos  ] = min(sum(x_dist2,2));

x_minvalues = x_dist2(x_minsumrowpos,:);

y_dist2 = [];
for i3 = dy
    y_dist1  = [];
    for i4 = c
        y_dist1 = [ y_dist1 ( cv(i4) * (i3 - cy(i4)) )^2];
            
    end
        
    y_dist2 = [y_dist2; y_dist1];
        
end

[y_minumumrowsum, y_minsumrowpos  ] = min(sum(y_dist2,2));

y_minvalues = y_dist2(y_minsumrowpos,:);


min_costs1 =  sqrt(x_minvalues + y_minvalues);
min_costs = 0.5 * min_costs1;
total_cost = sum(min_costs);

plot(cx,cy,'ko','MarkerFaceColor','black');
hold on
plot(x_minsumrowpos,y_minsumrowpos,'rd','MarkerFaceColor','red');
xlabel('x (km)');
ylabel('y (km)');



%y_minsumrowpos
%x_minsumrowpos







%distance_compo = sqrt(x_dist2 + y_dist2);

%[d_minumumrowsum, d_minsumrowpos  ] = min(sum(distance_compo,2));

%d_minvalues = distance_compo(d_minsumrowpos,:);


