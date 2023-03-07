function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute �n punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    
    % Se afl? num?rul de puncte.
    n = length(x_int);

    % TODO: Cele 4 puncte �ncadratoare vor fi aceleasi pentru toate punctele din interior.
    x1 = 1;
    x2 = 2;
    y1 = 1;
    y2 = 2;
    
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n, n);
    
    % Se parcurge fiecare pixel din imaginea finala.
    pixel = 0;
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            dist(1) = sqrt((x_int(i) - x1)^2 + (y_int(j) - y1)^2);
            dist(2) = sqrt((x_int(i) - x1)^2 + (y_int(j) - y2)^2);
            dist(3) = sqrt((x_int(i) - x2)^2 + (y_int(j) - y1)^2);
            dist(4) = sqrt((x_int(i) - x2)^2 + (y_int(j) - y2)^2);
            min_dist = min(dist);
            
            if(j != ceil(n/2))
              if (min_dist == dist(3))
                pixel = f(y2, x1);
              elseif (min_dist == dist(4))
                pixel = f(y2, x2);
              elseif (min_dist == dist(1))
                pixel = f(y1, x1);
              elseif (min_dist == dist(2))
                pixel = f(y1, x2);
              endif
            elseif(j == ceil(n/2)) 
              if(i < ceil(n/2))
                pixel = f(y1, x2);
              elseif(i >= (n/2))
                pixel = f(y2, x2);
              endif
            endif
            
            % TODO: Calculeaza pixelul din imaginea finala.
            out(i, j) = pixel;
        endfor
    endfor
endfunction