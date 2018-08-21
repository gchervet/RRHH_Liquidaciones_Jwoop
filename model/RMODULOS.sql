INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD10494', '02_Organigrama Jerárquico ', 30, '', '', ' ', '', '', 1, ' ', 2, 'ADMINISTRA', 'SELECT E.codigo as LEGAJO, E.nombre, E.cargo, (SELECT R.descrip FROM rtablas R WHERE R.cotab=3 AND E.cargo=R.codigo) as ''DESCRIPCIÓN CARGO'', E.jefe as ''LEGAJO JEFE'', (SELECT J.nombre FROM remples J WHERE E.jefe=J.codigo) as ''NOMBRE JEFE''

FROM remples E WHERE Estado=''A''', '', 0, ' ', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD15367', '103_SRF - Control tems cargados en clase', 9000, 'l.COHADE, l.TIPO, l.FORMULA, l.PERIODO', 'RCLAREM l', 'left(LTRIM(COHADE),3)=''SRF''', '', '', 1, ' ', 2, 'ADMINISTRA', 'SELECTCODIGO as clase, COHADE, TIPO, FORMULA, PERIODO FROM RCLAREM whereleft(LTRIM(COHADE),3)=''SRF''', '', 0, 'Codigo del ITEM;:Tipo de Item;:Formula Local;:Período de Aplicación', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD25839', 'Control Nro 3 - Novedades Única Vez y Cu', 20, 'q.CODIGO, q.NOMBRE, m.COHADE, m.CUOTOT, m.MONTO, m.OBS, m.COFORM, q.ESTADO as estado_a, m.NRO, m.PERIODO, m.FORMULA, m.CUOPAR, m.FECHA_INI, m.PERIMP,j.descrip,m.estado as estado_b', 'REMPLES q INNER JOIN RMAPITM m ON q.codigo = m.codigo INNER JOIN RHABDES j ONm.Cohade = j.Cohade', 'm.cuotot <>999', '', '8,3 ', 1, 'SELECT q.Codigo, q.Nombre, m.Cohade, m.Nro, m.Monto, j.Descrip FROM dbo.REMPLES q INNER JOIN dbo.RMAPITM ', 3, 'ADMINISTRA', ' ', '', 0, ' ', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD30027', '02_SICOSS - Controla Familiares de la ba', 9000, '', '', ' ', '', '', 1, ' ', 2, 'ADMINISTRA', ' select rgrupfa.Codigo, COUNT(CONYUGE.RELACION) AS CONYUGE, COUNT(HIJO.RELACION) AS HIJO, COUNT(ADHERENTE.RELACION) AS ADHERENTE

from RGRUPFA

LEFT OUTER JOIN RGRUPFA AS CONYUGE ON RGRUPFA.Codigo=CONYUGE.Codigo

AND RGRUPFA.NOMBRE=CONYUGE.NOMBRE

AND RGRUPFA.RELACION=CONYUGE.RELACION

AND CONYUGE.Relacion=1



LEFT OUTER JOIN RGRUPFA AS HIJO ON RGRUPFA.Codigo=HIJO.Codigo

AND RGRUPFA.NOMBRE=HIJO.NOMBRE

AND RGRUPFA.RELACION=HIJO.RELACION

AND HIJO.Relacion=2



LEFT OUTER JOIN RGRUPFA AS ADHERENTE ON RGRUPFA.Codigo=ADHERENTE.Codigo

AND RGRUPFA.NOMBRE=ADHERENTE.NOMBRE

AND RGRUPFA.RELACION=ADHERENTE.RELACION

AND ADHERENTE.Relacion IN (3,4)

