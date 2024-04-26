syms a1 a3 a6 a5 a4 k;


matrix654 = [0.44,       a6,     0.1 * a6;
             a6,         0.44,   0.1 * a6;
             0.1 * a6,   0.1*  a6,      0.46];

        
disp(matrix654);    
[V654,D654] = eig(matrix654);   

    
%%  consider S6 , S5 , S4

% disp(D654)
disp(D654(1,1));
disp(D654(2,2));
disp(D654(3,3));

%%    计算两根之差
deltabetaD654 =D654(3,3) - D654(2,2)  ;
disp(deltabetaD654)     
