EJERCICIOS SUBCONSULTAS

--1 Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select codigo_oficina, ciudad from oficina;

+----------------+----------------------+
| codigo_oficina | ciudad               |
+----------------+----------------------+
| BCN-ES         | Barcelona            |
| BOS-USA        | Boston               |
| LON-UK         | Londres              |
| MAD-ES         | Madrid               |
| PAR-FR         | Paris                |
| SFC-USA        | San Francisco        |
| SYD-AU         | Sydney               |
| TAL-ES         | Talavera de la Reina |
| TOK-JP         | Tokyo                |
+----------------+----------------------+

--2 Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select ciudad, telefono from oficina where pais = 'Espa?a';

+----------------------+----------------+
| ciudad               | telefono       |
+----------------------+----------------+
| Barcelona            | +34 93 3561182 |
| Madrid               | +34 91 7514487 |
| Talavera de la Reina | +34 925 867231 |
+----------------------+----------------+


--3 Devuelve un listado con el email, nombre, apellidos completos (Por ej. Fernandez Alonso, Mario Alfredo)  de los empleados cuyo jefe tiene un código de jefe igual a 7.
select email, nombre, apellido1, apellido2 from empleado where codigo_jefe = 7;

+--------------------------+---------+-----------+-----------+
| email                    | nombre  | apellido1 | apellido2 |
+--------------------------+---------+-----------+-----------+
| mlopez@jardineria.es     | Mariano | L?pez     | Murcia    |
| lcampoamor@jardineria.es | Lucio   | Campoamor | Mart?n    |
| hrodriguez@jardineria.es | Hilario | Rodriguez | Huertas   |
+--------------------------+---------+-----------+-----------+

--4 Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe is null;

+------------------+--------+-----------+-----------+----------------------+
| puesto           | nombre | apellido1 | apellido2 | email                |
+------------------+--------+-----------+-----------+----------------------+
| Director General | Marcos | Maga?a    | Perez     | marcos@jardineria.es |
+------------------+--------+-----------+-----------+----------------------+


--5 Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
select e.nombre, e.apellido1, e.apellido2, e.puesto
from empleado as e join cliente as c
on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.codigo_empleado_rep_ventas is null;

//????

--6 Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select distinct estado from pedido;

+-----------+
| estado    |
+-----------+
| Entregado |
| Rechazado |
| Pendiente |
+-----------+

--7 Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta: 
--Utilizando la función YEAR
--Utilizando DATE_FORMAT
--Sin utilizar ninguna de las funciones anteriores.


select distinct codigo_cliente
from pago
where year(fecha_pago) = 2008;

select distinct codigo_cliente
from pago
where date_format(fecha_pago, '%Y') = '2008';

select distinct codigo_cliente
from pago
where fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';

+----------------+
| codigo_cliente |
+----------------+
|              1 |
|             13 |
|             14 |
|             26 |
+----------------+

--8 Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_entrega > fecha_esperada;

+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             9 |              1 | 2008-12-27     | 2008-12-28    |
|            13 |              7 | 2009-01-14     | 2009-01-15    |
|            16 |              7 | 2009-01-07     | 2009-01-15    |
|            17 |              7 | 2009-01-09     | 2009-01-11    |
|            18 |              9 | 2009-01-06     | 2009-01-07    |
|            22 |              9 | 2009-01-11     | 2009-01-13    |
|            28 |              3 | 2009-02-17     | 2009-02-20    |
|            31 |             13 | 2008-09-30     | 2008-10-04    |
|            32 |              4 | 2007-01-19     | 2007-01-27    |
|            38 |             19 | 2009-03-06     | 2009-03-07    |
|            39 |             19 | 2009-03-07     | 2009-03-09    |
|            40 |             19 | 2009-03-10     | 2009-03-13    |
|            42 |             19 | 2009-03-23     | 2009-03-27    |
|            43 |             23 | 2009-03-26     | 2009-03-28    |
|            44 |             23 | 2009-03-27     | 2009-03-30    |
|            45 |             23 | 2009-03-04     | 2009-03-07    |
|            46 |             23 | 2009-03-04     | 2009-03-05    |
|            49 |             26 | 2008-07-22     | 2008-07-30    |
|            55 |             14 | 2009-01-10     | 2009-01-11    |
|            60 |              1 | 2008-12-27     | 2008-12-28    |
|            68 |              3 | 2009-02-17     | 2009-02-20    |
|            92 |             27 | 2009-04-30     | 2009-05-03    |
|            96 |             35 | 2008-04-12     | 2008-04-13    |
|           103 |             30 | 2009-01-20     | 2009-01-24    |
|           106 |             30 | 2009-05-15     | 2009-05-20    |
|           112 |             36 | 2009-04-06     | 2009-05-07    |
|           113 |             36 | 2008-11-09     | 2009-01-09    |
|           114 |             36 | 2009-01-29     | 2009-01-31    |
|           115 |             36 | 2009-01-26     | 2009-02-27    |
|           123 |             30 | 2009-01-20     | 2009-01-24    |
|           126 |             30 | 2009-05-15     | 2009-05-20    |
|           128 |             38 | 2008-12-10     | 2008-12-29    |
+---------------+----------------+----------------+---------------+

