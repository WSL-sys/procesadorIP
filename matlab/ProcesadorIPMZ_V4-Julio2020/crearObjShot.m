function X=crearObjShot(file)

str = strread(file,'%s','delimiter','\\');
filename = str(length(str));

X = objShot;
X.filename = filename;
X.shotFile = file;
X.objLstEst = abrirShot(file);