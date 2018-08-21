INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C001', 'colaciones', 'S', ' ', 'RACIONES(Q.CODIGO,KHFECHA,KHHE,KHHE)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C010', 'Dia trabajado ', 'S', ' ', 'IIF(KHHPR>0,1,0)', 'Se considera dia trabajado si trabajo algo de tiempo

IIF(KHHPR>0,1,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C011', 'Hs trabajadas en vispera de feriado ', 'S', ' ', 'IIF(KHDC=0 AND KHVFE=1,KHFH,0)', ' IIF(KHVFE=1 AND KHDC=1 AND KHHO<=23.59, KHFH,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C012', 'Hs. trabajadas dentro de feriado', 'S', ' ', 'IIF(KHDC=1 AND KHVFE=1,KHFH,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C015', 'Dia franco trabajado', 'S', ' ', 'IIF(KHHPR > 0 AND KHFR = 1,1,0)', 'Si trabajo algo de tiempo en un franco, se considera franco trabajado', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C020', 'Dia de vacaciones ', 'S', ' ', 'IIF(KHVAC=1,1,0)', 'Si tiene vacaciones cargadas en PayRoll', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C025', 'Dia vacaciones trabajado', 'S', ' ', 'IIF(KHVAC>0 AND KHHPR>0,1,0)', 'Si tiene vacaciones cargadas en PayRoll y vino', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C030', 'Dia con teórico de trabajo', 'S', ' ', 'IIF(KHTOT>0,1,0)', 'Si tiene teorico de trabajo cargado', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C035', 'Dia con llegada tarde ', 'S', ' ', 'IIF(KHATRE>=0.25 AND KHTOT>0,1,0)', 'Si entro tarde ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C040', 'Horas de ausencia ', 'S', ' ', 'KHAUSEN', 'Horas de ausencia en el día, SIN considerar la llegada tarde que va en otro item', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C045', 'Horas de presencia', 'S', ' ', 'KHHPR', 'Total de horas de presencia en el dia', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C050', 'Horas de presencia en teórico ', 'S', ' ', 'KHHPR', 'Horas presencia en teorico', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C055', 'Horas llegada tarde directas', 'S', ' ', 'IIF(KHTOT > 0,KHATRE,0)', 'Horas de llegada tarde sin tener en cuenta permisos', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C100', 'Horas nocturnas ', 'S', ' ', 'IIF(KHFR>0,0,IIF(KHHO>=21 OR KHHO<5,KHFH,0))', 'Trabajadas entre las 21 y las 6', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C110', 'Horas trabajadas', 'S', ' ', 'IIF(KHFR=0 AND KHDT=1,KHFH,0)', 'Horas de presencia como fraccion horaria



IIF((BETWEEN(KHDS,2,6) OR KHDS=7 AND KHHO<13) AND KHFE=0 AND KHFR=0 AND KHDT=1,KHFH,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C120', 'Horas extra 50% ', 'S', ' ', 'IIF(KHHEXT=99 AND (BETWEEN(KHDS,2,6) OR KHDS=7 AND KHHO<13) AND KHFE=0 AND KHFR=0 AND KHDT=0,KHFH,0)', 'Si tiene autorizacion,y es lunes a viernes o sabado antes de las 13 y no es feriado y no es franco y está fuera del teórico



IIF(KHHEXT=99 AND (BETWEEN(KHDS,2,6) OR KHDS=7 AND KHHO<13) AND KHFE=0 AND KHFR=0 AND KHDT=0,KHFH,0)



IIF(KHHEXT=99 AND (BETWEEN(KHDS,2,6) OR KHDS=7 AND KHHO<13) AND KHFE=0 AND KHFR=0 AND KHDT=0,KHFH,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C130', 'Horas extra 100%', 'S', ' ', 'IIF(KHHEXT=99 AND (KHDS=1 OR KHDS=7 AND KHHO>=13 OR KHFE>0 OR KHFR>0) ,KHFH,0)', 'Si tiene autorizacion y es domingo o sabado despues de las 13 o feriado o franco



IIF(KHHEXT=99 AND (KHDS=1 OR KHDS=7 AND KHHO>=13 OR KHFE>0 OR KHFR>0) ,KHFH,0)





IIF(KHDT=0,SUMARCCH(Q.CODIGO,1,KHFH),0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C131', 'Hs. desc. de cc ', 'S', ' ', 'IIF(VALITEMX(''C8HTAR'')>0, -SUMARCCH(Q.CODIGO,1,-VALITEMX(''C8HTAR'')),0)', 'SALDOCC(Q.CODIGO,1)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C132', 'Horas extras desc. de CC', 'S', ' ', 'IIF(VALITEMX(''C9HECC'')>0 AND SALDOCC(Q.CODIGO,1)>0, -VALITEMX(''C9HECC''),0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C140', 'Horas trabajadas sumadas a cta cte', 'S', ' ', 'IIF(KHNOV=13100 AND KHDT=0,SUMARCCH(Q.CODIGO,1,KHFH),0)', 'Si tiene cargada la novedad y está fuera de teórico



IIF(KHNOV=13100 AND KHDT=0,SUMARCCH(Q.CODIGO,1,KHFH),0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C200', 'Horas ausencia sin aviso', 'S', ' ', 'IIF(KHNOV=0 AND KHNGC=0 AND KHHPR>0 AND KHDT=1 AND KHNE>0,KHFH,0)', 'AUSENTE EN TEORICO SIN NOVEDAD CARGADA CON ALGUNA HORA TRABAJADA', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C210', 'Horas ausencia con aviso', 'S', ' ', 'IIF(KHNOV=10201 AND KHDT>0, KHFH,0)', 'AUSENTE EN TEORICO CON NOVEDAD CARGADA', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C220', 'Horas ausencia cargo empresa', 'S', ' ', 'IIF(KHNOV=10205 AND KHDT>0,KHFH,0)', 'AUSENTE EN TEORICO CON NOVEDAD CARGADA', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C230', 'Horas llegada tarde con permiso ', 'S', ' ', 'IIF(KHNOV=10210 AND KHDT>0,KHFH,0)', 'AUSENTE EN TEORICO CON NOVEDAD CARGADA', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C231', 'Autorizacion Salida Anticipada', 'S', ' ', 'IIF(KHNOV=10220 AND KHDT>0,KHFH,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C235', 'Dia con franco', 'S', ' ', 'IIF(KHFR=1,1,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C240', 'Horas ausencia por enfermedad ', 'S', ' ', 'IIF(KHNOV=10215 AND KHDT>0,KHFH,0)', 'AUSENTE EN TEORICO CON NOVEDAD CARGADA', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C241', 'Horas x Examen', 'S', ' ', 'IIF((KHBN1C=10220 OR KHBN2C=10220 OR KHBN3C=10220) AND KHDT>0,KHFH,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C242', 'Horas x donacion Sangre ', 'S', ' ', 'IIF((KHBN1C=10225 OR KHBN2C=10225 OR KHBN3C=10225) AND KHDT>0,KHFH,0)', 'IIF((KHBN1C=10225 OR KHBN2C=10225 OR KHBN3C=10225) AND KHDT>0,KHFH,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C243', 'Hs. x nacimiento', 'S', ' ', 'IIF((KHBN1C=10230 OR KHBN2C=10230 OR KHBN3C=10230) AND KHDT>0,KHFH,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C244', 'Horas x Nacimiento', 'S', ' ', 'IIF((KHBN1C=10235 OR KHBN2C=10235 OR KHBN3C=10235) AND KHDT>0,KHFH,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C245', 'Horas x Fallecimiento ', 'S', ' ', 'IIF((KHBN1C=10240 OR KHBN2C=10240 OR KHBN3C=10240) AND KHDT>0,KHFH,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C246', 'Horas Gremiales ', 'S', ' ', 'IIF((KHBN1C=10245 OR KHBN2C=10245 OR KHBN3C=10245)AND KHDT>0,KHFH,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C250', 'Horas tomadas de CC ', 'S', ' ', 'IIF(KHNOV=13200 AND KHDT>0,-SUMARCCH(Q.CODIGO,1,-KHFH),0)', 'AUSENTE EN TEORICO CON NOVEDAD CARGADA', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C559', 'Feriado Trabajado ', 'S', ' ', 'IIF((KHFE=1 AND KHDC=0) OR (KHVFE=1 AND KHDC=1 AND (VALITEMX(''C1HFER'')>VALITEMX(''C1HSVF''))) AND KHTOT>0 AND KHHPR>=4 AND Q.CONVENIO<>1, 1,0)', 'IIF((KHFE=1 AND KHDC=0) OR (KHVFE=1 AND KHDC=1) AND KHTOT>0 AND KHHPR>=4 AND Q.CONVENIO<>1, 1,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C560', 'Dia del gremio 1', 'S', ' ', 'IIF(KHDIA = 19 AND KHMES = 10 AND Q.CONVENIO=100 ANDKHHPR>=4, 1,0)', ' IIF(KHDIA = 19 AND KHMES = 10 AND Q.CONVENIO=100, 1,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C561', 'Dia del Gremio 2', 'S', ' ', 'IIF(KHDIA = 2 AND KHMES = 8 AND Q.CONVENIO=200 ANDKHHPR>=4, 1,0)', ' IIF(KHDIA = 2 AND KHMES = 8 AND Q.CONVENIO=200, 1,0)

', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C580', 'Dia Trabajado ', 'S', ' ', 'IIF(KHHPR>4 AND KHNOV=0,1,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C590', 'Pierde Presentismo 2 dias continuos ', 'S', ' ', 'IIF(HISTORF(''C8DLLT'',KHDIA,HOY()-2,HOY())>=2,1,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C591', 'Pierde el presentismo 3 dias en el mes', 'S', ' ', 'IIF(KHDIA=20 AND HISTORF(''C8DLLT'',KHDIA,HOY()-30,HOY())>=3,1,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C592', 'Descontar presentismo ', 'S', ' ', 'VALITEMX(''C9PRE3'') + VALITEMX(''C9PRES'')', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C600', 'Dias ausencia sin aviso ', 'S', ' ', 'IIF(KHTOT>0 AND KHHPR<=4 AND KHNGC=0 AND KHVAC=0,1,0)', 'TIENE TEORICO, NO VINO Y NO TIENE NOVEDAD', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C610', 'Dias ausencia con aviso ', 'S', ' ', 'IIF(KHTOT>0 AND KHHPR=0 AND EXISTENOVGC(10101) AND NOT EXISTENOVGC(10105) AND NOT EXISTENOVGC(10110) AND NOT EXISTENOVGC(10115) AND NOT EXISTENOVGC(10120) AND NOT EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOT EXISTENOVGC(10170) AND NOT EXISTENOVGC(10175) AND KHVAC=0,1,0)', 'CON TEORICO, AUSENTE, CON NOVEDAD ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C620', 'Dia licencia conce de sueldo ', 'S', ' ', 'IIF(KHTOT>0 AND KHHPR=0 AND EXISTENOVGC(10105) AND NOT EXISTENOVGC(10110) AND NOT EXISTENOVGC(10115) AND NOT EXISTENOVGC(10120) AND NOT EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C630', 'Dia licencia accidente cargo ART', 'S', ' ', 'IIF(KHTOT>0 AND KHHPR=0 AND EXISTENOVGC(10110) AND NOT EXISTENOVGC(10115) AND NOT EXISTENOVGC(10120) AND NOT EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOT EXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', 'CON TEORICO, TRABAJO MENOS QUE EL TEORICO CON NOVEDAD CARGADA', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C640', 'Dialicencia accidente cargo empresa ', 'S', ' ', 'IIF(KHHPR=0 AND EXISTENOVGC(10115) AND NOT EXISTENOVGC(10120) AND NOT EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', 'CON TEORICO AUSENTE TODO EL DIA NOVEDAD CARGADA

IIF(KHTOT>0 AND KHHPR=0 AND EXISTENOVGC(10115) AND NOT EXISTENOVGC(10120) AND NOT EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)



SIN TEORICO

IIF(KHHPR=0 AND EXISTENOVGC(10115) AND NOT EXISTENOVGC(10120) AND NOT EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C650', 'Dia licencia por donación de sangre ', 'S', ' ', 'IIF(KHTOT>0 AND KHHPR=0 AND EXISTENOVGC(10120) AND NOT EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOT EXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C660', 'Dia licencia por enfermedad ', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C661', 'Dias Enf Familiar ', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) ANDEXISTENOVGC(10126) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C670', 'Dia lic por excedencia', 'S', ' ', 'IIF(Q.SEXO=''F'' AND KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1+ VALASIGN(@KHAUX8,10)*0,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C680', 'Dia licencia por examen ', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', '12/08/2008

IIF(KHTOT>0 AND KHHPR=0 AND EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C690', 'Dia licencia por fallecimiento familiar ', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C700', 'Dia licencia gremial', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C710', 'Dia licencia por maternidad ', 'S', ' ', 'IIF(Q.SEXO=''F'' AND KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1+ VALASIGN(@KHAUX8,5)*0,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C711', 'Dias maternidad Down', 'S', ' ', 'IIF(Q.SEXO=''F'' AND KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10151) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1+ VALASIGN(@KHAUX8,11)*0,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C720', 'Dia licencia por matrimonio ', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C730', 'Dia licencia por mudanza', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOT EXISTENOVGC(10170) AND NOTEXISTENOVGC(10175),1,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C740', 'Dia licencia por nacimiento ', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10165) AND NOT EXISTENOVGC(10170) AND NOTEXISTENOVGC(10175),1,0)', 'IIF(KHTOT>0 AND KHHPR=0 AND EXISTENOVGC(10165) AND NOT EXISTENOVGC(10170) AND NOTEXISTENOVGC(10175),1,0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C750', 'Dia licencia since de sueldo ', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1+ VALASIGN(@KHAUX8,13)*0,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C760', 'Dia suspension', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10175),1+ VALASIGN(@KHAUX8,6)*0,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C780', 'Dias por Vacaciones ', 'S', ' ', 'IIF(KHVAC=1,1+ VALASIGN(@KHAUX8,12)*0,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C785', 'Lic. Dia Femenino ', 'S', ' ', 'IIF(KHTOT>0 AND (KHHPR=0 OR KHHPR<=4) AND EXISTENOVGC(10185),1,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C790', 'Dias de reserva de Puesto ', 'S', ' ', 'IIF(KHTOT>0 AND KHHPR=0 AND EXISTENOVGC(10180) AND NOT EXISTENOVGC(10110) AND NOT EXISTENOVGC(10115) AND NOT EXISTENOVGC(10120) AND NOT EXISTENOVGC(10125) AND NOT EXISTENOVGC(10130) AND NOT EXISTENOVGC(10135) AND NOT EXISTENOVGC(10140) AND NOT EXISTENOVGC(10145) AND NOT EXISTENOVGC(10150) AND NOT EXISTENOVGC(10155) AND NOT EXISTENOVGC(10160) AND NOT EXISTENOVGC(10165) AND NOTEXISTENOVGC(10170) AND NOT EXISTENOVGC(10175),1+ VALASIGN(@KHAUX8,14)*0,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C801', 'Sit. de revista 01 ACTIVO ', 'S', ' ', 'IIF(KHAUX8=1 AND (KHDIA=1 OR KHAUX7<>1), KHDIA, 0)', 'Solo Mensuales

IIF(KHAUX8=1 AND (KHDIA=1 OR KHAUX7<>1), KHDIA, 0)





con Jornales

IIF(KHAUX8=1 AND (((KHDIA=1 OR KHAUX7<>1) AND Q.CLASE=1) OR ((KHDIA=16 OR KHAUX7<>1) AND Q.CLASE=2)), KHDIA, 0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C805', 'Sit. de Revista 5 - Maternidad', 'S', ' ', 'IIF(KHAUX8=5 AND (KHDIA=1 OR KHAUX7<>5), KHDIA, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C806', 'Sit. de Revista 06-Suspension ', 'S', ' ', 'IIF(KHAUX8=6 AND (KHDIA=1 OR KHAUX7<>6), KHDIA, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C810', 'Situacion de Revista 10 - Excedencia', 'S', ' ', 'IIF(KHAUX8=10 AND (KHDIA=1 OR KHAUX7<>10), KHDIA, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C811', 'Sit. de revista 11 - Mater. Down', 'S', ' ', 'IIF(KHAUX8=11 AND (KHDIA=1 OR KHAUX7<>11), KHDIA, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C812', 'Sit. de revista 12 - vacaciones ', 'S', ' ', 'IIF(KHAUX8=12 AND (KHDIA=1 OR KHAUX7<>12), KHDIA, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C813', 'Sit. de revista 13 Lic. s/Goce de Sueldo', 'S', ' ', 'IIF(KHAUX8=13 AND (KHDIA=1 OR KHAUX7<>13), KHDIA, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C814', 'Sit. de revista 14 reserva de puesto', 'S', ' ', 'IIF(KHAUX8=14 AND (KHDIA=1 OR KHAUX7<>14), KHDIA, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C900', 'HS. 50% FINALES ', 'S', ' ', 'IIF(VALITEMX(''C1HE50'')>.25,INT(VALITEMX(''C1HE50'')*2)/2,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C901', 'HS. 100% FINALES', 'S', ' ', 'IIF(VALITEMX(''C1HE10'')>.25,INT(VALITEMX(''C1HE10'')*2)/2,0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C990', 'Inicio de liq. del Dia', 'S', ' ', 'VALASIGN(@KHAUX7, VALITMAYER(''CSITRE''))*0 + VALASIGN(@KHAUX8, 1)*0', 'VALASIGN(@KHAUX7, VALITMAYER(''CSITRE''))*0 + VALASIGN(@KHAUX8, 1)*0', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('C991', 'Sit. de revista INFO', 'S', ' ', 'KHAUX8', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('cofo', 'descrip ', 'd', 't', ' ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F002', 'Ing. Rem. Variables p/ ILT ART', 'S', 'N', 'IIF((O.H00361+O.H00362)>0, IIF(HS;I.RVDART;-1;0;1234567H>0,HS;I.RVDART;-1;0;1234567H,HS;I.REMVAR;-1;5;1234567H/6),0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F010', 'Sueldo Básico ', 'S', 'N', 'I.SUEBAS', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F011', 'Ingreso base diario ILT ART ', 'S', 'N', 'IIF((I.H00361+I.H00362)>0,((I.REMNYH+I.RVDART)*13/12)/30,0)', 'IIF(O.H00361>0,((I.REMNYH+HS;I.REMVAR;-1;5;1234567H/6)*13/12)/30,HS;I.ARTIBD;-1;0;1234567H)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F012', 'Horas extras al 50% ', 'S', 'N', 'I.REMNYH/200 * 1.5', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F013', 'Horas extras al 100%', 'S', 'N', 'I.REMNYH/200 * 2', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F014', 'Plus hs nocturnas ', 'S', 'N', 'I.SUEBAS * 0.13334 * KVAL', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F015', 'A cuenta futuros aumentos ', 'S', 'N', 'A2;1A', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F016', 'Jornada Diaria', 'S', 'N', 'Q.HORARIO', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F031', 'Años Antiguedad ', 'S', 'N', 'EDAD(MIN(M.FECHA_XTR,M.FECHA_ING),S_FELIQ)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F039', 'Aporte adicional Obra social S', 'S', 'N', 'AC(29)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F119', 'Contribucion Diferencial', 'S', 'N', 'IIF(Q.COD_INE>1500 AND Q.COD_INE<1599, IIF(HS;I.CONDIF;0;0;123456H=0,5,0),0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F130', 'Desc. días por ingreso/egreso ', 'S', 'N', 'I.REMNYH/30 * F(742)*-1', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F131', 'Descuento días de vacaciones', 'S', 'N', ' F(783)/30 * F(732) * -1', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F132', 'Desc. dias por licencias pagas', 'S', 'N', 'I.REMNYH/30 * F(740) * -1', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F133', 'Lic. norm. div 30 + variables ', 'S', 'N', '(I.REMNYH + HS;I.REMVAR;-1;5;1234567H/6)/30 * KVAL', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F134', 'Descuento licencias injustificadas', 'S', 'N', 'I.REMNYH/30 * KVAL *-1', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F135', 'Licencia I.L.T. Empresa ', 'S', 'N', '((I.REMNYH+HS;I.REMVAR;-1;5;1234567H/6)*13/12)/30 * KVAL', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F136', 'Lic norm. Div 30 s/variables', 'S', 'N', 'I.REMNYH/30 * KVAL', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F137', 'Lic esp div 25 + variables', 'S', 'N', '(I.REMNYH + HS;I.REMVAR;-1;5;1234567H/6)/25 * KVAL', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F138', 'Promedio 3 Meses Maternidad ', 'S', 'N', 'IIF(O.H00600<>0,IIF(HS;O.H00600;-1;0;7H<>0,HS;I.PROM03;-1;0;7H,HS;I.REMVAR;-1;2;1234567H/3),0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F139', 'Desc. Maternidad', 'S', 'N', '(I.REMNYH/30) * KVAL * -1', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F140', 'Licencia I.L.T. ART ', 'S', 'N', 'I.ARTIBD * KVAL', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F141', 'Vacaciones', 'S', 'N', '(IIF(HS;I.REMNYH;0;0;7H>0, HS;I.REMNYH;0;0;7H, MAX(I.REMNYH,HS;I.REMNYH;-1;0;7H)) + MAX(HS;I.REMVAR;-1;5;7H/6, HS;I.REMVAR;-1;11;7H/12))/25 * I.DIAVAP', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F191', 'SAC ', 'S', 'N', 'PIIF(HS;I.H00903;0;0;1234567H=0, SAC41(IIF(MONTH(S_FELIQ)<7, 1, 7), YEAR(S_FELIQ), 6, .T., 0, ''N'', I.INFSAC, ''1234567'', ''S'', ''1234567''), 0)P', ' - Condición de liquidación en mensualidad y sac egreso en el mismo campo

PIIF(MONTH(S_fELIQ)=6 OR MONTH(S_fELIQ)=12 OR m.fecha_ret<=S_FELIQ, SAC41(IIF(MONTH(S_FELIQ)<7, 1, 7), YEAR(S_FELIQ), 6, .T., 0, ''N'', KVAL, ''1234567'', ''S'', ''1234567''))P', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F193', 'SAC Proporcional', 'S', 'N', 'PIIF(M.FECHA_RET<=S_FELIQ AND HS;I.H00901;0;0;1234567H=0, SAC41(IIF(MONTH(S_FELIQ)<7, 1, 7), YEAR(S_FELIQ), 6, .T., 0, ''N'', KVAL, ''1234567'', ''S'', ''1234567''), 0)P', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F194', 'SAC Adicional ', 'S', 'N', 'PESSAC(I.H00901)P', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F220', 'Prestamos otorgados ', 'S', 'N', 'O.PRESTA', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F221', 'Anticipo de vacaciones', 'S', 'N', 'IIF(Q.REGPAG=''M'', (IIF(HS;I.REMNYH;0;0;7H>0, HS;I.REMNYH;0;0;7H, HS;I.REMNYH;-1;0;7H) + MAX(HS;I.REMVAR;-1;5;1234567H/6, HS;I.REMVAR;-1;11;1234567H/12)) / 25 * (100 - F(923))/100, 0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F222', 'Descuento anticipo de sueldos ', 'S', 'N', 'HS;I.E00011;0;0;1234567H', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F250', 'Indemnización Antigüedad', 'S', 'N', 'IIF(Q.MOTI_RET=4 AND HS;I.E00250;0;0;1234567H=0, IIF(A6;1A=1, MAX(MAX(MIN(I.MEJRNH,T49;Q.CONVENIO;1T)* F(726), I.MEJRNH),I.MEJRNH* F(726)*0.67),MAX(MIN(I.MEJRNH,T49;Q.CONVENIO;1T)* F(726), I.MEJRNH)),0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F251', 'Indem. Sustitutiva preaviso ', 'S', 'N', 'IIF(Q.MOTI_RET=4 OR Q.MOTI_RET=5 AND HS;I.E00251;0;0;1234567H=0, (I.REMNYH + HS;I.REMNYH;0;0;1234567H + HS;I.REMVAR;-1;5;1234567H/6) * F(741), 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F252', 'SAC Indem. Sustit. Preaviso ', 'S', 'N', 'I.E00251/12', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F253', 'Integración mes de despido', 'S', 'N', 'IIF(Q.MOTI_RET=4 AND HS;I.E00252;0;0;1234567H=0, (I.REMNYH + HS;I.REMNYH;0;0;1234567H + HS;I.REMVAR;-1;5;1234567H/6)/30 * F(926), 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F254', 'SAC Integración mes de despido', 'S', 'N', 'I.E00253/12', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F255', 'Indem. Vacaciones nozadas', 'S', 'N', 'IIF(M.FECHA_RET<=S_FELIQ AND HS;I.E00255;0;0;1234567H=0, F(781)/25 * F(927), 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F256', 'SAC Indem. Vac. nozadas', 'S', 'N', 'I.E00255/12', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F257', 'Indemnizacion por fallecimiento ', 'S', 'N', 'IIF(Q.MOTI_RET=3 AND HS;I.E00257;0;0;1234567H=0, MAX(MIN(I.MEJRNH, T49;Q.CONVENIO;1T) * F(726), I.MEJRNH)*0.5, 0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F301', 'Aporte Jubilación (SIJP)', 'S', 'N', 'I.REMU01 * F(701)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F302', 'Aporte Ley 19.032 (INSSJP)', 'S', 'N', 'I.REMU05 * F(702)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F303', 'Aporte Obra Social', 'S', 'N', 'I.REMU04 * F(703)/100+AGRE_DESC(VT(4,Q.COD_ISA,0))', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F304', 'Aporte Adherente Obra Social', 'S', 'N', 'I.REMU04 * F(704)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F305', 'Aporte Obra Social (sa) ', 'S', 'N', 'I.REMU04 * F(705)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F306', 'Aporte Adherente O.S. (sa)', 'S', 'N', 'I.REMU04 * ( F(706) * KDER)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F307', 'Aporte ANSSAL ', 'S', 'N', 'I.REMU04 * F(707)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F350', 'Diferencia de plan prepaga', 'S', 'N', 'I.DPEMPL+AGRE_DESC(VT(26,Q.SEN_NIV,0))', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F380', 'Devolución pendiente RG 3073', 'S', 'N', 'IIF(NOT M.FECHA_RET<=S_FELIQ AND MONTH(IIF(S_MESPAG=''S'',S_FECHA_PAG,S_FELIQ))<>12,IIF(I.IMPUES>0,MIN(I.IGPANT,I.IMPUES)*-1,0),I.IGPANT*-1)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F399', 'Impuesto a las ganancias', 'S', 'N', 'PIMPUE41(C_LL=1,''67'',IIF(M.FECHA_RET<=S_FELIQ,S_PERI,''''),IIF(I.INFGAN=0.01,0.0001,I.INFGAN),''67'',.F.,1,.F.,.F.,(KTHA+KTHN)*35/100,.F.,.F.,.T.,.F.,.F.)P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F400', 'SRF123', 'S', 'N', 'AC(123)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F401', 'SRF124', 'S', 'N', 'AC(124)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F402', 'SRF126', 'S', 'N', 'AC(126)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F403', 'SRF127', 'S', 'N', 'AC(127)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F404', 'SRF128', 'S', 'N', 'AC(128) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F405', 'SRF129', 'S', 'N', 'AC(129) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F406', 'SRF130', 'S', 'N', 'AC(130) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F407', 'SRF131', 'S', 'N', 'AC(131) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F408', 'SRF132', 'S', 'N', 'AC(132) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F409', 'SRF133', 'S', 'N', 'AC(133)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F410', 'SRF134', 'S', 'N', 'AC(134)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F411', 'SRF135', 'S', 'N', 'AC(135) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F412', 'SRF147', 'S', 'N', 'AC(147) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F413', 'SRF148', 'S', 'N', 'AC(148) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F414', 'SRF149', 'S', 'N', 'AC(149) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F415', 'SRF158', 'S', 'N', 'AC(158) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F416', 'SRF168', 'S', 'N', 'AC(168)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F417', 'SRF169', 'S', 'N', 'AC(169) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F418', 'SRF173', 'S', 'N', 'AC(173) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F419', 'SRF178', 'S', 'N', 'AC(178) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F420', 'SRF179', 'S', 'N', 'AC(179) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F421', 'Descuento Anticipo Vacaciones ', 'S', 'N', 'IIF(I.SDODIA>0, I.SDOADE/I.SDODIA * I.DIASVN, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F422', 'SRF180', 'S', 'N', 'AC(180) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F423', 'SRF181', 'S', 'N', 'AC(181) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F424', 'SRF182', 'S', 'N', 'AC(182) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F425', 'SRF183', 'S', 'N', 'AC(183) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F426', 'SRF139', 'S', 'N', 'AC(139) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F427', 'SRF153', 'S', 'N', 'AC(153) ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F428', 'SRF184', 'S', 'N', 'AC(184)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F429', 'SRF 185 ', 'S', 'N', 'AC(185)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F430', 'Embargo Judicial', 'S', 'N', 'MIN(MAX(0, KACU - HS;I.D00030;0;0;1234567H), F(782) * F(730)/100)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F431', 'SRF 186 ', 'S', 'N', 'AC(186)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F432', 'SRF 187 ', 'S', 'N', 'AC(187)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F433', 'SRF 188 ', 'S', 'N', 'AC(188)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F434', 'SRF 189 ', 'S', 'N', 'AC(189)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F435', 'SRF 190 ', 'S', 'N', 'AC(190)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F436', 'SRF 191 ', 'S', 'N', 'AC(191)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F437', 'SRF 192 ', 'S', 'N', 'AC(192)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F438', 'SRF 193 ', 'S', 'N', 'AC(193)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F439', 'SRF 194 ', 'S', 'N', 'AC(194)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F440', 'Dto. Cuota Alimentaria s/sueldos', 'S', 'N', '((HS;R.KTHT;0;0;1234567H+KTHT)*KVAL/100)-HS;I.D00009;0;0;1234567H', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F441', 'Desc. Cuota Alimentaria s/neto', 'S', 'N', '((HS;I.A000;0;0;1234567H+HS;I.D00010;0;0;1234567H+KTHT-KTDL-KTDE-KTDS)*KVAL/100)-HS;I.D00010;0;0;1234567H', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F472', 'IG: Art. 3 - RG 3976 SAC', 'S', 'N', 'IIF(M.FECHA_RET<=S_FELIQ,0,(KTHA-I.SIJPAG)/12)+I.A0I009+I.A1I009', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F474', 'IG: IG: Art. 3 - RG 3976 SAC Otros Peri ', 'S', 'N', 'IIF(M.FECHA_RET<=S_FELIQ AND ARMAAMES(S_FELIQ)<>''201701'',0,(HS;R.KTHA;0;0;1234567H-HS;I.SIJPAG;0;0;1234567H)/12 - HS;I.IGI009;0;0;1234567H)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F501', 'IG: Ingresos en la empresa', 'S', 'N', 'KAFI - AC(31)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F503', 'IG: Ingresos Prorrateados ', 'S', 'N', 'KPRIN', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F504', 'IG: ART 3 - RG 3976 SAC ', 'S', 'N', 'I.IGI009', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F505', 'IG: Tickets ', 'S', 'N', 'AC(31)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F506', 'IG: Dif. de plan Empresa', 'S', 'N', 'I.DPEMPR', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F510', 'IG: Ingresos en Otras Empresas', 'S', 'N', 'I.IGINOE', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F521', 'IG: Ded. Jubilacion y Ley 19.032', 'S', 'N', 'IIF(KTHP<>0, (I.REMU01 - PKTHPJP) * F(701)/100 + (I.REMU05 - KTHP) * F(702)/100, AC(32))', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F522', 'IG: Ded. Jubilacion y Ley Prorr.', 'S', 'N', 'KPRJU', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F525', 'IG: Ded. Obra Social', 'S', 'N', 'IIF(KTHP<>0, (I.REMU04 - KTHP) * ( F(703) + F(704))/100, AC(33))', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F526', 'IG: Ded. Obra SocialProrr.', 'S', 'N', 'KPROS', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F533', 'IG: Ded. Seguro de Vida ', 'S', 'N', 'MIN(I.IGVIDA + PHISITEMANU(''I'',''IGVIDA'')P, T100;52;1T/12 * F(570)) - ACUMIGA(''VIDA'')', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F534', 'IG: Ded. Gastos de Sepelio', 'S', 'N', 'MIN(I.IGSEPE + PHISITEMANU(''I'',''IGSEPE'')P, T100;54;1T/12 * F(570)) - ACUMIGA(''SEPE'')', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F535', 'IG: Ded. Inter. Créd. Hipotecarios', 'S', 'N', 'MIN(I.IGHIPO + PHISITEMANU(''I'',''IGHIPO'')P, T100;53;1T/12 * F(570)) - ACUMIGA(''HIPO'')', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F536', 'IG: Ded. Sevicios Domésticos', 'S', 'N', 'MIN(I.IGSDOM + PHISITEMANU(''I'',''IGSDOM'')P,DEDART23( F(570),1))-ACUMIGA(''SDOM'')', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F537', 'IG: Ded. Impuesto al cheque ', 'S', 'N', '(I.IGDECR + PHISITEMANU(''I'',''IGDECR'')P) * 0.34 - ACUMIGA(''ICHE'')', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F539', 'IG: Ded. Aportes sindicales ', 'S', 'N', 'AC(34)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F540', 'IG: Gastos x comp. tarj credito extr', 'S', 'N', 'I.IGDCEX', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F550', 'IG: Determinación de EX_KGANET', 'P', 'N', 'RELEASE EX_KGANET

PUBLIC EX_KGANET



EX_KGANET = KGANET



RETURN 0', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F551', 'IG: Ded Diferencia de Plan', 'S', 'N', 'MIN(I.IGDIFP + I.DPEMPL + I.DPEMPR + PHISITEMANU(''I'',''DPEMPL,DPEMPR,IGDIFP'')P, F(571)) - ACUMIGA(''DIFP'')', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F553', 'IG: Ded. Donaciones ', 'S', 'N', 'MIN(I.IGDONA + PHISITEMANU(''I'',''IGDONA'')P, F(571)) - ACUMIGA(''DONA'')', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F554', 'IG: Ded. Honorarios Médicos ', 'S', 'N', 'MIN((I.IGHONO + PHISITEMANU(''I'',''IGHONO'')P) * 40/100, F(571)) - ACUMIGA(''HONO'')', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F570', 'IG: Mes de impuesto a las ganancias ', 'S', 'N', 'IIF(M.FECHA_RET <= S_FELIQ, 12, MONTH(IIF(S_MESPAG=''S'', S_FECHA_PAG, S_FELIQ)))', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F571', 'IG: Tope 5% Gcia. Neta Acumulada', 'S', 'N', 'MAX(0,PEX_KGANETP * 5/100)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F597', 'IG:Devolución pendiente anterior RG3073 ', 'S', 'N', 'HS;I.IGPANT;-1;0;1234567H', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F612', 'Asignación por Prenatal ', 'S', 'N', 'PIIF(I.TRAMOF>0, S_TRAMO(I.TRAMOF), 0)P * MAX(KVAL, 1)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F650', 'Prov. de SAC Acumulada', 'S', 'N', 'IIF(MONTH(S_FELIQ)=1 OR MONTH(S_FELIQ)=7, 0,HS;I.PSACAC,P00011;-1;0;1234567H)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F651', 'Provisión de SAC', 'S', 'N', 'IIF((HS;I.SACPRO;0;0;5H+I.SACPRO)<>0, (HS;I.SACPRO;0;0;5H+I.SACPRO), PSAC41(IIF(MONTH(S_FELIQ)<7,1,7),YEAR(S_FELIQ),6,.F.,0,''S'',KVAL,''1234567'',''S'', ''1234567'')P) - I.PSACAC', '28.10.2013

IIF((HS;I.SIJPAG;0;0;5H+AC(14))<>0, (HS;I.SIJPAG;0;0;5H+AC(14)), PSAC41(IIF(MONTH(S_FELIQ)<7,1,7),YEAR(S_FELIQ),6,.F.,0,''S'',KVAL,''1234567'',''S'', ''1234567'')P) - I.PSACAC', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F652', 'SAC para provision', 'S', 'N', 'AC(61)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F653', 'Prov. Acum. Contrib. s/SAC', 'S', 'N', 'IIF(MONTH(S_FELIQ)=1 OR MONTH(S_FELIQ)=7, 0, HS;I.PCSSAC,P00014;-1;0;1234567H)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F654', 'Provisión Contribuciones s/SAC', 'S', 'N', 'IIF(I.SACPRO+HS;I.SACPRO;0;0;5H<>0, I.C00002+I.C00007+I.C00012+I.C00017+I.C00022+I.C00027+I.C00037+HS;I.C00002,C00007,C00012,C00017,C00022,C00027,C00037;0;0;5H, (I.PSACAC + I.P00011) * ( F(722) + F(718))/100) - I.PCSSAC', '04.12.2013

IIF(I.SACPRO<>0, I.C00002+I.C00007+I.C00012+I.C00017+I.C00022+I.C00027+I.C00037, (I.PSACAC + I.P00011) * ( F(722) + F(718))/100) - I.PCSSAC



29.11.2013

IIF(AC(14)<>0, I.C00002+I.C00007+I.C00012+I.C00017+I.C00022+I.C00027+I.C00037, (I.PSACAC + I.P00011) * ( F(722) + F(718))/100) - I.PCSSAC', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F655', 'Prov. Contrib. Acum. s/vacaciones ', 'S', 'N', 'IIF(MONTH(S_FELIQ)=1,0, HS;I.PCAVAC,P00024;-1;0;67H)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F656', 'Prov. Contrib. s/plus vacacional Acum ', 'S', 'N', 'IIF(MONTH(S_FELIQ)=1,0, HS;I.PCAPVA,P00025;-1;0;67H)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F660', 'Prov. de Vacaciones acumulada ', 'S', 'N', 'IIF(MONTH(S_FELIQ)=1, 0, HS;I.PVACAC,P00021;-1;0;67H)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F661', 'Provision de Vacaciones ', 'S', 'N', '(I.REMNYH + HS;I.REMVAR;-1;5;1234567H/6)/25 * I.PVACDS / 12 * MONTH(S_FELIQ) - I.PVACAC', '22.Ene.2009 - Se calcula por acumulado

(I.REMNYH + HS;I.REMVAR;-1;5;1234567H)/25 * F(725) / 12 ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F662', 'Provisión Plus de Vacaciones', 'S', 'N', '((I.REMNYH + HS;I.REMVAR;-1;5;1234567H/6)/25 - I.REMNYH/30) * I.PVACDS / 12 * MONTH(S_FELIQ) - I.PPVAAC', '24.Nov.2011 - Se elimina la REMNYH de la base de calculo que divide sobre 30

((I.REMNYH + HS;I.REMVAR;-1;5;1234567H/6)/25 - (I.REMNYH + HS;I.REMVAR;-1;5;1234567H/6)/30) * I.PVACDS / 12 * MONTH(S_FELIQ) - I.PVACAC', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F663', 'Prov plus vacacional acumulada', 'S', 'N', 'IIF(MONTH(S_FELIQ)=1, 0, HS;I.PPVAAC,P00022;-1;0;67H)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F664', 'Provisión Contribuciones s/Vac', 'S', 'N', 'I.P00021 * F(722)/100 + MIN(I.P00021, PTOPE("APSIJP")P) * F(718)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F665', 'Provisión Contrib. s/Plus Vac.', 'S', 'N', 'I.P00022 * F(722)/100 + MIN(I.P00022, PTOPE("APSIJP")P * (1/25-1/30)) * F(718)/100', '(I.P00022 * F(722)/100) + (MIN(I.P00022, PTOPE("APSIJP")P * (1/25-1/30)) * F(718)/100)









I.P00022 * F(722)/100 + MIN(I.P00022, PTOPE("APSIJP")P * (1/25-1/30)) * F(718)/100', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F701', 'V.O. Alícuota Aporte SIJP ', 'S', 'N', 'PALICUOTA("APSIJP")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F702', 'V.O. Alícuota Ap. INSSJP', 'S', 'N', 'PALICUOTA("APINSSJP")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F703', 'V.O. Aporte Obra Social ', 'S', 'N', 'PALICUOTA("APOS")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F704', 'V.O. Alícuota Ap Adherente OS ', 'S', 'N', 'PALICUOTA("APADOS")P * KDER', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F705', 'V.O. Aporte O.S. s/ANSSAL ', 'S', 'N', 'PALICUOTA("APOS")P * (100 - ALICUOTA("APANSSAL", I.REMU04 + HS;I.REMU04;0;0;1234567H))/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F706', 'V.O. Aporte Adherente OS (S/A)', 'S', 'N', 'PALICUOTA("APADOS")P * (100 - ALICUOTA("APANSSAL", I.REMU04 + HS;I.REMU04;0;0;1234567H))/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F707', 'V.O. Aporte ANSSAL', 'S', 'N', '(PALICUOTA("APOS")P + ALICUOTA("APADOS") * KDER) * ALICUOTA("APANSSAL", I.REMU04 + HS;I.REMU04;0;0;1234567H)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F708', 'Contrib, Tarea Diferencial', 'S', 'N', 'IIF(Q.COD_INE>1500 AND Q.COD_INE<1599,KTHA*5/100,0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F711', 'V.O. Alícuota Cont. Jubilación (SIJP) ', 'S', 'N', 'ALICUOTA("CONSIJP")', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F712', 'V.O. Alícuota Cont. INSSJP', 'S', 'N', 'PALICUOTA("CONINSSJP")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F713', 'V.O. Alícuota Cont. INSSJP Dto.1263-2641', 'S', 'N', 'PALICUOTA("CONINSSJPD1273")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F714', 'V.O. Alícuota Cont. RENATRE ', 'S', 'N', 'PALICUOTA("CONRENATRE")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F715', 'V.O. Alícuota FNE ', 'S', 'N', 'PALICUOTA("CONFNE")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F716', 'V.O. Alícuota Cont. ANSSAL', 'S', 'N', 'PALICUOTA("CONOS")P * ALICUOTA("CONANSSAL", I.REMU04 + HS;I.REMU04;0;0;1234567H)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F717', 'V.O. Alícuota Cont. Asig. Familiares', 'S', 'N', 'PALICUOTA("CONAAFF")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F718', 'V.O. Alícuota Porcentaje ART (LRT)', 'S', 'N', 'PALICUOTA("CONPORLRT")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F719', 'V.O. Alícuota Cuota Fija ART (LRT)', 'S', 'N', 'PALICUOTA("CONCFLRT")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F720', 'V.O. Alícuota Cont. Vales Alimentarios', 'S', 'N', 'PALICUOTA("CONTICKET")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F721', 'V.O. Alícuota Crédito Fiscal Ley 25.922 ', 'S', 'N', 'PALICUOTA("CREDITOFISCAL")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F722', 'V.O. Suma Alícuotas Cont. s/Tope', 'S', 'N', 'PALICUOTA("CONSIJP") + ALICUOTA("CONINSSJP") + ALICUOTA("CONRENATRE") + ALICUOTA("CONFNE") + ALICUOTA("CONAAFF") - ALICUOTA("CREDITOFISCAL") + ALICUOTA("CONOS")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F723', 'V.O. Suma Alícuotas Cont. c/Tope', 'S', 'N', 'ALICUOTA("CONPORLRT")', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F724', 'V.O. Alícuota Cont. Obra Social ', 'S', 'N', 'PALICUOTA("CONOS")P * (100 - ALICUOTA("CONANSSAL", I.REMU04 + HS;I.REMU04;0;0;1234567H))/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F725', 'V.O. Días de vac. a Dic (Prov. Vac.)', 'S', 'N', 'PDIASVACCOR(M.FECHA_VAC, FINDEANO(S_FELIQ), Q.VAC_BASE)P', '27.Feb.09 - Nuevo procedimiento

PDIASVAC(MIN(S_FELIQ, M.FECHA_RET), ''NP'')P', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F726', 'V.O. Indemnización Antigüedad ', 'S', 'N', 'ANIOSINDAN(MIN(M.FECHA_XTR, M.FECHA_ING),M.FECHA_RET)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F727', 'V.O. Alícuota Cont. O.S. Dto 1273/2641', 'S', 'N', 'PALICUOTA("CONOSD1273")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F728', 'V.O. Alícuota INSSJP Dto. 1273/2641 ', 'S', 'N', 'PALICUOTA("APINSSJPD1273")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F729', 'V.O. Alícuota Ap. O.S. Dto. 1273/2641 ', 'S', 'N', 'PALICUOTA("APOSD1273")P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F730', 'V.O. Alícuota Embargo Judicial Estándar ', 'S', 'N', 'IIF(KVAL<>0, KVAL, IIF(KTHA-AC(6) > IIF(I.SIJPAG>0,3,2)*VT(100,1,1), 20, 10))', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F731', 'V.O. Vacaciones ', 'S', 'N', 'I.DIAVAP', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F732', 'V.O. Descuento días de vacaciones ', 'S', 'N', 'I.DIAVAD', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F733', 'V.O. Afecto a SAC Vac. mes actual ', 'S', 'N', 'PDIASVMN()P', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F734', 'V.O. Afecto a SAC Vac. mes sgte.', 'S', 'N', 'MIN(30, MAX(0, I.DIAVAP - F(733)))', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F735', 'V.O. Afecto a SAC Vac. mes +2 ', 'S', 'N', 'MIN(30, MAX(0, I.DIAVAP - F(733) - F(734)))', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F736', 'V.O. Afecto a SAC Vac. mes +3 ', 'S', 'N', 'MIN(30, MAX(0, I.DIAVAP - F(733) - F(734) - F(735)))', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F737', 'V.O. Alícuota Crédito Fiscal Dto 814', 'S', 'N', 'VT(130,A31;1A,2)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F738', 'VO. Cont. Seg. Col. de Vida Obligatorio ', 'S', 'N', 'VT(9001,8001,1)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F740', 'V.O. Dias por licencias pagas ', 'S', 'N', 'O.H00304+O.H00350+O.H00351+O.H00352+O.H00353+O.H00354+O.H00356+O.H00357+O.H00358+O.H00359+O.H00361+O.H00362+O.H00363+O.H00364+O.H00365', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F741', 'V.O. meses p/indenminz. por preaviso', 'S', 'N', 'IIF(Q.MOTI_RET=5 AND M.FECHA_RET<=GOMONTH(M.FECHA_ING,3)-1,0.5,IIF( F(726)<5,1,2))', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F742', 'V.O. Dias por ingreso / egreso', 'S', 'N', 'I.DSINGR + I.DSEGRE', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F744', 'V.O. Dias trab. Para MNI Ref Lab', 'S', 'N', '(I.DIAPER+HS;I.DIAPER;0;0;1234567H)- (I.SIJAUD+HS;I.SIJAUD;0;0;1234567H) + (I.DIAVAP+HS;I.DIAVAP;0;0;1234567H) - (I.DIAVAD+HS;I.DIAVAD;0;0;1234567H) - (I.DSINGR+I.DSEGRE+HS;I.DSINGR,DSEGRE;0;0;1234567H)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F745', 'Lic. Dta. Para MNI', 'S', 'N', 'KLIC - O.H00361 - O.H00362', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F780', 'V.A. Base Indemnización Antigüedad', 'S', 'N', 'IIF(MIN(I.MEJRNH, T49;Q.CONVENIO;1T) * (KPERI+IIF(KPERIM>=3, 1, 0)) < I.MEJRNH, I.MEJRNH, MIN(I.MEJRNH, T49;Q.CONVENIO;1T))', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F781', 'V.A. Indem. Vacaciones nozadas ', 'S', 'N', 'I.REMNYH + HS;I.REMNYH;0;0;1234567H + HS;I.REMVAR;-1;5;1234567H/6', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F782', 'V.A. Base Embargo Judicial', 'S', 'N', 'MAX(0,KTHA-I.SIJPAG-AC(6)-VT(100,1,1)) + MAX(0,I.SIJPAG-VT(100,1,1)/2)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F783', 'V.A. Descuento días de vacaciones ', 'S', 'N', 'I.REMNYH', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F787', 'V.A. Remun. Imponible 9 ', 'S', 'N', 'I.REMU09', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F788', 'V.A. Imponible Aportes s/Vac. ', 'S', 'N', 'I.APOVAC', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F789', 'V.A. Imponible Cont. s/Vac. ', 'S', 'N', 'I.CONVAC', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F790', 'V.A. Remun. Imponible 8 ', 'S', 'N', 'I.REMU08', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F791', 'V.A. Remun. Imponible 1 ', 'S', 'N', 'I.REMU01', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F792', 'V.A. Remun. Imponible 2 ', 'S', 'N', 'I.REMU02', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F793', 'V.A. Remun. Imponible 3 ', 'S', 'N', 'I.REMU03', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F794', 'V.A. Remun. Imponible 4 ', 'S', 'N', 'I.REMU04', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F795', 'V.A. Imponible Cont. s/Sdo. ', 'S', 'N', 'I.CONSDO', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F796', 'V.A. Imponible Cont. s/SAC', 'S', 'N', 'I.CONSAC', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F797', 'V.A. Remun. Imponible 5 ', 'S', 'N', 'I.REMU05', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F798', 'V.A. Imponible Aporte s/Sdo.', 'S', 'N', 'I.APOSDO', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F799', 'V.A. Imponible Aporte s/SAC ', 'S', 'N', 'I.APOSAC', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F801', 'Cont. Jubilación (SIJP) s/Sdo.', 'S', 'N', 'I.CONSDO * ALICUOTA("CONSIJP")*VT(25,Q.SIT_LAB,1)/100 ', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F802', 'Cont. Jubilación (SIJP) s/SAC ', 'S', 'N', 'I.CONSAC * ALICUOTA("CONSIJP")*VT(25,Q.SIT_LAB,1)/100 ', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F803', 'Cont. Jubilación (SIJP) s/Vac.', 'S', 'N', 'I.CONVAC * ALICUOTA("CONSIJP")*VT(25,Q.SIT_LAB,1)/100 ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F804', 'Cont. Jubilación (SIJP) s/Prem. ', 'S', 'N', 'I.CONPRE * ALICUOTA("CONSIJP")*VT(25,Q.SIT_LAB,1)/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F806', 'Cont. INSSJP s/Sdo. ', 'S', 'N', 'I.CONSDO * ALICUOTA("CONINSSJP")*VT(25,Q.SIT_LAB,1)/100 ', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F807', 'Cont. INSSJP s/SAC', 'S', 'N', 'I.CONSAC * ALICUOTA("CONINSSJP")*VT(25,Q.SIT_LAB,1)/100 ', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F808', 'Cont. INSSJP s/Vac. ', 'S', 'N', 'I.CONVAC * ALICUOTA("CONINSSJP")*VT(25,Q.SIT_LAB,1)/100 ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F809', 'Cont. INSSJP s/Premio ', 'S', 'N', 'I.CONPRE * ALICUOTA("CONINSSJP")*VT(25,Q.SIT_LAB,1)/100 ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F810', 'Cont. INSSJP 1.273-2.641', 'S', 'N', '0 * F(713)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F811', 'Cont. RENATRE s/Sdo.', 'S', 'N', 'I.CONSDO* ALICUOTA("CONRENATRE")*VT(25,Q.SIT_LAB,1)/100 ', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F812', 'Cont. RENATRE s/SAC ', 'S', 'N', 'I.CONSAC * ALICUOTA("CONRENATRE")*VT(25,Q.SIT_LAB,1)/100 ', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F813', 'Cont. RENATRE s/Sdo.', 'S', 'N', 'I.CONVAC* ALICUOTA("CONRENATRE")*VT(25,Q.SIT_LAB,1)/100 ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F814', 'Cont. RENATRE s/Premio', 'S', 'N', 'I.CONPRE* ALICUOTA("CONRENATRE")*VT(25,Q.SIT_LAB,1)/100 ', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F816', 'Cont. FNE s/Sdo.', 'S', 'N', 'I.CONSDO * ALICUOTA("CONFNE")*VT(25,Q.SIT_LAB,1)/100 ', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F817', 'Cont. FNE s/SAC ', 'S', 'N', 'I.CONSAC * ALICUOTA("CONFNE")*VT(25,Q.SIT_LAB,1)/100 ', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F818', 'Cont. FNE s/Vac.', 'S', 'N', 'I.CONVAC * ALICUOTA("CONFNE")*VT(25,Q.SIT_LAB,1)/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F819', 'Cont. FNE s/Premio. ', 'S', 'N', 'I.CONPRE * ALICUOTA("CONFNE")*VT(25,Q.SIT_LAB,1)/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F821', 'Cont. ANSSAL s/Sdo. ', 'S', 'N', 'MAX(I.COSDAC/I.JORNAD,0.001)*KP03 * F(716)/100', 'I.CONSDO * F(716)/100', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F822', 'Cont. ANSSAL s/SAC', 'S', 'N', 'MAX(I.COSSAC/I.JORNAD,0.001)*KP03 * F(716)/100', 'I.CONSAC * F(716)/100', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F823', 'Cont. ANSSAL s/Vac. ', 'S', 'N', 'MAX(I.COVAAC /I.JORNAD,0.001)*KP03 * F(716)/100', 'I.CONVAC * F(716)/100', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F824', 'Cont. ANSSAL s/Premio ', 'S', 'N', '(I.CONPRE+I.MNIPRE) * F(716)/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F826', 'Cont. Asig. Familiares s/Sdo. ', 'S', 'N', 'I.CONSDO * F(717)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F827', 'Cont. Asig. Familiares s/SAC', 'S', 'N', 'I.CONSAC * F(717)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F828', 'Cont. Asig. Familiares s/Vac. ', 'S', 'N', 'I.CONVAC * F(717)/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F829', 'Cont. Asig. Familiares s/Premio.', 'S', 'N', 'I.CONPRE * F(717)/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F830', 'Cont. Cuota Fija ART (LRT)', 'S', 'N', ' F(719) - HS;I.C00030;0;0;1234567H', '24.Jul.2008 - Cambiar ítem a 30

 F(719) - HS;I.C00035;0;0;1234567H', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F831', 'Cont. Porcent. ART (LRT) s/Sdo', 'S', 'N', 'I.APOSDO * ALICUOTA("CONPORLRT")/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F832', 'Cont. Porcent. ART (LRT) s/SAC', 'S', 'N', 'I.APOSAC * ALICUOTA("CONPORLRT")/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F833', 'Cont. Porcent. ART (LRT) s/Vac', 'S', 'N', 'I.APOVAC * ALICUOTA("CONPORLRT")/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F834', 'Cont. Porcent. ART (LRT) s/Premio ', 'S', 'N', 'I.APOPRE * ALICUOTA("CONPORLRT")/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F836', 'Cont. Obra Social s/Sdo.', 'S', 'N', 'MAX(I.COSDAC/I.JORNAD,0.001)*KP03 * F(724)/100





', 'I.CONSDO * F(724)/100', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F837', 'Cont. Obra Social s/SAC ', 'S', 'N', 'MAX(I.COSDAC/I.JORNAD,0.001)*KP03 * F(724)/100', 'I.CONSAC * F(724)/100', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F838', 'Cont. Obra Social s/Vac.', 'S', 'N', 'MAX(I.COSDAC/I.JORNAD,0.001)*KP03 * F(724)/100', 'I.CONVAC * F(724)/100', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F839', 'Cont. Obra Social 1.273-2.641 ', 'S', 'N', '0 * F(777)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F841', 'Crédito Fiscal Ley 25.922 ', 'S', 'N', '0 * F(721)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F842', 'Crédito Fiscal Dto 814/L 25723', 'S', 'N', 'I.IMPCON * F(737)/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F845', 'Contrb. Seg. Col. de Vida Obligat.', 'S', 'N', ' F(738) - HS;I.C00045;0;0;1234567H', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F848', 'Cont. Obra Social s/Premio', 'S', 'N', '(I.CONPRE+I.MNIPRE)* F(724)/100', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F900', 'Remuneración No Sujeta a Impuesto Dto 12', 'S', 'N', 'PIIF(VARTYPE(K_DTO1242_A007)$''NY'',K_DTO1242_A007,0)P', 'Creada por proceso el 18/10/2013 11:36:30 AM por PERSONAL', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F901', 'Días de Vac. Anticipadas', 'S', 'N', 'PDIASVMA()P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F902', 'Días de Vac. Netos del período', 'S', 'N', 'MIN(IIF(S_PERI$''16'', DIASVM(''S'',''S'', IIF(S_PERI=''1'', 1, 2)), DIASVM(''S'')) + IIF(S_PERI=''1'', HS;I.DVACOL;-1;0;6H, IIF(S_PERI=''6'', HS;I.DVACOL;0;0;1H, HS;I.DVACOL;-1;0;7H)), IIF(S_PERI$''16'', 15, 30))', 'Rev. 5 - Los colgados deben estar dentro del min

IIF(S_PERI$''16'', MIN(15, DIASVM(''S'',''S'', IIF(S_PERI=''1'', 1, 2))), MIN(30, DIASVM(''S''))) + IIF(S_PERI=''1'', HS;I.DVACOL;-1;0;6H, IIF(S_PERI=''6'', HS;I.DVACOL;0;0;1H, HS;I.DVACOL;-1;0;7H))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F903', 'Días de Vac. q'' comienz e/mes ', 'S', 'N', 'PDIASVM(''N'')P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F904', 'Sueldo Básico (INFORMATIVO) ', 'S', 'N', 'IIF(A1;1A>T2;Q.CATEGO;1T, A1;1A, T2;Q.CATEGO;1T)', 'IIF(KVAL<>0, KVAL, T2;Q.CATEGO;1T)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F905', 'Remun. Normal y Habitual', 'S', 'N', 'AC(1)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F906', 'Remuneración Variable ', 'S', 'N', 'AC(2)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F907', 'Remuneracion Nominal Maternidad ', 'S', 'N', '((I.REMNYH+I.PROM03)/30*O.H00600)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F908', 'Base para Asif. Fliares.', 'S', 'N', '0', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F909', 'Tramo para Asif. Fliares. ', 'S', 'N', 'PCALC_ASIGFAM()P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F910', 'Mejor Rem. Norm. y Hab. Ult 12 Meses', 'S', 'N', 'IIF(Q.MOTI_RET>0, MAX((I.REMNYH+HS;I.REMNYH;0;0;1234567H), HS;I.REMNYH;-01;0;1234567H, HS;I.REMNYH;-02;0;1234567H, HS;I.REMNYH;-03;0;1234567H, HS;I.REMNYH;-04;0;1234567H, HS;I.REMNYH;-05;0;1234567H, HS;I.REMNYH;-06;0;1234567H, HS;I.REMNYH;-07;0;1234567H, HS;I.REMNYH;-08;0;1234567H, HS;I.REMNYH;-09;0;1234567H, HS;I.REMNYH;-10;0;1234567H, HS;I.REMNYH;-11;0;1234567H),0)', 'IIF(Q.MOTI_RET>0, MAX(HS;I.REMNYH;0;0;1234567H, HS;I.REMNYH;-01;0;1234567H, HS;I.REMNYH;-02;0;1234567H, HS;I.REMNYH;-03;0;1234567H, HS;I.REMNYH;-04;0;1234567H, HS;I.REMNYH;-05;0;1234567H, HS;I.REMNYH;-06;0;1234567H, HS;I.REMNYH;-07;0;1234567H, HS;I.REMNYH;-08;0;1234567H, HS;I.REMNYH;-09;0;1234567H, HS;I.REMNYH;-10;0;1234567H, HS;I.REMNYH;-11;0;1234567H), 0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F912', 'Saldo de Días Vac. a imputar p/sac', 'S', 'N', 'MAX(0,MAX(0,HS;I.SDODIA;-1;0;7H) - MAX(0,HS;I.DIAVAD;-1;0;7H)) + MAX(0, HS;I.DIAVAP;0;0;4H)', 'Todas las fórmulas de saldos que se calculan al inicio de una liquidacion, debe tomar el saldo (mismo ítem) de la liquidación anterior, restando lo calculado en la liquidación anterior y sumando lo agregado en esta liquidación.



Se debe asignar estos ítems de saldos en un único período del mes para que no repita el cálculo y ajustar a los períodos en que se liquida el pago de anticipo y el item de descuento.



SDODIA: Es el monto de saldo de días de adelanto de vacaciones del mes pasado antes de la liquidación del mes pasado (por eso se debe descontar los días correspondientes al mes pasado)

DIASVN: Días de vacaciones netos del mes

DIASVA: Días de vacaciones anticipadas (por el módulo de vacaciones anticipadas)

DIASVM: Días de vacaciones que comienzan en el mes.



Se debe elegir qué se pagará, si por días anticipados (DIASVA) o por días que comienzan en el mes (DIASVM).

', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F913', 'Afecto a SAC de Vacaciones', 'S', 'N', 'IIF(I.DIAVAP<>0, AC(13)/I.DIAVAP * F(733), 0) + IIF(S_PERI$''67'', HS;I.AFSVM1;-1;0;1234567H + HS;I.AFSVM2;-2;0;1234567H + HS;I.AFSVM3;-3;0;1234567H, 0)', 'Rev. 5 - Se cambió el método de división del afecto

MAX(0, IIF(I.SDODIA>0, I.SDOVAC/I.SDODIA * I.DIAVAD, 0))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F914', 'Aporte Obra Social sin ANSSAL ', 'S', 'N', '(I.REMU04 + HS;I.REMU04;0;0;1234567H) * ( F(705) + F(706)*KDER)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F915', 'Cont. Obra Social sin ANSSAL', 'S', 'N', '(I.REMU08 + HS;I.REMU08;0;0;1234567H) * F(724)/100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F916', 'Costo de plan de O.S. ', 'S', 'N', 'IIF(BETWEEN(Q.SEN_NIV,200,210), PRECORRETABLASCONDICIONES(900)P,PCOSTOPLANOS(Q.SEN_NIV)P * IIF(Q.SEN_FRA>0 AND Q.SEN_FRA<100, Q.SEN_FRA/100,1))', 'PCOSTOPLANOS(Q.SEN_NIV)P * IIF(Q.SEN_FRA>0 AND Q.SEN_FRA<100, Q.SEN_FRA/100, 1)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F917', 'Diferencia de Plan Neta ', 'S', 'N', 'IIF(I.CTOPLA>0,I.CTOPLA - (I.APOBSO + I.COOBSO), 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F918', 'Costo de Plan Reconocido', 'S', 'N', 'IIF(I.CTOPLA>0, IIF(A21;1A=3 AND A22;1A<>0, COSTOPLANOS(A22;1A), 0), 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F919', 'Días del período (Liquidado)', 'S', 'N', 'IIF(S_PERI<>''M'' AND (Q.REGPAG=''M'' AND S_PERI=''7'' OR Q.REGPAG=''Q'' AND S_PERI$''16''), A_PERIS(3,VAL(S_PERI)), 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F920', 'Dif. de Plan EMPRESA', 'S', 'N', 'IIF(I.CTOPLA>0, IIF(A21;1A=2, MAX(0, I.DIFPLA), IIF(A21;1A=3, MAX(0, I.CPEMPR - (I.APOBSO + I.COOBSO)), IIF(A21;1A=4 AND A23;1A>0, MAX(0, MAX(0, I.DIFPLA) - A23;1A), 0))), 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F921', 'Dif. de plan EMPLEADO ', 'S', 'N', 'IIF(I.CTOPLA>0, MAX(0, I.DIFPLA - I.DPEMPR) * IIF(A21;1A = 5,0,1),0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F922', 'Día de Vac. colgado mes sgte. ', 'S', 'N', 'MAX(0, IIF(S_PERI$''16'', DIASVM(''S'',''S'',IIF(S_PERI=''1'',''1'',''2'')), DIASVM(''S'')) - I.DIASVN)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F923', 'Total Alícuotas descuentos legales', 'S', 'N', 'ALICUOTA("APSIJP") + ALICUOTA("APINSSJP") + ALICUOTA("APOS") + KDER * ALICUOTA("APADOS")', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F924', 'Base MNI', 'S', 'S', 'IIF(Q.SIT_LAB<>1 AND Q.SIT_LAB<>21,PTOPE("DEAR167173")P/IIF(I.DEDICA<>0,KP01,IIF(Q.HORARIO>1,KP03,KP02))*IIF(I.DEDICA<>0,MIN(200,I.DEDICA),IIF(Q.HORARIO>1,IIF((KP03*.66)<Q.HORARIO,KP03,Q.HORARIO),IIF((KP02*.66)<Q.HORAS,KP02,Q.HORAS))),MIN(PTOPE("DEAR167173")P/IIF(I.DEDICA<>0,KP01,IIF(Q.HORARIO>1,KP03,KP02))*IIF(I.DEDICA<>0,MIN(200,I.DEDICA),IIF(Q.HORARIO>1,Q.HORARIO,Q.HORAS)),PTOPE("DEAR167173")P*.66))', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F925', 'Días no trabajados x Ingreso', 'S', 'N', 'IIF(ARMAAMES(S_FELIQ)=ARMAAMES(M.FECHA_ING), DAY(M.FECHA_ING)-1, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F926', 'Días no trabajados x Egreso ', 'S', 'N', 'IIF(ARMAAMES(S_FELIQ)=ARMAAMES(M.FECHA_RET), MIN(30, MAX(30 - DAY(M.FECHA_RET), 0)),IIF(ARMAAMES(M.FECHA_RET)<ARMAAMES(S_FELIQ),30,0))', 'AGREGA UN DIA MAS CUANDO ES BAJA



IIF(ARMAAMES(S_FELIQ)=ARMAAMES(M.FECHA_RET), MIN(30, MAX(30 - DAY(M.FECHA_RET)+1, 0)),IIF(ARMAAMES(M.FECHA_RET)<ARMAAMES(S_FELIQ),30,0))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F927', 'V.O. Días Vac. nozadas ', 'S', 'N', 'PEXDIASVAC(Q.CODIGO, M.FECHA_RET, ''T'')P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F928', 'Saldo de Vac. a imputar p/sac ', 'S', 'N', 'MAX(0, MAX(0, HS;I.SDOVAC;-1;0;7H) - MAX(0, HS;I.H000301;-1;0;7H*-1)) + MAX(0, HS;I.H00401;0;0;4H)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F929', 'Días Trabajados (para SAC)', 'S', 'N', 'IIF(Q.REGPAG=''Q'', PDIASTRQ()P - I.DIASLI, KDTR - I.DIASLI)', 'TOMA UN DIA MAS CUANDO ES BAJA



IIF(Q.REGPAG=''Q'', PDIASTRQ()P - I.DIASLI, KDTR - I.DIASLI - IIF(ARMAAMES(S_FELIQ)=ARMAAMES(M.FECHA_RET) AND Q.MOTI_RET<>7 AND Q.MOTI_RET<>8, 1, 0))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F930', 'Días Trab. p/imponibles ', 'S', 'N', 'IIF(I.DIAPER + HS;I.DIAPER;0;0;1234567H=0, IIF(S_PERI=''2'', 30, 0), 30 - (I.DIAPER + HS;I.DIAPER;0;0;1234567H - KDTR - HS;R.KDTR;0;0;1234567H))+ (I.DIAVAP+HS;I.DIAVAP;0;0;1234567H)- (I.DIAVAD+HS;I.DIAVAD;0;0;1234567H)', 'Según manual de implementación



DREM = 30 - DNOTR - DVACA + DVACM



DREM = 30 - (30- sum.DPERi - sum.DIASTRi) - DVACA + DVACM', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F931', 'Grossing Up (Neto a cobrar) ', 'S', 'N', 'PBRUTO(KVAL, ''S'')P', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F932', 'Días de Pago de Vacaciones', 'S', 'N', ' I.DIASVM', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F933', 'Días de Descuento de Vac. ', 'S', 'N', 'I.DIASVN', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F934', 'Afecto a SAC Vac. mes sgte. ', 'S', 'N', 'IIF(I.DIAVAP<>0, AC(13)/I.DIAVAP * ( F(733) + F(734) ) - I.AFSACV, 0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F935', 'Afecto a SAC Vac. mes +2', 'S', 'N', 'IIF(I.DIAVAP<>0, AC(13)/I.DIAVAP * ( F(733) + F(734) + F(735) ) - I.AFSACV - I.AFSVM1, 0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F936', 'Afecto a SAC Vac. mes +3', 'S', 'N', 'IIF(I.DIAVAP<>0, AC(13)/I.DIAVAP * ( F(733) + F(734) + F(735) + F(736) ) - I.AFSACV - I.AFSVM1 - I.AFSVM2, 0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F938', 'Ajuste aporte O.Social para as', 'S', 'N', 'I.APOBSO-(HS;I.L00005,L00006;0;0;1234567H+I.L00005+I.L00006)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F939', 'Ajuste Anssal para asiento', 'S', 'N', '((HS;I.L00003,L00004;0;0;1234567H+I.L00003+I.L00004)-I.APOBSO)-(I.L00007+HS;I.L00007;0;0;1234567H)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F943', 'Ajuste contibucion o.social p/', 'S', 'N', 'I.COOBSO-(HS;I.C00036,C00037,C00038,C00048;0;0;1234567H+I.C00036+I.C00037+I.C00038+I.C00048)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F944', 'Ajuste contribucion Anssal p/a', 'S', 'N', '((HS;I.C00021,C00022,C00023,C00024,C00036,C00037,C00038,C00048;0;0;1234567H+I.C00036+I.C00037+I.C00038+I.C00048+I.C00021+I.C00022+I.C00023+I.C00024)-I.COOBSO)-(I.C00021+I.C00022+I.C00023+I.C00024+HS;I.C00021,C00022,C00023,C00024;0;0;1234567H)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F950', 'MNI s/VAC ', 'S', 'S', 'IIF((KTHA-I.SIJPSA-I.SIJPAG-I.SIJPHE-I.SIJPAD-I.SIJPPR-PTOPE("TOPMINART9")P)>I.BASMNI, MIN(I.SIJPVA,MAX(0,(I.BASMNI/30* I.DIAVAP)-I.MNISDO-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)),MAX(0,KTHA-I.SIJPSA-I.SIJPAG-I.SIJPHE-I.SIJPAD-I.SIJPPR-PTOPE("TOPMINART9")P))', 'MIN(I.SIJPVA,MAX(0,(PTOPE("DEAR167173")P/30* I.DIAVAP)-I.MNISDO-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H))


IIF((KTHA-I.SIJPSA-I.SIJPAG-I.SIJPPR-2556.64)>2400, MIN(I.SIJPVA,MAX(0,(PTOPE("DEAR167173")P/30* I.DIAVAP)-I.MNISDO-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)),MAX(0,KTHA-I.SIJPASA-I.SIJPVA-I.SIJPPR-2556.64)))



IIF((KTHA-I.SIJPSA-I.SIJPAG-I.SIJPPR-2556.64)>2400, MIN(I.SIJPAG,MAX(0,(PTOPE("DEAR167173")P/2*I.EXFSAC/100)-HS;I.MNISAC;0;0;1234567H)-IIF(MONTH(S_FELIQ)>7,HS;I.MNISAC;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.MNISAC;-1;MONTH(S_FELIQ)-2;1234567H)),MAX(0,KTHA-I.SIJPASA-I.SIJPVA-I.SIJPPR-2556.64)))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F951', 'MNI s/Premio', 'S', 'N', 'IIF((KTHA-I.SIJPSA-I.SIJPAG-I.SIJPHE-I.SIJPAD-I.SIJPVA-PTOPE("TOPMINART9")P)>I.BASMNI, MIN(I.SIJPPR,MAX(0,(I.BASMNI/30* I.SIJMNI)-I.MNISDO-I.MNIVAC-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)),MAX(0,KTHA-I.SIJPSA-I.SIJPAG-I.SIJPHE-I.SIJPAD-I.SIJPVA-PTOPE("TOPMINART9")P))', 'MIN(I.SIJPPR,MAX(0,(PTOPE("DEAR167173")P/30* I.SIJMNI)-I.MNISDO-I.MNIVAC-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H))

IIF((KTHA-I.SIJPSA-I.SIJPAG-I.SIJPVA-2556.64)>2400, 
MIN(I.SIJPPR,MAX(0,(PTOPE("DEAR167173")P/30* I.SIJMNI)-I.MNISDO-I.MNIVAC-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)),MAX(0,KTHA-I.SIJPASA-I.SIJPVA-I.SIJPVA-2556.64)))



IIF((KTHA-I.SIJPSA-I.SIJPAG-I.SIJPPR-2556.64)>2400, MIN(I.SIJPVA,MAX(0,(PTOPE("DEAR167173")P/30* I.DIAVAP)-I.MNISDO-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)),MAX(0,KTHA-I.SIJPASA-I.SIJPVA-I.SIJPPR-2556.64)))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F952', 'MNI s/Sueldo', 'S', 'S', 'IIF(KTHA>(PTOPE("TOPMINART9")P+2400),IIF((KTHA-I.SIJPHE-I.SIJPAD-I.SIJPAG-I.SIJPVA-I.SIJPPR-PTOPE("TOPMINART9")P)>I.BASMNI, MIN(KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR,MAX(0,(I.BASMNI/30* I.SIJMNI)-I.MNIVAC-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)),MIN(MIN(KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR,MAX(0,(I.BASMNI/30* I.SIJMNI)-I.MNIVAC-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)), MAX(0,KTHA-PTOPE("TOPMINART9")P))),MIN((I.BASMNI/30* I.SIJMNI),(I.BASMNI/30* I.SIJMNI)-PTOPE("TOPMINART9")P+(KTHA-((I.BASMNI/30)* I.SIJMNI))))', '1
MIN(KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR,MAX(0,(PTOPE("DEAR167173")P/30* I.SIJMNI)-I.MNIVAC-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H))

2
IIF((KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR-2556.64)>2400,MIN(KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR,MAX(0,(PTOPE("DEAR167173")P/30* I.SIJMNI)-I.MNIVAC-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H))


,MIN(MIN(KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR,MAX(0,(PTOPE("DEAR167173")P/30* I.SIJMNI)-I.MNIVAC-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)),MAX(0,KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR-2556.64)))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F953', 'MNI s/SAC ', 'S', 'S', 'IIF((KTHA-I.SIJPSA-I.SIJPVA-I.SIJPHE-I.SIJPAD-I.SIJPPR-PTOPE("TOPMINART9")P)>I.BASMNI,MIN(I.SIJPAG,MAX(0,(I.BASMNI/2*I.EXFSAC/100)-HS;I.MNISAC;0;0;1234567H)-IIF(MONTH(S_FELIQ)>7,HS;I.MNISAC;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.MNISAC;-1;MONTH(S_FELIQ)-2;1234567H)),MAX(0,KTHA-I.SIJPSA-I.SIJPVA-I.SIJPHE-I.SIJPAD-I.SIJPPR-PTOPE("TOPMINART9")P))', 'MIN(I.SIJPAG,MAX(0,(PTOPE("DEAR167173")P/2*I.EXFSAC/100)-HS;I.MNISAC;0;0;1234567H)-IIF(MONTH(S_FELIQ)>7,HS;I.MNISAC;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.MNISAC;-1;MONTH(S_FELIQ)-2;1234567H))

IIF((KTHA-I.SIJPSA-I.SIJPVA-I.SIJPPR-2556.64)>2400, MIN(I.SIJPAG,MAX(0,(PTOPE("DEAR167173")P/2*I.EXFSAC/100)-HS;I.MNISAC;0;0;1234567H)-IIF(MONTH(S_FELIQ)>7,HS;I.MNISAC;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.MNISAC;-1;MONTH(S_FELIQ)-2;1234567H)),MAX(0,KTHA-I.SIJPSA-I.SIJPVA-I.SIJPPR-2556.64))

IIF((KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR-2556.64)>PTOPE("DEAR167173")P, MIN(KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR,MAX(0,(PTOPE("DEAR167173")P/30* I.SIJMNI)-I.MNIVAC-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H)),MAX(MIN(KTHA-I.SIJPAG-I.SIJPVA-I.SIJPPR,MAX(0,(PTOPE("DEAR167173")P/30* I.SIJMNI)-I.MNIVAC-I.MNIPRE-HS;I.MNISDO,MNIVAC,MNIPRE;0;0;1234567H))*MAX(0,KTHA-2556.64)/PTOPE("DEAR167173")P,0))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F960', 'Impon. Contrib. s/Acdos (R8)', 'S', 'N', '(KTHA-I.SIJPVA-I.SIJPAG-I.SIJPPR)+I.IMPACU', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F961', 'SIJP: Sueldo', 'S', 'N', 'AC(11)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F962', 'SIJP: Horas Extras', 'S', 'N', 'AC(12)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F963', 'SIJP: Vacaciones', 'S', 'N', 'AC(13)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F964', 'SIJP: SAC (Aguinaldo) ', 'S', 'N', 'AC(14)', 'standar



AC(14)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F965', 'SIJP: Adic. Zona Desfavorable ', 'S', 'N', 'AC(15)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F966', 'SIJP: Adicionales ', 'S', 'N', 'AC(16)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F967', 'SIJP: Premios ', 'S', 'N', 'AC(17)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F968', 'SIJP: Rem. Decreto 788/05 ', 'S', 'N', 'AC(18)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F969', 'SIJP: No Remunerativos', 'S', 'N', 'AC(19)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F970', 'Propor. Días trab. del semestr', 'S', 'N', 'IIF(I.SIJPAG>0, IIF(KFSAC>0, KFSAC, 1), 0) * 100', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F971', 'Impon. Aportes s/SAC (R4y5) ', 'S', 'N', 'IIF(I.SIJPAG<>0, MIN(I.SIJPAG+HS;I.SIJPAG;0;0;1234567H, (PTOPE("APOS")P/2- IIF(MONTH(S_FELIQ)>7,HS;I.APJSAC;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.APJSAC;-1;MONTH(S_FELIQ)-2;1234567H)) * MIN(I.EXFSAC + HS;I.EXFSAC;0;0;1234567H,100)/100) - HS;I.APOSAC;0;0;1234567H, 0)', 'standar

IIF(I.SIJPAG<>0, MIN(I.SIJPAG+HS;I.SIJPAG;0;0;1234567H, PTOPE("APOS")P/2 * MIN(I.EXFSAC + HS;I.EXFSAC;0;0;1234567H,100)/100) - HS;I.APOSAC;0;0;1234567H, 0)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F972', 'Impon. Ap. Jubilat. s/SAC (R1)', 'S', 'N', 'IIF(I.SIJPAG<>0, MIN(I.SIJPAG+HS;I.SIJPAG;0;0;1234567H, (PTOPE("APSIJP")P/2- IIF(MONTH(S_FELIQ)>7,HS;I.APJSAC;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.APJSAC;-1;MONTH(S_FELIQ)-2;1234567H)) * MIN(I.EXFSAC + HS;I.EXFSAC;0;0;1234567H,100)/100) - HS;I.APJSAC;0;0;1234567H, 0)', 'standar

IIF(I.SIJPAG<>0, MIN(I.SIJPAG+HS;I.SIJPAG;0;0;1234567H, PTOPE("APSIJP")P/2 * MIN(I.EXFSAC + HS;I.EXFSAC;0;0;1234567H,100)/100) - HS;I.APJSAC;0;0;1234567H, 0)







MAX(0,AC(14)-IIF(INLIST(MONTH(S_FELIQ),1,7),0,IIF(MONTH(S_FELIQ)>7,HS;I.SIJPAG;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.SIJPAG;-1;MONTH(S_FELIQ)-2;1234567H)))



IIF(INLIST(MONTH(S_FELIQ),1,7),0,IIF(MONTH(S_FELIQ)>7,HS;I.SIJPAG;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.SIJPAG;-1;MONTH(S_FELIQ)-2;1234567H))



IIF(MONTH(S_FELIQ)>7,HS;I.APJSAC;-1;MONTH(S_FELIQ)-8;1234567H,HS;I.APJSAC;-1;MONTH(S_FELIQ)-2;1234567H))', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F973', 'Impon. Aportes s/Vac. (R4y5)', 'S', 'N', 'IIF(I.SIJPVA<>0, MIN(I.SIJPVA+HS;I.SIJPVA;0;0;1234567H, PTOPE("APOS")P/30 * I.DIAVAP) - HS;I.APOVAC;0;0;1234567H, 0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F974', 'Impon. Aportes s/Suel. (R4y5) ', 'S', 'N', 'IIF(KTHA - I.SIJPAG<>0, MIN(KTHA+HS;R.KTHA;0;0;1234567H - I.SIJPAG-HS;I.SIJPAG;0;0;1234567H, PTOPE("APOS")P/30 * F(930)) - HS;I.APOSDO;0;0;1234567H - I.APOVAC - HS;I.APOVAC;0;0;1234567H, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F975', 'Impon. Ap. Jubilat. s/Sdo.(R1)', 'S', 'N', 'IIF(KTHA - I.SIJPAG<>0, MIN(KTHA+HS;R.KTHA;0;0;1234567H - I.SIJPAG-HS;I.SIJPAG;0;0;1234567H, PTOPE("APSIJP")P/30 * F(930)) - HS;I.APJSDO;0;0;1234567H - I.APJVAC - HS;I.APJVAC;0;0;1234567H, 0)', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F976', 'Impon. Contrib s/SAC (R2y3) ', 'S', 'N', 'I.SIJPAG - I.MNISAC', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F977', 'Impon. Ap.Jub. s/Vac. (R1)', 'S', 'N', 'IIF(I.SIJPVA<>0, MIN(I.SIJPVA+HS;I.SIJPVA;0;0;1234567H, PTOPE("APSIJP")P/30 * I.DIAVAP) - HS;I.APJVAC;0;0;1234567H, 0)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F978', 'Impon. Contrib s/Vac (R2y3) ', 'S', 'N', 'I.SIJPVA-I.MNIVAC', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F979', 'Impon. Contrib s/sueldo (R2y3)', 'S', 'S', 'KTHA - I.SIJPVA - I.SIJPAG - I.SIJPPR-I.MNISDO', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F980', 'Impon. Contrib s/Prem (R2y3)', 'S', 'N', 'I.SIJPPR-I.MNIPRE', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F981', 'Impon. del sistema (R4y5) ', 'S', 'N', 'I.APOSAC + I.APOVAC + I.APOSDO', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F982', 'Impon. de contribuciones(R2y3)', 'S', 'N', 'I.CONSAC + I.CONVAC + I.CONSDO + I.CONPRE', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F983', 'Impon. Aportes Jubilatorio(R1)', 'S', 'N', 'I.APJSAC + I.APJVAC + I.APJSDO', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F984', 'Impon. Acuerdos SAC ', 'S', 'N', 'AC(43)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F985', 'Impon. Acuerdos Vac.', 'S', 'N', 'AC(42)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F986', 'Impon. Acuerdos Sueldos ', 'S', 'N', 'AC(41)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F987', 'Impon. de Contribuciones (R8) ', 'S', 'S', 'I.COSDAC+I.COSSAC+I.COVAAC+I.CONPRE+I.MNIPRE', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F988', 'Impon. Contrib. s/SAC acdos (R8)', 'S', 'N', 'I.SIJPAG+I.IMSACU', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F989', 'Impon. Contrib. s/VAC acdos (R8)', 'S', 'N', 'I.SIJPVA+I.IMVACU', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F990', 'Remun. Imponible 10 ', 'S', 'N', 'I.REMU02-I.MNISDO-I.MNISAC-I.MNIVAC-I.MNIPRE', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F991', 'Remun. Imponible 1 SIJP ', 'S', 'N', 'I.IMPJUB', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F992', 'Remun. Imponible 2 SIJP ', 'S', 'N', 'I.IMPCON+I.MNISDO+I.MNISAC+I.MNIVAC+I.MNIPRE', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F993', 'Remun. Imponible 3 SIJP ', 'S', 'N', 'I.IMPCON+I.MNISDO+I.MNISAC+I.MNIVAC+I.MNIPRE', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F994', 'Remun. Imponible 4 SIJP ', 'S', 'N', 'MAX((I.KTIMEX+I.IMPACU+I.IMSACU+I.IMVACU)/I.JORNAD*KP03,0.001)', 'MAX((I.KTIMEX+I.IMPACU+I.IMSACU+I.IMVACU)/IIF(Q.HORAS=45,200,(I.JORNAD*4))*200,0.001)', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F995', 'Remun. Imponible 5 SIJP ', 'S', 'N', 'I.KTIMEX', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F996', 'Remun. Imponible 6 SIJP ', 'S', 'N', '0', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F997', 'Remun. Imponible 7 SIJP ', 'S', 'N', '0', '', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F998', 'Remun. Imponible 8 SIJP ', 'S', 'S', 'MAX(I.IMPCOB/I.JORNAD*KP03,0.001)', ' ', 0);
INSERT INTO RFORMLA(Coform, Descrip, Tipo, Trazo, Formula, Obs, Jdd) VALUES ('F999', 'Remun. Imponible 9 SIJP ', 'S', 'N', 'I.IMPCON+I.MNISDO+I.MNISAC+I.MNIVAC+I.MNIPRE+AC(28) ', ' ', 0);