--9 Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
--Utilizando la función ADDDATE
--Utilizando la función DATEDIFF

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_entrega <= adddate(fecha_esperada, -2);

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where datediff(fecha_esperada, fecha_entrega) >= 2;

+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             2 |              5 | 2007-10-28     | 2007-10-26    |
|            24 |             14 | 2008-07-31     | 2008-07-25    |
|            30 |             13 | 2008-09-03     | 2008-08-31    |
|            36 |             14 | 2008-12-15     | 2008-12-10    |
|            53 |             13 | 2008-11-15     | 2008-11-09    |
|            89 |             35 | 2007-12-13     | 2007-12-10    |
|            91 |             27 | 2009-03-29     | 2009-03-27    |
|            93 |             27 | 2009-05-30     | 2009-05-17    |
+---------------+----------------+----------------+---------------+

--10 Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
select codigo_pedido, codigo_cliente, fecha_pedido, estado
from pedido
where estado = 'rechazado' and year(fecha_pedido) = '2009';

+---------------+----------------+--------------+-----------+
| codigo_pedido | codigo_cliente | fecha_pedido | estado    |
+---------------+----------------+--------------+-----------+
|            14 |              7 | 2009-01-02   | Rechazado |
|            21 |              9 | 2009-01-09   | Rechazado |
|            25 |              1 | 2009-02-02   | Rechazado |
|            26 |              3 | 2009-02-06   | Rechazado |
|            40 |             19 | 2009-03-09   | Rechazado |
|            46 |             23 | 2009-04-03   | Rechazado |
|            65 |              1 | 2009-02-02   | Rechazado |
|            66 |              3 | 2009-02-06   | Rechazado |
|            74 |             15 | 2009-01-14   | Rechazado |
|            81 |             28 | 2009-01-18   | Rechazado |
|           101 |             16 | 2009-03-07   | Rechazado |
|           105 |             30 | 2009-02-14   | Rechazado |
|           120 |             16 | 2009-03-07   | Rechazado |
|           125 |             30 | 2009-02-14   | Rechazado |
+---------------+----------------+--------------+-----------+

--11. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año
select codigo_pedido, codigo_cliente, fecha_pedido, fecha_entrega
from pedido
where month(fecha_entrega) = 1; 

