DROP table EMPLOYES cascade
constraint;
CREATE TABLE EMPLOYES(
	Matricule varchar(30),
	constraint pk_Matricule primary key(Matricule),
	nomEmploye varchar(20),
	prenomEmploye varchar(20),
	MatriculeChef varchar(30) REFERENCES EMPLOYES(Matricule)
);
DROP table PARTICIPATIONS cascade
constraint;
CREATE TABLE PARTICIPATIONS
(
	Matricule1 varchar(30) UNIQUE,
	Matricule2 varchar(30),
	idModule integer,
	idProjet integer,
	Date_participation date,
	constraint check_date check (Date_participation> TO_DATE('2014-12-31','YYYY-MM-DD')),	
	FOREIGN KEY (Matricule1) REFERENCES EMPLOYES(Matricule),
	FOREIGN KEY (Matricule2) REFERENCES EMPLOYES(Matricule),
	constraint pk_mat1mat2 primary key (Matricule1,Matricule2,idmodule,idProjet),
	FOREIGN KEY (idProjet,idModule) REFERENCES MODULES(idProjet,idModule)
);
DROP table PROJETS cascade
constraint;
CREATE TABLE PROJETS
(	
	idModule integer,
	idProjet integer,
	description_projet varchar(50) UNIQUE,
	constraint pk_idProjet primary key(idProjet)
);
DROP table MODULES cascade
constraint;
CREATE TABLE MODULES
(
	idModule integer,
	idProjet integer,
	description_module varchar(30),
	constraint pk_idModule primary key (idModule,idProjet),
	FOREIGN KEY (idProjet) REFERENCES PROJETS(idProjet)
);