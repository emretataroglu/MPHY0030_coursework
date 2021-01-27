
  
function a = finite_difference_gradient(val)
    syms x1 x2 x3
    
    a1=3;
    a2=3;
    a3=3;
    a4=3;
    a5=3;
    a6=3;
    a7=3;
    a8=3;
    a9=3;
    a0=3;
    
    f = a1*x1^2 + a2*x2^2 + a3*x3^2 + a4*x1*x2 + a5*x1*x3 + a6*x2*x3 + a7*x1 + a8*x2 + a9*x3 + a0;
    
    % Gradient
    dfdx1 = diff(f,x1);
    dfdx2 = diff(f,x2);
    dfdx3 = diff(f,x3);
    %disp(dfdx1);
    %disp(vpa(subs(dfdx1,[x1,x2,x3],val)));
    dfdx1_v = vpa(subs(dfdx1,[x1,x2,x3],val));
    dfdx2_v = vpa(subs(dfdx2,[x1,x2,x3],val));
    dfdx3_v = vpa(subs(dfdx3,[x1,x2,x3],val));
    a=[dfdx1_v,dfdx2_v,dfdx3_v];


end