+---------------+----------------+--------------+---------------+
| codigo_pedido | codigo_cliente | fecha_pedido | fecha_entrega |
+---------------+----------------+--------------+---------------+
|             1 |              5 | 2006-01-17   | 2006-01-19    |
|            13 |              7 | 2009-01-12   | 2009-01-15    |
|            15 |              7 | 2009-01-09   | 2009-01-11    |
|            16 |              7 | 2009-01-06   | 2009-01-15    |
|            17 |              7 | 2009-01-08   | 2009-01-11    |
|            18 |              9 | 2009-01-05   | 2009-01-07    |
|            21 |              9 | 2009-01-09   | 2009-01-09    |
|            22 |              9 | 2009-01-11   | 2009-01-13    |
|            32 |              4 | 2007-01-07   | 2007-01-27    |
|            55 |             14 | 2008-12-10   | 2009-01-11    |
|            58 |              3 | 2009-01-24   | 2009-01-30    |
|            64 |              1 | 2009-01-24   | 2009-01-30    |
|            75 |             15 | 2009-01-11   | 2009-01-13    |
|            79 |             28 | 2009-01-12   | 2009-01-13    |
|            82 |             28 | 2009-01-20   | 2009-01-29    |
|            95 |             35 | 2008-01-04   | 2008-01-19    |
|           100 |             16 | 2009-01-10   | 2009-01-15    |
|           102 |             16 | 2008-12-28   | 2009-01-08    |
|           103 |             30 | 2009-01-15   | 2009-01-24    |
|           113 |             36 | 2008-10-28   | 2009-01-09    |
|           114 |             36 | 2009-01-15   | 2009-01-31    |
|           119 |             16 | 2009-01-10   | 2009-01-15    |
|           121 |             16 | 2008-12-28   | 2009-01-08    |
|           123 |             30 | 2009-01-15   | 2009-01-24    |
+---------------+----------------+--------------+---------------+

--12. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor
select codigo_cliente, id_transaccion, fecha_pago, forma_pago, total
from pago
where forma_pago = 'paypal' and year(fecha_pago) = 2008
order by total desc;

+----------------+----------------+------------+------------+----------+
| codigo_cliente | id_transaccion | fecha_pago | forma_pago | total    |
+----------------+----------------+------------+------------+----------+
|             26 | ak-std-000020  | 2008-03-18 | PayPal     | 18846.00 |
|             14 | ak-std-000015  | 2008-07-15 | PayPal     |  4160.00 |
|             13 | ak-std-000014  | 2008-08-04 | PayPal     |  2246.00 |
|              1 | ak-std-000001  | 2008-11-10 | PayPal     |  2000.00 |
|              1 | ak-std-000002  | 2008-12-10 | PayPal     |  2000.00 |
+----------------+----------------+------------+------------+----------+

--13. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
select codigo_oficina, pais 
from oficina
where exists (select ciudad from cliente where ciudad = 'Fuenlabrada');

+----------------+------------+
| codigo_oficina | pais       |
+----------------+------------+
| BCN-ES         | Espa?a     |
| BOS-USA        | EEUU       |
| LON-UK         | Inglaterra |
| MAD-ES         | Espa?a     |
| PAR-FR         | Francia    |
| SFC-USA        | EEUU       |
| SYD-AU         | Australia  |
| TAL-ES         | Espa?a     |
| TOK-JP         | Jap?n      |
+----------------+------------+

--14. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select c.nombre_cliente, e.nombre, o.ciudad 
from cliente as c
join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina as o on e.codigo_oficina = o.codigo_oficina;

+--------------------------------+-----------------+----------------------+
| nombre_cliente                 | nombre          | ciudad               |
+--------------------------------+-----------------+----------------------+
| Beragua                        | Emmanuel        | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel        | Barcelona            |
| Naturagua                      | Emmanuel        | Barcelona            |
| DaraDistribuciones             | Emmanuel        | Barcelona            |
| Madrile?a de riegos            | Emmanuel        | Barcelona            |
| Golf S.A.                      | Jos? Manuel     | Barcelona            |
| Americh Golf Management SL     | Jos? Manuel     | Barcelona            |
| Aloha                          | Jos? Manuel     | Barcelona            |
| El Prat                        | Jos? Manuel     | Barcelona            |
| Sotogrande                     | Jos? Manuel     | Barcelona            |
| Gerudo Valley                  | Lorena          | Boston               |
| Tendo Garden                   | Lorena          | Boston               |
| Lasas S.A.                     | Mariano         | Madrid               |
| Lasas S.A.                     | Mariano         | Madrid               |
| Camunas Jardines S.L.          | Mariano         | Madrid               |
| Dardena S.A.                   | Mariano         | Madrid               |
| Jardines y Mansiones Cactus SL | Lucio           | Madrid               |
| Jardiner?as Mat?as SL          | Lucio           | Madrid               |
| france telecom                 | Lionel          | Paris                |
| Mus?e du Louvre                | Lionel          | Paris                |
| Flores S.L.                    | Michael         | San Francisco        |
| The Magic Garden               | Michael         | San Francisco        |
| GoldFish Garden                | Walter Santiago | San Francisco        |
| Gardening Associates           | Walter Santiago | San Francisco        |
| Jardin de Flores               | Julian          | Sydney               |
| Naturajardin                   | Julian          | Sydney               |
| Vivero Humanes                 | Julian          | Sydney               |
| Agrojardin                     | Julian          | Sydney               |
| Campohermoso                   | Julian          | Sydney               |
| Tutifruti S.A                  | Mariko          | Sydney               |
| El Jardin Viviente S.L         | Mariko          | Sydney               |
| Flores Marivi                  | Felipe          | Talavera de la Reina |
| Flowers, S.A                   | Felipe          | Talavera de la Reina |
| Fuenla City                    | Felipe          | Talavera de la Reina |
| Top Campo                      | Felipe          | Talavera de la Reina |
| Jardineria Sara                | Felipe          | Talavera de la Reina |
+--------------------------------+-----------------+----------------------+

