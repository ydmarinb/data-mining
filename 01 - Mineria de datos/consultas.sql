-- Indicar la base de datos a usar
use dbpendientes;


-- Sentencia sql para traer todas las observaciones de la base de datos
select * from personas;

-- limit
select  *  from personas
limit 10;


-- Sentencia sql para traer todas las observaciones de la base de datos en orden alfabetico del nombre
select * from personas
order by nombre asc;


-- Regresa fecha de entrada o salida de dinero, el monto de entrada 
-- o salida de la tabla entradaSalidaDinero, donde la fecha este entre 
-- el 1 de enero de 2018 y el 31 de enero del mismo año ordenados por fecha ascendente
select fechaes, montoie
from entradasalidadinero
where fechaes between '2018-01-01' and '2018-01-31'
order by fechaes asc;


-- regresa los registros de la tabla entradaSalidaDinero cuyo monto sea mayor
-- o igual a 500, y ese monto se muestra multiplicado por 2
select id, fechaes, idingresosegresos, montoie * 2 as "multiplo por dos", observaciones
from entradasalidadinero
where montoie >= 500;


-- realizamos una consulta del campo ingresoegreso con id = 21
--  y con el aplicamos los diferentes operadores aritmeticos básicos
select montoie * 2 + montoie/2
from entradasalidadinero
where id = 21;


-- concatenamos  campos de la tabla personas
select * , concat(nombre, " ", telefono, " ",now())
from personas;


-- Dar formato a campo de fecha, extraer los 10 primeros caracteres de un campo de base de datos
-- llamado observaciones y por ultimo redondear un dato numerico en tres diferenes formatos
-- con información de la tabla entradaSalidaDinero
select id,fechaes, observaciones, date_format(fechaes, '%d/%m/%y'),
 date_format(fechaes, '%e-%b-%Y'), left(observaciones, 10), montoie, round(montoie, 1),
 year(fechaes)
from entradasalidadinero;


-- Implimier niveles de una variable
select distinct(idestatuspendiente) from pendientes;


-- operadores de where !=, <>, =,  <, >,  AND, OR, NOT
-- id != 8 y telefono inicia con 493 y id par
select * from personas
where id!=8 and left(telefono, 3) = '493'
and id mod 2 = 0;


-- varios elementos
select * from personas
where id in(1, 2, 5, 6);


-- operador like
select * from pendientes
where observaciones like 'ya%' and descripcion like '%a';


-- campos nulos
select * from pendientes
where  descripcion is null;

-- Totar de campo en la tabla
select count(*) from pendientes;

-- groupby
select month(fechacreacion), count(*) from pendientes
group by month(fechacreacion);


use dbpendientes;

-- inner join
select * from entradasalidadinero
inner join personas on entradasalidadinero.idPersonas = personas.id;

-- inner multiple
select * from entradasalidadinero
inner join ingresosegresos
on entradasalidadinero.idingresosegresos = ingresosegresos.id
inner join grupoingeg
on  ingresosegresos.idGrupoIngEg = grupoingeg.id;



