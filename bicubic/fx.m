function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % TODO: Calculeaza derivata.
    [m n] = size(f);
    if (x == n) || (x == 1)
      r = 0;
    else
      r = (f(y, x+1) - f(y, x-1))/2;
    endif  
endfunction