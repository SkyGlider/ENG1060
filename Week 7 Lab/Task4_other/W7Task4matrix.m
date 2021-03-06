% Name: Andrew Pang
% Date: 19 APR 2019  
% Task 4 :  Distribution centre
clear all;close all;clc; 

%vector c is number of each customer 
cn = 1:1:6;

%vector cx,cy and cv is the x positions, y positions and volume of each customer
cx = [ 1 7 8 17 22 27 ];
cy = [ 28 18 16 2 10 8 ];
cv = [ 5 11 1 9 7 6];

%initialize a matrix coord containing zeros
coord = zeros(30,30);

%runs thru every column of each row for every row 
for y = 1:1:length(coord)
    for x = 1:1:length(coord)
        cost = 0;
        for c = cn
            cost = cost + 0.5*cv(c).*sqrt((x-cx(c)).^2 + (y-cy(c)).^2);
        end
        coord(y,x) = cost;
    end
end

%finds the minimum value and its coordinates
minival = min(min(coord));
[ ypos, xpos ] = find(coord == minival);

%plots the given graph
plot(cx,cy,'ko','MarkerFaceColor','black');
hold on

%plots the centralized distribution centre's location
plot(xpos,ypos,'rd','MarkerFaceColor','red');

%labels the axes
title('Graph of customer location')
xlabel('x (km)');
ylabel('y (km)');
legend('Customers','Distribution Centre')

fprintf('The minimum cost is $%f',minival)