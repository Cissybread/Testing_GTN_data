function val=fidelity(state1,state2)
% Usage fidelity(rho1, rho2)
%
% Calculate the fidelity of the state given by the density two
% matricies.  Either parameter may be a state vector instead of a
% density matrix.  If one parameter is a state vector, we compute the
% overlap directly without resorting to calculating the matrix
% sqrt.  This makes the program substantially faster, so provide a
% pure state when possible.
  
  pure = 0;
  if (size(state1, 2) == 1)
    rho1 = state1*state1';
    pure = 1;
  elseif(size(state1,2) == size(state1, 1))
    rho1 = state1;
  else
    error('State 1 is not a vector or density matrix');
  end
  

  if (size(state2, 2) == 1)
    rho1 = state2*state2';
    pure = 1;
  elseif(size(state2,2) == size(state2, 1))
    rho2 = state2;
  else
    error('State 2 is not a vector or density matrix');
  end

  rho1 = rho1 / trace(rho1);
  rho2 = rho2 / trace(rho2);

  rho1 = (rho1+rho1')/2;  % take only the hermetian part

  if(pure)
    val = trace(rho1 * rho2);
  else
    tmp = rho1^.5;
    a = tmp * rho2 * tmp;
    ev = eig(a);
    val = sum(ev.^.5)^2;
  end
  val = real(val);
