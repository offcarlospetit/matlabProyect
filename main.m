% Delaramos la función a aproximar
ff = @(x)((1 + x)/(1 + 2*x + 3*x^2));
% generamos el rango de puntos en este caso al ser un polinomio de grado 5
% se generan los puntos de 1 en 1 
xp = 0:1:5;
yp = [];
% Evaluamos la funcion en los puntos para generar las coordendas en y
for c = xp
    yp = [yp,feval(ff, c)];
end

% Se genera el polinomio interpolante de lagrange con los puntos xp y los
% puntos (yp) de la funcion evaluada en xp 
p = ilagrange(xp, yp);
erange = 0:0.2:5;
f2=inline(p);

verrors = [];
for e = erange
    error = abs(feval(ff,e)-feval(f2, e) );
    verrors = [verrors, error];
end
figure(1)
fplot(ff, [0 5], 'b')
hold on 
fplot(p, [0 5],'r')
grid on
title('Polinomio Interpolación de lagrange')
xlabel('Input Values (x)')
ylabel('Ouput Values (f)')
[xints,yints,~,~] = intersections([0 5],ff,[0 5],p,1);
figure(2)
plot(erange, verrors)
grid on



