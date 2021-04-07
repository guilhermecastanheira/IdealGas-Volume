function v = vanderwaals( p,T,n,a,b )
%utilizará o metodo das secantes
%segue a equação: v = v_ant*f(v) - v*f_ant(v) / f(v) - f_ant(v)
%não se utiliza funções derivadas, no entanto é necessário dois chutes iniciais

R = 0.0821; %R = 0,0821 atm.L/mol.K

%funcao utilizada é a dos gases ideais corrigida
function modelo_gas_ideal = fv( v,p,T,n,a,b ) %FUNCAO f'(v)
  modelo_gas_ideal = n*b + ((n*R*T)/(p +(a*n^2/v^2))) - v;
end

%Critério de convergência
tol = 1e-5; % tolerancia
it_maxima = 60; %iteracoes maxima    

it = 1; %iteração 1
deltaV = 10; %apenas para inicializar com um valor

%chutes iniciais
v_ant = n*R*T/p; %eq. gases ideais - 1° chute
v = fv(v_ant,p,T,n,a,b); %eq. gases ideais corrigida - 2° chute

while (tol<deltaV)
    it = it + 1; %iteração é incrementada
    v_novo = (v_ant*fv(v,p,T,n,a,b) - v*fv(v_ant,p,T,n,a,b)) / (fv(v,p,T,n,a,b) - fv(v_ant,p,T,n,a,b));
    
    v_ant = v;
    v = v_novo;
    
    deltaV = abs(v_novo - v_ant); %checando tolerancia
    
    if(it>it_maxima)
        break;
    end
    
end

end


