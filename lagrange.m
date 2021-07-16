function P = ilagrange(p_x , f_x)
% Interpolacion de Lagrange. Recibe un vector con los puntos 'p_x' y un  vector con la función evaluada en f(x) como 'f_x'. Retorna el polinomio.
    if length(p_x) == length(f_x)
        n = length(f_x);
        suma = 0;        
        syms x;
        for i = 1:1:n
            producto = f_x(i);
            for j = 1:1:n
                if i ~= j
                   producto = (producto * (x - p_x(j))) / (p_x(i) - p_x(j));
                end
            end
            suma = suma + producto;           
        end
        P=simplify(suma);
        return;
        
    end
    fprintf('Error en el tamaño de los vectores.');

end