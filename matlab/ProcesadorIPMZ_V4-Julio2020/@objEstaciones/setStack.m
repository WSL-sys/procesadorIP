function est = setStack(est,name,params)
% agrega el stack especificado a una estacion
stk=crearStack(name,params);
est = set(est,'stack',stk);