GROUP BYrgrupfa.Codigo', '', 0, ' ', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD35808', '101_SRF - Control de items creados', 9000, '', '', ' ', '', '', 1, ' ', 2, 'ADMINISTRA', 'SELECTCOHADE, DESCRIP,TIPO, COFORM FROM RHABDES whereleft(LTRIM(COHADE),3)=''SRF''', '', 0, ' ', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD36284', '102_SRF - Control de items x acumuladore', 9000, 'i.COHADE, i.DESCRIP, i.TIPO, i.ACUMUS', 'RHABDES i', 'i.tipo<>11 and i.acumus<>'' ''', '', 'tipo,cohade,acumus', 1, ' ', 3, 'ADMINISTRA', 'SELECT i.COHADE, i.DESCRIP, i.TIPO, i.ACUMUS FROM RHABDES i', '', 0, 'Código de Item;:Descripción de ítem;:Tipo de Item;:Acumladores que participa', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD44220', '201_BCO- Datos Bancarios', 9000, 'q.CODIGO, q.NOMBRE, q.RUT, q.FPAGO, #''$VT(12; p5.FPAGO; 0 )'' AS D_FPAGO, q.FPAGO2, #''$VT(12; p5.FPAGO2; 0 )'' AS D_FPAGO2, q.CTA_CORR, q.CTA_CORR2', 'REMPLES q', ' ESTADO =''A''', '', '', 1, ' ', 3, 'ADMINISTRA', 'SELECT q.CODIGO, q.NOMBRE, q.RUT, q.FPAGO, #''$VT(12; p5.FPAGO; 0 )'' AS D_FPAGO, q.FPAGO2, #''$VT(12; p5.FPAGO2; 0 )'' AS D_FPAGO2, q.CTA_CORR, q.CTA_CORR2 FROM REMPLES q WHERE ESTADO =''A''', '', 0, ';:;:CUIL;:Forma pago;:Descripción Forma pago;:Forma de pago 2;:Descripción Forma de pago 2;:Nro. Cta.Bancaria;:Nro Cuenta Bancaria 2', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD80660', '01_SICOSS - Control Remples ', 9000, 'q.CODIGO, q.RUT, q.NOMBRE,q.NUMDOC, q.CONVENIO, q.SIT_LAB, q.COD_ISA, q.COD_INE, q.COD_CAJ', 'REMPLES q', ' ', '', 'CODIGO', 1, ' ', 3, 'ADMINISTRA', 'select REMPLES.RUT CUIL,REMPLES.CODIGO LEGAJO, REMPLES.NOMBRE APELLIDOYNOMBRE, REMPLES.NUMDOC DNI,REMPLES.CONVENIO,REMPLES.SIT_LAB MOD_CONTRATACION,REMPLES.COD_ISA OBRA_SOCIAL, REMPLES.COD_INE COD_ACTIVIDAD_SIJP,RT10.CodAl ZONA_GEOGRAFICA, COUNT(CONYUGE.RELACION)AS CONYUGE, COUNT(HIJO.RELACION) AS HIJO, COUNT(ADHERENTE.RELACION) AS ADHERENTE

from REMPLES



LEFT OUTER JOIN RGRUPFA ON REMPLES.Rut=RGRUPFA.CODIGO



LEFT OUTER JOIN RTABLAS AS RT10 ON REMPLES.COD_CAJ=RT10.CODIGO

AND RT10.Cotab=10



LEFT OUTER JOIN RGRUPFA AS CONYUGE ON RGRUPFA.Codigo=CONYUGE.Codigo

AND RGRUPFA.NOMBRE=CONYUGE.NOMBRE

AND RGRUPFA.RELACION=CONYUGE.RELACION

AND CONYUGE.Relacion=1



LEFT OUTER JOIN RGRUPFA AS HIJO ON RGRUPFA.Codigo=HIJO.Codigo

AND RGRUPFA.NOMBRE=HIJO.NOMBRE

AND RGRUPFA.RELACION=HIJO.RELACION

AND HIJO.Relacion=2



LEFT OUTER JOIN RGRUPFA AS ADHERENTE ON RGRUPFA.Codigo=ADHERENTE.Codigo

AND RGRUPFA.NOMBRE=ADHERENTE.NOMBRE

AND RGRUPFA.RELACION=ADHERENTE.RELACION

AND ADHERENTE.Relacion IN (3,4)



GROUP BYREMPLES.RUT,REMPLES.NOMBRE, REMPLES.NUMDOC,REMPLES.CODIGO,REMPLES.CONVENIO, REMPLES.SIT_LAB, REMPLES.COD_ISA, REMPLES.COD_INE, RT10.CODAL ', '', 0, ';:;:CUIL;:Numero doc.;:Convenio;:Mod. contrat SIJP;:Obra Social;:Cód. Actividad SIJP;:Zona geográf. SIJP', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD81350', '', 0, '', '', ' ', '', '', 0, ' ', 3, 'ADMINISTRA', ' ', '', 0, '', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD86008', '01_Organigrama funcional', 30, '', '', ' ', '', '', 1, ' ', 2, 'ADMINISTRA', 'SELECT C.cgocodigo as ''CÓDIGO CARGO'', (SELECT T.descrip FROM rtablas T WHERE T.cotab=3 AND C.cgocodigo=T.codigo) as ''DESCRIPCIÓN CARGO'', C.cgosuperv as ''CÓDIGO CARGO SUPERVISOR'', (SELECT T.descrip FROM rtablas T WHERE T.cotab=3 AND C.cgosuperv=T.codigo) as ''DESCRIPCIÓN CARGO SUPERVISOR'', C.cgoescalaf as ''CÓDIGO UNIDAD'', (SELECT T.descrip FROM rtablas T WHERE T.cotab=40 AND C.cgoescalaf=T.codigo) FROM tbporcgo C', '', 0, ' ', 'PERSONAL', 0);
INSERT INTO RMODULOS(Modulo, Descrip, Clasif, Campos, Desde, Filtro, Agrupa, Orden, Tipper, Cohades, Indir, Grupos, Directa, Swhere, Nperiodo, varis, Dueno, Jdd) VALUES ('MOD95306', '', 0, 'q.CODIGO, q.NOMBRE, q.CARNET AS LICENCIA_COND', 'REMPLES q', ' ', '', '', 1, ' ', 3, 'ADMINISTRA', 'SELECT q.CODIGO, q.NOMBRE, q.CARNET AS LICENCIA_COND FROM REMPLES q', '', 0, '', 'PERSONAL', 0);
