% function v = vanderwaals( p,T,n,a,b )
% %utilizar� o metodo Newton-Raphson para a solu��o do problema o m�todo
% %segue a equa��o: X_n+1 = X_n - f(X_n)/f'(X_n)
% 
% R = 0.0821; %R = 0,0821 atm. L/mol . K (pq a press�o � atm)
% 
%     %Funcoes auxiliares para o calculo utilizadas
%     function f1 = V( v,p,T,n,a,b ) %FUNCAO f'(v)
%         f1 = (n*b) + ((n*R*T)/(p +(a*n^2/v^2))) - v;
%     end
% 
%     function f2 = dV( v,p,T,n,a ) % FUNCAO DIFERENCIAL f'(v)
%         f2 = ((2*a*(n^3)*R*T)/((v^3)*((p +(a*n^2/v^2))^2)))-1;
%     end
% 
% %Condicoes de parada
% tol = 0.001; % esta � a tolerancia do problema, defini 1*10^-8
% k_max = 10; %iteracoes maxima
% k = 1; %itera��o
% 
% 
% dif = 1; %declarando divisao do metodo, coloquei 1 apenas para ilustrar
%          %a fun��o dif assumir� f(Vn)/f'(Vn) temos portanto que: Vn+1 = Vn
%          %- dif => NEWTON-RAPSON!!
%          
% v = n*R*T/p; %volume inicial do g�s - CHUTE INICIAL
% 
% while (dif>tol)
%     dif = V(v,p,T,n,a,b)/dV(v,p,T,n,a); %f(Vn)/f'(Vn)
%     vn = v - dif; %Vn+1 = Vn - f(Vn)/f'(Vn)
%     v = vn; %Vn+1 assume o valor atual
%     k=k+1; %incrementa itera��o
%     if(k==k_max) %caso atingir o numero de itera�oes maximo, para mesmo com dif>tol
%         break
%     end
% end
% end

function v = vanderwaals( p,T,n,a,b )
%utilizar� o metodo das secantes
%segue a equa��o: v = v_ant*f(v) - v*f_ant(v) / f(v) - f_ant(v)

R = 0.0821; %R = 0,0821 atm.L/mol.K


function modelo_gas_ideal = fv( v,p,T,n,a,b ) %FUNCAO f'(v)
  modelo_gas_ideal = n*b + ((n*R*T)/(p +(a*n^2/v^2))) - v;
end

%Crit�rio de converg�ncia
tol = 1e-5; % tolerancia
it_maxima = 60; %iteracoes maxima    


it = 1; %itera��o 1
deltaV = 10; %apenas para inicializar com um valor

%chutes iniciais
v_ant = n*R*T/p; %eq. gases ideais - 1� chute
v = fv(v_ant,p,T,n,a,b); %eq. gases ideais corrigida - 2� chute

while (tol<deltaV)
    it = it + 1; %itera��o � incrementada
    v_novo = (v_ant*fv(v,p,T,n,a,b) - v*fv(v_ant,p,T,n,a,b)) / (fv(v,p,T,n,a,b) - fv(v_ant,p,T,n,a,b));
    
    v_ant = v;
    v = v_novo;
    
    deltaV = abs(v_novo - v_ant); %checando tolerancia
    
    if(it>it_maxima)
        break;
    end
    
end

end


