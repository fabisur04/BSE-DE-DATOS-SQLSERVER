--Ejercicios 05/08/2025

		--Prmeras sintaxis
Select 'Hola'

	--Asignar valor a una variable
Select @var=1 --o con set

		--Sintaxis de tablas

--Integridad referencial: consigue la integridad de la base de datos, asegura que los datos realcionados sean consistentes
--mostrar los estados civiles
select nombre_estado_civil 'Estado Civil' from Estado_Civil 
		
--ver todo el contenido de la tabla
select * from Estado_Civil

--identificar todos los estudiantes
select rut_estudiante'Rut', nombre_estudiante'Nombre', apellido_paterno_estudiante'Apellido Paterno', apellido_materno_estudiante'Apellido Materno'  from Estudiante

select * from Estudiante
--Determinar los estudiantes y su estado civil
Select  est.nombre_estudiante'Nombre', apellido_paterno_estudiante'Apellido Paterno', e_c.nombre_estado_civil  
from Estudiante est, Estado_Civil e_c
where est.id_estado_civil=e_c.id_estado_civil

--descargar estado de funciones o string de sql server



	--Ejercicios 07/08/2025

--Identificar los estudiante de apellido 'Suárez'
select est.nombre_estudiante, est.apellido_paterno_estudiante
from Estudiante est
where est.apellido_paterno_estudiante='Suárez'


--Identificar los estudiantes que alguno de sus apellidos es 'Suárez'
select est.nombre_estudiante, est.apellido_paterno_estudiante, est.apellido_materno_estudiante
from Estudiante est
where (est.apellido_materno_estudiante = 'Suárez' or est.apellido_paterno_estudiante='Suárez');

--Identificar los estudiantes de apellido paterno 'Suárez' o 'marquez'
select est.nombre_estudiante, est.apellido_paterno_estudiante, est.apellido_materno_estudiante
from Estudiante est
where (est.apellido_paterno_estudiante = 'Suárez' or est.apellido_paterno_estudiante='Márquez');

		--Tambien se puede con
select est.nombre_estudiante, est.apellido_paterno_estudiante, est.apellido_materno_estudiante
from Estudiante est
where est.apellido_paterno_estudiante in ('Suárez','Márquez')


		--Ejercicios 08/08/2025

-- Identificar los estudiantes con rut en el rango 1 y 3, utilizando los operadores de comparacion
select est.rut_estudiante 'Rut', est.nombre_estudiante'Nombre', est.apellido_paterno_estudiante 'Apellido'
from Estudiante est
where rut_estudiante>=1 and rut_estudiante <=3;
		--Otra forma de hacerlo
select est.rut_estudiante 'Rut', est.nombre_estudiante'Nombre', est.apellido_paterno_estudiante 'Apellido'
from Estudiante est
where rut_estudiante between 1 and 3

		--El like puede ser visto en _:Reemplaza 0 ó 1 caracter
		--						o en %: Reemplaza de 0 a n caracteres

--Identidifcar los estudiante cuyo nombre comienza con la letra C
Select est.rut_estudiante 'Rut', est.nombre_estudiante'Nombre', est.apellido_paterno_estudiante 'Apellido'
from Estudiante est
where nombre_estudiante like 'C%'

--Identidifcar los estudiante cuyo nombre comienza con la letra C, ordenado por nombre ascendente 
Select est.rut_estudiante 'Rut', est.nombre_estudiante'Nombre', est.apellido_paterno_estudiante 'Apellido'
from Estudiante est
where nombre_estudiante like 'C%'
order by est.nombre_estudiante asc

						-------Clase 14/08/2025

--Concatenar nombre, apellidomaterno y apellidopaterno

select (concat(trim(est.nombre_estudiante),' ', trim(est.apellido_paterno_estudiante),' ', Trim(est.apellido_materno_estudiante))) as 'Nombre Completo'
from estudiante est
				--Trim se utiliza para borrar espacios en blanco 


--Que muestre rut de estudiante sin guión

Select replace(est.rut_estudiante, '-','')'Rut',  est.nombre_estudiante 'Nombre', est.apellido_paterno_estudiante 'Apellido' 
from Estudiante est