--15. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
select e.nombre as nombre_empleado, j.nombre as jefe
from empleado as e
join empleado as j on e.codigo_jefe = j.codigo_empleado;

+-----------------+----------+
| nombre_empleado | jefe     |
+-----------------+----------+
| Ruben           | Marcos   |
| Alberto         | Ruben    |
| Maria           | Ruben    |
| Felipe          | Alberto  |
| Juan Carlos     | Alberto  |
| Carlos          | Alberto  |
| Mariano         | Carlos   |
| Lucio           | Carlos   |
| Hilario         | Carlos   |
| Emmanuel        | Alberto  |
| Jos? Manuel     | Emmanuel |
| David           | Emmanuel |
| Oscar           | Emmanuel |
| Francois        | Alberto  |
| Lionel          | Francois |
| Laurent         | Francois |
| Michael         | Alberto  |
| Walter Santiago | Michael  |
| Hilary          | Alberto  |
| Marcus          | Hilary   |
| Lorena          | Hilary   |
| Nei             | Alberto  |
| Narumi          | Nei      |
| Takuma          | Nei      |
| Amy             | Alberto  |
| Larry           | Amy      |
| John            | Amy      |
| Kevin           | Alberto  |
| Julian          | Kevin    |
| Mariko          | Kevin    |
+-----------------+----------+

--16. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
select c.nombre_cliente
from pedido as p
join cliente as c on p.codigo_cliente = c.codigo_cliente
where p.fecha_entrega > p.fecha_esperada
group by c.nombre_cliente;

+--------------------------------+
| nombre_cliente                 |
+--------------------------------+
| Beragua                        |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| El Jardin Viviente S.L         |
| Flores S.L.                    |
| Gardening Associates           |
| Gerudo Valley                  |
| GoldFish Garden                |
| Golf S.A.                      |
| Jardiner?as Mat?as SL          |
| Jardineria Sara                |
| Jardines y Mansiones Cactus SL |
| Naturagua                      |
| Sotogrande                     |
| Tutifruti S.A                  |
+--------------------------------+

--17. Devuelve un listado de los productos que nunca han aparecido en un pedido.
select *
from producto
where codigo_producto not in (select distinct codigo_producto from detalle_pedido);

--demasiadas tablas devuelve, pero funciona

--19. ¿Cuál fue el pago medio en 2009?
select avg(total) as pago_medio
from pago
where year(fecha_pago) = 2009;

+-------------+
| pago_medio  |
+-------------+
| 4504.076923 |
+-------------+


--20. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
select count(estado) as cantidad_por_estado, estado
from pedido
group by estado
order by cantidad_por_estado desc;

+---------------------+-----------+
| cantidad_por_estado | estado    |
+---------------------+-----------+
|                  61 | Entregado |
|                  30 | Pendiente |
|                  24 | Rechazado |
+---------------------+-----------+