--Mostrar el digito verificador de cada rut y el nombre de estudiante
Select RIGHT(TRIM(est.rut_estudiante), 1)'Rut', est.nombre_estudiante 'Nombre', est.apellido_paterno_estudiante 'Apellido'
from Estudiante est


--Clase 19/08(2025		

--Mostarar los cinco ultimos caracteres  del nombre de los estudiantes
Select est.rut_estudiante'Rut', RIGHT(TRIM(est.nombre_estudiante),5) 'Nombre', est.apellido_paterno_estudiante 'Apellido'
from Estudiante est


--Mostrar el nombre de los estudiantes en minuscula, exepto los ultimos 3 caracteres que deben mostrarse en mayuscula
SELECT est.rut_estudiante 'Rut',
CONCAT(LOWER(LEFT(TRIM(est.nombre_estudiante), LEN(TRIM(est.nombre_estudiante)) - 3)), UPPER(RIGHT(TRIM(est.nombre_estudiante), 3))) 'Nombre',
est.apellido_paterno_estudiante 'Apellido'
FROM Estudiante est;

--La cantidad de palabras que tiene el nombre(Tarea?)


				--Funciones Matemáticas

--Determinar la funcion que permita transformar 996 a 1000

select round((996),-1)

--Determinar la funcion que permita transformar de 664 a 990
select round((996769/10),0.01)*10

--Determinar la hipotenusa de un triangulorectagulo de ctaetos 6 y 8

Select sqrt(power(6,2)+power(8,2))

				--Clase 21-08-2025

-- determinar la fecha y hora de este momento
select getdate() 'Fecha y hora'
select format(getdate(), 'dd/MM/yyyy') 'Fecha Actual'

--Determinar el dia de la fecha actual
select format(getdate(), 'dd') 'Día actual'

Select day(getdate()) 'Dia actual'

--Determinar a que dia de la semana corresponde la fecha actual
select datename(dw, getdate()) 
select datepart(dw, getdate())

				--Clase 22/08/2025

--Determinar la fecha a partir de hoy , de un deposito a 27 dias.
select dateadd(day, 27, (getdate())) 'Fecha dentro de 27 dias'

--Determinar la edad en años(aproximada) de cada uno
select nombre_estudiante Nombre,fecha_nacimiento 'Fecha Nacimiento', datediff(year, fecha_nacimiento, getdate())'Edad'
from Estudiante

--Determinar la cantidad de dias que falta para nuestro cumpleaños
select datediff(day, getdate() , '2026-04-10') 'Días para cumpleaños' 



--Declarar Variables
DECLARE @Fecha date 
select @Fecha='2005-04-28'


--Determinar la fecha de nuestro proximo cumpleaños(en caso de que ya haya estado de cumpleaños este año)
select concat((datepart(yy,getdate())+1),'-', datepart(mm, @Fecha),'-',datepart(dd, @Fecha)) 'Proximo Cumpleaños'

--Ejercicio: forma correcta de construir la fecha 



				--Clase 26/08/2025
				--Funciones sql

--Las funciones entregan un valor, tienen una entrada y una salida 
--Las funciones tienen parametros 

--Crear una funcion que dado el nombre, entrege un saludo 'Bienvenido, nombre'

Declare @Nombre nchar(30)
select @Nombre='Fabian manuelbvgfedddgfbekjhbflo wuebghfoqw bgflqwhb'

Select dbo.Saludo(@Nombre) 

--Alter para actualizar una tabla,en vez de crear

--_Mostrar el saludo para todos los estudiantes

select dbo.Saludo(nombre_estudiante) Saludo
from Estudiante

select dbo.Hipotenusa(6.2,8.8) Hipotenusa
				-- =============================================
				-- Author:		<Fabian S>
				-- Create date: <2025-08-28>
				-- Description:	<Esta funcion calcula la hipotenusa de un triangulo, entyregando como parametros dos catetos, CatetoA y CatetoB>
				-- =============================================
				/*Alter FUNCTION Hipotenusa
				(
	
					@CatetoA Float,
					@CatetoB float
				)
				RETURNS float
				AS
				BEGIN
					-- Declare the return variable here
					DECLARE @Hipo float

					-- Add the T-SQL statements to compute the return value here
					SELECT @Hipo=sqrt(power(@CatetoA,2)+power(@CatetoB,2))

					-- Return the result of the function
					RETURN @Hipo

				END
				GO
				*/
--=====================================================================

--Crear una funcion booleana que determine si tres medidas pueden formar un triangulo

				/*
CREATE or alter FUNCTION Es_Triangulo
(
	@Lado_1 float,
	@Lado_2 float,
	@Lado_3 float
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Resultado bit
	Declare @Mensaje char(15)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Resultado =0
	if @Lado_1 + @Lado_2 > @Lado_3
		if @Lado_1 + @Lado_3 > @Lado_2
			if @Lado_3 + @Lado_2 > @Lado_1
				Select @Resultado=1
	
	-- Return the result of the function
	RETURN @Mensaje

END
GO
				*/


--Clase 04/09/2025

--Realizar una consulta en la cual se llama a la funcion y con el resultado verdadero, se envia el mensaje 'Se puede formar un triangulo' o si es falso, 'No se puede fomar un triangulo'
select dbo.Es_Triangulo(3,4,5)
Select Case dbo.Es_Triangulo(3,4,5)
	when 1 then 'Se puede formar un triangulo'
	--when 0 then 'No se puede formar un triangulo'
	else 'No se puede formar un triangulo'
	end 


--Realizar una funcion escalar que calcule la potencia de una base elevado a un exponente, utilizando el comando WHILE
select dbo.Potencia(2,-2)

--En Caso de que la potencia sea negativa 
								/*
								CREATE or ALTER FUNCTION Potencia
								(
									@Base float,
									@Exponente int 
								)
								RETURNS float
								AS
								BEGIN
									-- Declare the return variable here
									DECLARE @Resultado float=1
									DECLARE @Contador int 
									SELECT @Contador=@Exponente
	

									-- Add the T-SQL statements to compute the return value here

									--Exponente negativo sin resolver correctamente--------------------
									--if (@Exponente<0) select @Resultado=Null
									--else
									-------------------------------------------------------------------


									if (@Exponente<0) 
									while (@Contador>=@Exponente) 
										Begin	
											select @Resultado=1/@Base * 1/@Base
											select @Contador=@Contador-1
										end	
									else
									while (@Contador!=0) 
										Begin	
											select @Resultado=@Resultado*@Base
											select @Contador=@Contador-1
										end	
	
									-- Return the result of the function
									RETURN @Resultado

								END
								GO
								*/


										--Clase 11/09/2025--
											--PROCEDIMIENTOS DE ALMACENADO--
/*
paso de parametros:
					Referencia: cambia el valor de las variables 
					Valor: uno entrega los valores precisos, no importa si es modificable

Parametros:
			in
			out
*/

--definir un SP que dado un nombre, entregue un saludo con el nombre, con una cadena como parametro

EXEC Saludo'Fabian'

--definir un SP que dado un nombre, entregue un saludo con el nombre, con una cadena como parametro
--y el saludo lo devuelva en una variable
Declare @Nombre nchar(20)='Fabian',
		@Mensaje nchar(30)
Exec Saludo @Nombre, @Mensaje OUTPUT
Select @Mensaje

--Código
/*
CREATE or ALTER PROCEDURE Saludo
	-- Add the parameters for the stored procedure here
	@Nombre nchar(20), 
	@Mensaje nchar(30) output
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @Mensaje=concat('Hola ',trim(@Nombre))
END
GO
*/

							--12/09/2025
--Crear un SP que muestre los datos de un estudiante de un rut dado

exec Estudiante_consulta '3-k'
									/*
									CREATE or ALTER PROCEDURE Estudiante_Consulta
										-- Add the parameters for the stored procedure here
										@Rut_estudiante nchar(10)
									AS
									BEGIN
										-- SET NOCOUNT ON added to prevent extra result sets from
										-- interfering with SELECT statements.
										SET NOCOUNT ON;

										-- Insert statements for procedure here
										SELECT est.[nombre_estudiante], est.[apellido_paterno_estudiante], est.[apellido_materno_estudiante], est.[fecha_nacimiento]
										from [Estudiante] est 
										where est.rut_estudiante=@Rut_estudiante
									END
									GO
									*/
--Crear un SP que muestre los datos de un estudiante que tenga un estado civil diferente a uno dado
exec Estudiante_consulta_EC 'Divorciado'
									/*
									CREATE or ALTER PROCEDURE Estudiante_Consulta_EC
										-- Add the parameters for the stored procedure here
										@Nombre_EstadoCivil nchar(30)
	
									AS
									BEGIN
										-- SET NOCOUNT ON added to prevent extra result sets from
										-- interfering with SELECT statements.
										SET NOCOUNT ON;

										-- Insert statements for procedure here
										SELECT est.[nombre_estudiante], est.[apellido_paterno_estudiante], est.[apellido_materno_estudiante], est.[fecha_nacimiento],e_c.id_estado_civil,e_c.nombre_estado_civil
										from [Estudiante] est, Estado_Civil e_c
										where est.id_estado_civil=e_c.id_estado_civil  and e_c.nombre_estado_civil!=@Nombre_EstadoCivil
									END 
									GO
									*/
		--Clase 23/09/2025
--Crear un sp que entrege los estudiantes con una edad en años superior a un valor dado.
--El calculo de la edad , debe ser realizado en una funcion que entregue duicha edad
--=========================================================================================================================================

										/*
										-- =============================================
										-- Author:		<Fabian>
										-- Create date: <23/09/2025>
										-- Description:	<Este procedimiento entrega la edad aproximada de los estudiantes en años>
										-- =============================================
										CREATE or alter PROCEDURE Mayor_A
											@Edad tinyint

										AS
										BEGIN
	

											-- SET NOCOUNT ON added to prevent extra result sets from
											-- interfering with SELECT statements.
											SET NOCOUNT ON;
											select est.nombre_estudiante, dbo.Edad(est.Fecha_nacimiento) Edad
											from Estudiante est
											where dbo.Edad(est.Fecha_nacimiento)> @Edad
										END
										GO
										*/
--=========================================================================================================================================
										/*
										-- =============================================
										-- Author:		<Fabian>
										-- Create date: <23/09/2025>
										-- Description:	<Esta funcion entrega la edad aproximada de los estudiantes en años>
										-- =============================================
										CREATE or alter FUNCTION Edad
											@Fecha_Nacimiento date
										)
										RETURNS tinyint
										AS
										BEGIN
											RETURN datediff(YY, @Fecha_Nacimiento, getdate())
										END
										GO

										*/
--=========================================================================================================================================
EXEC Mayor_A 30


--Calcular la edad exacata


													--Clase 25/09/2025
													--Sub query
--Por naturaleza los subquery son inefcientes


--Mostrar los estados civiles de los estudiantes
select  est.nombre_estudiante Nombre, e_c.nombre_estado_civil EstadoCivil
from Estudiante est, Estado_Civil e_c
where est.id_estado_civil=e_c.id_estado_civil

	--Con subquery
select  est.nombre_estudiante Nombre,
		(Select e_c.nombre_estado_civil 
		from Estado_Civil e_c
		where e_c.id_estado_civil=est.id_estado_civil)Estado_Civil
from Estudiante est

--Mostrar los estudiantes y su estado, de aquellos NO 'Soltero'
select	est.nombre_estudiante Nombre, e_c.nombre_estado_civil
from	Estudiante est, Estado_civil e_c
where	e_c.id_estado_civil=est.id_estado_civil and 
		e_c.nombre_estado_civil!='Soltero'
	--Con subquery
select	est.nombre_estudiante Nombre
from	Estudiante est
where	est.id_estado_civil in
		(Select e_c.id_estado_civil
		from Estado_civil e_c
		where e_c.nombre_estado_civil !='Soltero')

				--Clase 30/09/2025
--Sp que permite entregar un estudiante a la base de datos 
exec Estudiante_Agregar '21826839-0', 'Fabian','Suárez' , 'Ureta', '2005-04-28',1
											/*
											-- =============================================
											-- Author:		<Fabian>
											-- Create date: <30-09-2025>
											-- Description:	<Este sp permite agregar un estudiante a la base de datos>
											-- =============================================
											CREATE or alter PROCEDURE Estudiante_Agregar
												@rut_estudiante nchar (10),
												@nombre_estudiante nchar (50),
												@apellido_paterno_estudiante nchar(50),
												@apellido_materno_estudiante nchar(50),
												@fecha_nacimiento date,
												@id_estado_civil tinyint
											AS
											BEGIN
												SET NOCOUNT ON;
												insert into Estudiante(rut_estudiante,nombre_estudiante,apellido_paterno_estudiante, apellido_materno_estudiante,fecha_nacimiento,id_estado_civil)
												values (@rut_estudiante,@nombre_estudiante,@apellido_paterno_estudiante, @apellido_materno_estudiante,@fecha_nacimiento,@id_estado_civil)
											END
											GO
											*/

exec Estudiante_Agregar null, 'Fabian','Suárez' , 'Ureta', '2005-04-28',1
--Con campo de rut NULL
											/*
											CREATE or alter PROCEDURE Estudiante_Agregar
												@rut_estudiante nchar (10),
												@nombre_estudiante nchar (50),
												@apellido_paterno_estudiante nchar(50),
												@apellido_materno_estudiante nchar(50),
												@fecha_nacimiento date,
												@id_estado_civil tinyint
											AS
											BEGIN
												SET NOCOUNT ON;

												if((@rut_estudiante)!=null)

												insert into Estudiante(	rut_estudiante,
																		nombre_estudiante,
																		apellido_paterno_estudiante,
																		apellido_materno_estudiante,
																		fecha_nacimiento,
																		id_estado_civil)
												values (@rut_estudiante,
														@nombre_estudiante,
														@apellido_paterno_estudiante, 
														@apellido_materno_estudiante,
														@fecha_nacimiento,
														@id_estado_civil)
												else 
												select 'Nombre invalido'

											END
											GO

											*/
--Arreglar en caso de que pongan el rut en NULL con un mensaje de error
											/*
											CREATE or alter PROCEDURE Estudiante_Agregar
												@rut_estudiante nchar (10),
												@nombre_estudiante nchar (50),
												@apellido_paterno_estudiante nchar(50),
												@apellido_materno_estudiante nchar(50),
												@fecha_nacimiento date,
												@id_estado_civil tinyint
											AS
											BEGIN
												SET NOCOUNT ON;

												if((@rut_estudiante)!=null)

												insert into Estudiante(	rut_estudiante,
																		nombre_estudiante,
																		apellido_paterno_estudiante,
																		apellido_materno_estudiante,
																		fecha_nacimiento,
																		id_estado_civil)
												values (@rut_estudiante,
														@nombre_estudiante,
														@apellido_paterno_estudiante, 
														@apellido_materno_estudiante,
														@fecha_nacimiento,
														@id_estado_civil)
												else 
												RAISERROR(N'¡¡¡¡¡¡¡¡¡¡¡¡¡Rut invalido!!!!!!!!!!!!!!!', 16, 1) WITH LOG;
										
											END
											GO

											*/

											--Clase 02/10/2025
--Verificar que la tabla estudiante, el nombre del estudiante no quede en blanco
CREATE OR ALTER PROCEDURE Estudiante_Agregar
    @rut_estudiante NCHAR(10),
    @nombre_estudiante NCHAR(50),
    @apellido_paterno_estudiante NCHAR(50),
    @apellido_materno_estudiante NCHAR(50),
    @fecha_nacimiento DATE,
    @id_estado_civil TINYINT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validaciones
    IF @rut_estudiante IS NULL
    BEGIN
        RAISERROR(N'Rut inválido: no puede ser nulo.', 16, 1) WITH LOG;
        RETURN;
    END

    IF LEN(TRIM(@nombre_estudiante)) < 3
    BEGIN
        RAISERROR(N'Nombre inválido: debe tener al menos 3 caracteres.', 16, 1) WITH LOG;
        RETURN;
    END

    IF dbo.Edad(@fecha_nacimiento) < 18
    BEGIN
        RAISERROR(N'Edad inválida: el estudiante debe ser mayor de edad.', 16, 1) WITH LOG;
        RETURN;
    END

    -- Inserción
    INSERT INTO Estudiante (
        rut_estudiante,
        nombre_estudiante,
        apellido_paterno_estudiante,
        apellido_materno_estudiante,
        fecha_nacimiento,
        id_estado_civil
    )
    VALUES (
        @rut_estudiante,
        @nombre_estudiante,
        @apellido_paterno_estudiante,
        @apellido_materno_estudiante,
        @fecha_nacimiento,
        @id_estado_civil
    );
END

exec Estudiante_Agregar '37287375-3', 'Fabian','Suárez' , 'Ureta', '2005-04-28',1

--Verificar que la tabla estudiante, el nombre del estudiante no quede en blanco y que sea mayor de edad

							--Clase 03/10/2025

			--Sp Buscar
--Crear un SP para buscar estudiantes con un apellido paterno dado

exec Buscar_Algo 'López'

--Apartir de lo anterior se entregue el parametro de Apellido Materno
exec Buscar_Algo 'López', 'González'

										/*
										CREATE or ALTER PROCEDURE Buscar_Algo
											@Apellido_Paterno_estudiante nchar(50),
											@Apellido_Materno_estudiante nchar(50)
										AS
										BEGIN
											-- SET NOCOUNT ON added to prevent extra result sets from
											-- interfering with SELECT statements.
											SET NOCOUNT ON;

											-- Insert statements for procedure here


											SELECT est.rut_estudiante, est.nombre_estudiante, est.apellido_paterno_estudiante,est.apellido_materno_estudiante, est.fecha_nacimiento, e_c.nombre_estado_civil
											FROM Estudiante est, Estado_civil e_c
											WHERE	est.id_estado_civil=e_c.id_estado_civil 
											and		(est.apellido_paterno_estudiante=@Apellido_Paterno_estudiante
													OR		@Apellido_paterno_estudiante IS NULL)
											AND		(est.apellido_materno_estudiante=@Apellido_Materno_estudiante
													OR		@Apellido_Materno_estudiante IS NULL)
										END
										GO
										*/

										--Clase 07/10/2025
--
exec Buscar_Algo NULL, NULL,'1970-10-20','1974-09-18'
exec Buscar_Algo NULL, NULL,NULL,'1974-09-18'
exec Buscar_Algo NULL, NULL,'1970-10-20',NULL
exec Buscar_Algo NULL, NULL,NULL,NULL


											/*
											CREATE or ALTER PROCEDURE Buscar_Algo
												@Apellido_Paterno_estudiante nchar(50),
												@Apellido_Materno_estudiante nchar(50),
												@Fecha_Nacimiento_Desde date,
												@Fecha_Nacimiento_Hasta date
											AS
											BEGIN
												-- SET NOCOUNT ON added to prevent extra result sets from
												-- interfering with SELECT statements.
												SET NOCOUNT ON;

												-- Insert statements for procedure here


												SELECT est.rut_estudiante, est.nombre_estudiante, est.apellido_paterno_estudiante,est.apellido_materno_estudiante, est.fecha_nacimiento, e_c.nombre_estado_civil
												FROM Estudiante est, Estado_civil e_c
												WHERE	est.id_estado_civil=e_c.id_estado_civil 
												and		(est.apellido_paterno_estudiante=@Apellido_Paterno_estudiante
														OR		@Apellido_paterno_estudiante IS NULL)
												AND		(est.apellido_materno_estudiante=@Apellido_Materno_estudiante
														OR		@Apellido_Materno_estudiante IS NULL)
												AND		(est.fecha_nacimiento between @Fecha_Nacimiento_Desde AND @Fecha_Nacimiento_Hasta
												or 		(est.fecha_nacimiento >= @Fecha_Nacimiento_Desde AND @Fecha_Nacimiento_Hasta is null)
												or		(est.fecha_nacimiento<=@Fecha_Nacimiento_Hasta AND @Fecha_Nacimiento_Desde is null)
												OR		@Fecha_Nacimiento_Hasta IS NULL AND @Fecha_Nacimiento_Desde is null)

											END
											GO
											*/
								--09/10/2025
--TRIGGER
--(disparador) o (Gatillador)

--Comparable a un SP(subprograma programable)
--Asociado a 3 acciones de modificacion de datos
--Validaciones
--

--Trigger
--Dos tipos:
--1- Pre
--2- Post


/*

CREATE TRIGGER Estudiante_Insert
   ON  Estudiante
   AFTER insert
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	declare @Edad tinyint
	select @Edad = dbo.Edad(ins.fecha_nacimiento)
	from INSERTED ins

	if @Edad<18
		rollback

END
GO

*/
-- MARTES 14/10

-- 49: Asegurar que Siempre la fecha de rgistro sea la fecha actual al agregar un Estudiante:
/* CREATE OR ALTER TRIGGER Fecha_Hoy
  ON  Estudiante
  AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE @Edad TINYINT
DECLARE @Largo_Nombre TINYINT
SELECT @Edad = dbo.Edad(ins.fecha_nacimiento)
FROM INSERTED ins

IF @Edad < 18
ROLLBACK

SELECT @Largo_Nombre = LEN(TRIM(ins.nombre_estudiante))
FROM INSERTED ins

IF @Largo_Nombre < 3
ROLLBACK

UPDATE Estudiante
SET fecha_registro = GETDATE()
WHERE rut_estudiante = (SELECT ins.rut_estudiante
FROM INSERTED ins)

END
GO  */
EXEC Estudiante_Insertar '4-4', 'Doña Tremebunda', ' Contreras', 'Lizama', '1960-06-01', 2
SELECT *
FROM Estudiante

-- 50: Crear una Copia de la tabla Estudiante en COPIA_ESTUDIANTE, que incluya todos sus registros:
SELECT *
INTO COPIA_ESTUDIANTE
FROM Estudiante

-- 51: Eliminar los registros de la tabla Estudiante:
DELETE Estudiante
drop table COPIA_ESTUDIANTE


-- 52: Insertar, en un solo comando, todos los registros de la tabla COPIA_ESTUDIANTE en la tabla Estudiante:
insert into Estudiante
select *
From COPIA_ESTUDIANTE

--

select * from Estudiante 

--TAREA
--AGREGAR MENSAJE PARA SABER POR QUE SE ABORTA EL TRIGGER 
--CON RAISERROR


                        /*
                        USE [Estudiante]
                        GO
                        /****** Object:  Trigger [dbo].[Estudiante_Insert]    Script Date: 16-10-2025 8:56:03 ******/
                        SET ANSI_NULLS ON
                        GO
                        SET QUOTED_IDENTIFIER ON
                        GO
                        ALTER   TRIGGER [dbo].[Estudiante_Insert]
                           ON  [dbo].[Estudiante]
                           AFTER INSERT
                        AS
                        BEGIN
                        -- SET NOCOUNT ON added to prevent extra result sets from
                        -- interfering with SELECT statements.
                        SET NOCOUNT ON;
                        
                            -- Insert statements for trigger here
                        
                        if exists (
                        select ins.rut_estudiante
                        from inserted ins
                        where dbo.Edad(ins.fecha_nacimiento)<18)
                        begin
                        	raiserror('ERROR: El estudiante debe ser mayor de 18 años',16,1)
                        	ROLLBACK
                        	return
                        end
                         
                        
                        if exists (
                        select ins.rut_estudiante
                        from inserted ins
                        where LEN(TRIM(ins.nombre_estudiante))<3)
                        begin
                        	raiserror('ERROR: El nombre del estudiante debe tener una cantidad de letras mayor a 3',16,1)
                        	ROLLBACK
                        	return
                        end
                        
                        update Estudiante
                        set fecha_registro=getdate()
                        from Estudiante E
                        inner join inserted ins on E.rut_estudiante=ins.rut_estudiante
                        
                        
                        END
                        */

					--17/10/2025
--Revision de prueba

--Ejercicio 1
/*
											CREATE FUNCTION TotalEquipo
											(	
												@nombreDepartamento1 nchar(50),
												@nombreDepartamento2 nchar(50),
												@TipoPantalla nchar(50),
												@nombre_estado_civil nchar(50)
											)
											RETURNS tinyint 
											AS
											RETURN 
											(
												declare @Restultado tinyint

												select  count(*)
												from DEPARTAMENTO  dep, Empleado emp, Equipo_Empleado e_e, Estado_Civil e_c, Equipo equ, Tipo_Pantalla e_p
												where dep.id_departamento=emp.id_departamento
												and		Emp.id_estado_civil=e_c=id_estado_civil
												and		emp.rut_empleado=e_e.rut_empleado
												and		e_e.id_equipo=equ.id_equipo
												and		equ.id_tipo_pantalla=t_p.id_tipo_pantalla

												and		e_e.fecha_devolucion		is null
												and		t_p.nombre_tipo_pantalla= @TipoPantalla
												and		dep.nombre_departamento in ('@nombreDepartamento1','@nombreDepartamento2')
												and		e_c=nombre_estado_civil=@nombre_estado_civil

												return @Restultado
											)
											GO
*/

--Ejercicio 2
/*
											CREATE PROCEDURE Pregunta2Nombre
												@nombreDepartamento1	nchar(50),
												@nombreDepartamento2	nchar(50),
												@TipoPantalla			nchar(50),
												@nombre_estado_civil	nchar(50),
												@Cantidad_Equipo		tinyint
											AS
											BEGIN
												-- SET NOCOUNT ON added to prevent extra result sets from
												-- interfering with SELECT statements.
												SET NOCOUNT ON;

												-- Insert statements for procedure here
												declare @Restultado tinyint

												select  equ.id_equipo, 
												from DEPARTAMENTO  dep, Empleado emp, Equipo_Empleado e_e, Estado_Civil e_c, Equipo equ, Tipo_Pantalla e_p
												where dep.id_departamento=emp.id_departamento
												and		Emp.id_estado_civil=e_c=id_estado_civil
												and		emp.rut_empleado=e_e.rut_empleado
												and		e_e.id_equipo=equ.id_equipo
												and		equ.id_tipo_pantalla=t_p.id_tipo_pantalla

												and		e_e.fecha_devolucion		is null
												and		t_p.nombre_tipo_pantalla= @TipoPantalla
												and		dep.nombre_departamento in ('@nombreDepartamento1','@nombreDepartamento2')
												and		e_c=nombre_estado_civil=@nombre_estado_civil

												select @Resultado=dbo.TotalEquipo(@nombreDepartamento1,@nombreDepartamento2,@TipoPantalla,@nombre_estado_civil)
									  
											END									  		
											GO	
*/
                  --21/10/2025
--Trigger ELIMINACION

--Al eliminar un estudiante, verificar si el rut termina en k, y en ese caso, no permitir eliminar.
--Para ello, crear una funcion qeue extraiga el DV de un rut dado. Utulice ésta funcion en ekl trigger

--Primero, funcion que entrega el digito verificador

												CREATE or alter FUNCTION DVer
												(
													@Rut nchar(10)
												)
												RETURNS char(1)
												AS
												BEGIN
													return RIGHT(TRIM(@Rut), 1)
												END
												GO


--Segundo, Trigger

							CREATE or alter TRIGGER Estudiante_Delete
							   ON  Estudiante
							   AFTER Delete
							AS 
							BEGIN
								-- SET NOCOUNT ON added to prevent extra result sets from
								-- interfering with SELECT statements.
								SET NOCOUNT ON;

								-- Insert statements for trigger here
								if exists (
											select del.rut_estudiante
											from DELETED del
											where dbo.DigVer2(del.rut_estudiante)='K')
								begin
									RAiserror('Error. Al menos un estudiante tiene DV "K". Se cancela la eliminacion',16,1)
									Rollback
								End 

							END
							GO

--Llamar a la eliminacion 'DELETE'
Delete Estudiante 
where rut_estudiante='3-K'

-------------------------------------------------------------------------------------------------------------------
--Que entregue el digito verificador despues del guión

									CREATE or alter FUNCTION DigVer2
									(
										@Rut nchar(10)
									)
									RETURNS nchar (1)
									AS
									BEGIN
										declare @posgion tinyint=patindex('%-%', trim(@Rut))

										if @posgion >0 and LEN(TRIM(@Rut))>@posgion
										begin	
											return substring(TRIM(@Rut), @posgion +1,1)
										end

										return 0
									END
									GO

							--Clase 23/10/2025
--
