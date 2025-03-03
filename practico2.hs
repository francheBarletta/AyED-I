-----------------
-- Practico 2 --
-----------------

--Laboratorio 1

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--ghci> sumatoria [1,2,3,4]
--10

sumatoria' :: Num a => [a] -> a
sumatoria' [] = 0
sumatoria' (x:xs) = x + sumatoria' xs

--ghci> sumatoria' [1.5,1,2]
--4.5

sumCuad :: [Int] -> Int
sumCuad [] = 0
sumCuad (x:xs) = x * x + sumCuad xs

--ghci> sumCuad [1,2,3,4]
--30

iga :: Int -> [Int] -> Bool
iga _ [] = False
iga n (x:xs) = (x == n) && iga n xs

potencia :: Int -> Int -> Int
potencia _ 0 = 1
potencia x n = x * potencia x (n - 1)

--ghci> potencia 4 2
--16

sumPar :: Int -> Int
sumPar 0 = 0
sumPar n | (n `mod` 2 == 0) = n + sumPar (n - 1)
         | otherwise = sumPar (n - 1) 
         
--ghci> sumPar 2
--2
--ghci> sumPar 3
--2
--ghci> sumPar 4
--6
--ghci> sumPar 5
--6
         
cuantos :: (a -> Bool) -> [a] -> Int
cuantos p [] = 0
cuantos p (x:xs) | p x = 1 + cuantos p xs
                 | otherwise = cuantos p xs
                 
--Laboratorio 2

data Carrera = Matematica | Fisica | Computacion | Astronomia deriving Eq

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Ord , Eq, Show)

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

--Laboratorio 4 Polimorfismo ad hoc

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:y:xs) | x < y = minimoElemento(x:xs)
                        | otherwise = minimoElemento(y:xs)
                        
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' [x] = x
minimoElemento' (x:y:xs) | x < y = minimoElemento(x:xs)
                         | otherwise = minimoElemento(y:xs)

--Laboratorio 5 Sinónimo de tipos; constructores con parámetros

--Sinonimmos de tipo
type Altura = Int
type NumCamiseta = Int

--Tipos algebraicos sin parametros (AKA enumerados)
data Zona = Arco | Defensa | Mediocampo | Delantera deriving (Eq)
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha
--Sinonimo 
type ManoHabil = PiernaHabil

--Deportista es un tipo algebraico con constructores parametricos
data Deportista = Ajedrecista                                     --Constructor sin argumentos
                | Ciclista Modalidad                              --Constructor con un argumento
                | Velocista Altura                                --Constructor con un argumento
                | Tenista TipoReves ManoHabil Altura              --Constructor con tres argumento
                | Futbolista Zona NumCamiseta PiernaHabil Altura  --Constructor con un argumento
                
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (Velocista _:xs) = 1 + contar_velocistas xs
contar_velocistas (_:xs) = contar_velocistas xs

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas (Futbolista Arco _ _ _ : xs) Arco = 1 + contar_futbolistas xs Arco
contar_futbolistas (Futbolista Defensa _ _ _ : xs) Defensa = 1 + contar_futbolistas xs Defensa
contar_futbolistas (Futbolista Mediocampo _ _ _ : xs) Mediocampo = 1 + contar_futbolistas xs Mediocampo
contar_futbolistas (Futbolista Delantera _ _ _ : xs) Delantera = 1 + contar_futbolistas xs Delantera
contar_futbolistas (_ : xs) z = contar_futbolistas xs z

--ghci> contar_futbolistas [Futbolista Arco 1 Derecha 180, Velocista 170, Futbolista Defensa 4 Izquierda 175, Futbolista Arco 12 Derecha 185] Arco
--2
--ghci> 

--Laboratorio 6

sum_pot :: Int -> Int -> Int
sum_pot _ 0 = 0
sum_pot x n = potencia x n + sum_pot x (n - 1)

--ghci> sum_pot 2 3
--14

termino :: Int -> Double
termino i = 4 * fromIntegral (potencia (-1) i) / fromIntegral (2 * i + 1)

piAprox :: Int -> Double
piAprox n = sum (map termino [0 .. n-1])

--ghci> piAprox 3
--3.466666666666667
--ghci> piAprox 

cubo :: Int -> Int
cubo 0 = 0
cubo x = x * x * x

--ghci> cubo 3
--27

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

esProductoriaDeRestantes :: [Int] -> Bool
esProductoriaDeRestantes [] = True
esProductoriaDeRestantes (x:xs) = (x == productoria xs) && esProductoriaDeRestantes xs

--ghci> esProductoriaDeRestantes [1,2,3,4] 
--False
--ghci> esProductoriaDeRestantes [] 
--True

--Laboratorio 7

iguales :: Eq a => [a] -> Bool
iguales [] = True
iguales [_] = True
iguales (x:y:xs) = (x == y) && iguales (y:xs)

--ghci> iguales [3,3,3]
--True
--ghci> iguales [3,3,4]
--False

minimo :: [Int] -> Int
minimo [x] = x
minimo (x:y:xs) = minimo ((min x y) : xs)

--ghci> minimo [1,2,3,4]
--1
--ghci> minimo [1,2,3,4,-1]
--(-1)

creciente :: [Int] -> Bool
creciente [] = True
creciente (x:[]) = True
creciente(x:y:xs) = x < y && creciente xs

--ghci> creciente [1,2,3,4]
--True
--ghci> creciente [1,2,3,2]
--False


prod :: [Int] -> [Int] -> Int
prod [] ys = 0
prod xs [] = 0
prod(x:xs)(y:ys) = x * y + prod xs ys

--ghci> prod[1,2,3][4,5,6]
--32

--Laboratorio 8

--a)

gpsum :: Int -> [Int] -> Bool
gpsum n [] = n >= 0 
gpsum n (x:xs) = n >= 0 && gpsum(n+x)xs

--ghci> gpsum 2 [0,1,2,3,4]
--True
--ghci> gpsum 5 [1,2,-10]
--False

--b)

gpsum_ant :: Int -> [Int] -> Bool
gpsum_ant _ [] = False
gpsum_ant n (x:xs) = (n == sum xs) || gpsum_ant (n - x) xs

--ghci> gpsum_ant 1 [1,2,3]
--False

--c) 
--Laboratorio 9
sumanOcho :: [Int] -> Int
sumanOcho = sumanOchoAux 0 0  -- Llamada a la función auxiliar con acumuladores inicializados en 0

sumanOchoAux :: Int -> Int -> [Int] -> Int
sumanOchoAux _ count [] = count  -- Caso base: si la lista está vacía, devolvemos el contador
sumanOchoAux acum count (x:xs)
    | acum + x == 8  = sumanOchoAux (acum + x) (count + 1) xs  -- Si la suma del prefijo es 8, incrementamos econtador
    | otherwise      = sumanOchoAux (acum + x) count xs  -- Si no, continuamos acumulando sin incrementar el contador
    
--Laboratorio 10

--a)

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

--b) 

data Alteracion = Bemol | Natural | Sostenido deriving (Ord , Eq, Show)

--c)

data NotaMusical = Nota NotaBasica Alteracion deriving (Ord, Eq, Show)

--d)

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n Bemol)     = (sonidoNatural n) - 1
sonidoCromatico (Nota n Natural)   = (sonidoNatural n) + 0
sonidoCromatico (Nota n Sostenido) = (sonidoNatural n) +1

--Laboratorio 11 Tipos enumerados con polimorfismo

dividir :: Int -> Int -> Maybe Int
dividir x 0 = Nothing
dividir x y = Just (x `div` y)

--ghci> dividir 4 0
--Nothing
--ghci> dividir 4 2
--Just 2

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

--ghci> primerElemento []
--Nothing
--ghci> primerElemento [1,2,3,4]
--Just 1

--Laboratorio 12

data Cola = Vacia | Encolada Deportista Cola

--a) elimina de la cola a la persona que está en la primer posición de una cola, por haber sido atendida. Si la cola está vacı́a, devuelve Nothing.
atender :: Cola -> Maybe Cola
atender Vacia = Nothing
atender (Encolada _ cola) = Just cola

--b) agrega una persona a una cola de deportistas, en la última posición.
encolar :: Deportista -> Cola -> Cola
encolar d Vacia = Encolada d Vacia
encolar d (Encolada x cola) = Encolada x (encolar d cola)

--c) devuelve el/la primera futbolista dentro de la cola que juega en la zona que se corresponde con el segundo parámetro. Si no hay futbolistas jugando en esa zona devuelve Nothing.
busca :: Cola -> Zona -> Maybe Deportista
busca Vacia _ = Nothing
busca (Encolada (Futbolista zona numCamiseta piernaHabil altura) cola) z
    | zona == z  = Just (Futbolista zona numCamiseta piernaHabil altura)
    | otherwise  = busca cola z
busca (Encolada _ cola) z = busca cola z

--Laboratorio 13 Tipos recursivos y polimórficos

--Encontrar la definición de una palabra en un diccionario;
--Encontrar el lugar de votación de una persona.

data ListaAsoc a b = Vacia' | Nodo a b (ListaAsoc a b)

type Diccionario = ListaAsoc String String
type Padron      = ListaAsoc Int    String

--a) devuelve la cantidad de datos en una lista.

la_long :: ListaAsoc a b -> Int
la_long Vacia' = 0
la_long (Nodo _ _ resto) = 1 + la_long resto

--ghci> la_long (Nodo 1 "a" (Nodo 2 "b" (Nodo 3 "c" Vacia')))
--3

--b) que devuelve la concatenación de dos listas de asociaciones.
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia' ys = ys
la_concat (Nodo a b ys) xs = Nodo a b (la_concat xs ys)

--c) agrega un nodo a la lista de asociaciones si la clave no está en la lista, o actualiza el valor si la clave ya se encontraba.

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia' clave valor = Nodo clave valor Vacia'
la_agregar (Nodo a b xs) clave valor
    | a == clave = Nodo a valor xs  -- Si la clave ya existe, actualiza el valor
    | otherwise  = Nodo a b (la_agregar xs clave valor)  -- Si no, sigue buscando

--d) Convierte la lista de asociaciones en una lista de tuplas (clave, valor).

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia' = []
la_pares (Nodo a b xs) = (a, b) : la_pares xs

--e) Busca un valor en la lista asociativa y lo devuelve como Maybe b.

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia' _ = Nothing
la_busca (Nodo a b xs) clave
    | a == clave = Just b  -- Si encuentra la clave, devuelve el valor
    | otherwise  = la_busca xs clave  -- Si no, sigue buscando en la lista

--f) Elimina una clave de la lista asociativa.

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia' = Vacia'
la_borrar clave (Nodo a b xs)
    | a == clave = xs  -- Si encuentra la clave, la elimina
    | otherwise  = Nodo a b (la_borrar clave xs)  -- Si no, sigue buscando
    

--Laboratorio 14
--Ejemplo de que listas es lo mismo que segmentos ;) en el 8a) se ve perfectamente

--gpsum :: Int -> Int -> Bool
--gpsum n [] = n >= 0
--gpsum n (x:xs) = n >= 0 && gpsum (n + x) xs

--10a) La lista xs es un segmento inicial de la lista ys.

prefijo :: Eq a => [a] -> [a] -> Bool
prefijo xs [] = xs == []
prefijo [] ys = True
prefijo (x:xs) (y:ys) = (x == y) && prefijo xs ys

--10b) La lista xs es un segmento de la lista ys.

seg :: Eq a => [a] -> [a] -> Bool
seg xs [] = xs == []
seg xs(y:ys) = prefijo xs(y:ys) || seg xs ys

--Laboratorio 15

--a) sumin.xs = ⟨Min as, bs, cs : xs = as ++ bs ++ cs : sum.bs ⟩
--(suma mı́nima de un segmento).

msum :: [Int] -> Int
msum [] = 0
msum (x:xs) = min 0 (msum xs + x)

suma_min :: [Int] -> Int
suma_min [] = 0
suma_min (x:xs) = min x (x + suma_min xs)

--b)maxiga.e.xs = ⟨Max as, bs, cs : xs = as ++ bs ++ cs ∧ iga.e.bs : #bs ⟩
--(máxima longitud de iguales a e) donde iga es la función del ejercicio lab 1b)

maxiga' :: Int -> [Int] -> Int
maxiga' e [] = 0
maxiga' e (x:xs) | (x == e) = 1 + maxiga' e xs
                 | otherwise = 0

maxiga :: Int -> [Int] -> Int
maxiga e [] = 0
maxiga e (x:xs) = max (maxiga' e (x:xs)) (maxiga e xs)

--Laboratorio 17

--b)El elemento e ocurre en las posiciones pares de la lista xs.
ocurreEnPares :: Eq a => a -> [a] -> Bool
ocurreEnPares e xs = all (== e) (pares xs)
  where
    pares [] = []
    pares [_] = []
    pares (_:y:ys) = y : pares ys
    
--ghci> ocurreEnPares 5 [0,5,1,5,2,5]
--True
  
--c) El elemento e ocurre únicamente en las posiciones pares de la lista xs.
ocurreSoloEnPares :: Eq a => a -> [a] -> Bool
ocurreSoloEnPares e xs = all (== e) (pares xs) && not (e `elem` impares xs)
  where
    pares [] = []
    pares [_] = []
    pares (_:y:ys) = y : pares ys

    impares [] = []
    impares (x:xs) = x : pares xs
    
--ghci> ocurreSoloEnPares 5 [0,5,1,5,2,5,5]
--False


--f) En la lista xs solo ocurren valores que anulan la función f.
anulaFuncion :: (a -> Bool) -> [a] -> Bool
anulaFuncion f xs = all f xs

--ghci> anulaFuncion even [2,4,6,8]
--True
--ghci> anulaFuncion even [2,4,6,8,1]
--False

--Practicas pre final

-----------------
----- Tema A ----
-----------------

--Definir el tipo Video que consta de dos constructores Pelicula y CapSerie con los
--siguientes parámetros:
---El constructor Pelicula debe tomar como parámetros el nombre, el director,
--la duración (en minutos) y el año de estreno.
---El constructor CapSerie debe tomar como parámetros el nombre de la serie,
--el nro de capítulo, la temporada, el año de estreno de la temporada.

type Nombre = String
type Director = String
type Duracion = Int 
type Año = Int 
type Capitulo = Int 
type Temporada = Int 

data Video = Pelicula Nombre Director Duracion Año 
           | CapSerie Nombre Capitulo Temporada Año deriving Show

--A partir del tipo definido en el punto anterior, definí los siguientes términos(videos):
--elPadrino :: Video
--elPadrino = <COMPLETAR>
--correspondiente a la película “El Padrino” con director “Francis Ford Coppola”,
--duración 177 minutos y año de estreno 1972.

elPadrino :: Video
elPadrino = Pelicula "“El Padrino" "Francis Ford Coppola" 177 1972

--breakingBadS01E01 :: Video
--breakingBadS01E01 = <COMPLETAR>
--correspondiente al capítulo de serie “Breaking Bad”, con capítulo número 1,
--temporada 1 y año de estreno de temporada 2008.

breakingBadS01E01 :: Video
breakingBadS01E01 = CapSerie "Breaking Bad" 1 1 2008

--Definir la función esPrimerCapitulo :: Video -> Bool que dado un Video,
--devuelve True si el video es el primer capítulo de la primera temporada de una serie,
--False caso contrario.

esPrimerCapitulo :: Video -> Bool
esPrimerCapitulo (CapSerie _ 1 1 _) = True
esPrimerCapitulo _ = False

--Definir la función esEstreno :: Video -> Bool que dado un Video, devuelve
--True si el video es una película cuyo año de estreno es igual a 2024.

esEstreno :: Video -> Bool
esEstreno (Pelicula _ _ _ 2024) = True
esEstreno _ = False

--Definir la función duracionPeliMasLarga :: [Video] -> Int que dada una
--lista de de videos, devuelve la duración de la película más larga. En caso que no haya
--películas devuelve 0.

duracionPeliMasLarga :: [Video] -> Int
duracionPeliMasLarga [] = 0
duracionPeliMasLarga ((Pelicula _ _ duracion _):xs) = max duracion (duracionPeliMasLarga xs)
duracionPeliMasLarga (_:xs) = duracionPeliMasLarga xs

--Dado el tipo recursivo ColaVideo definido de la siguiente manera
--data ColaVideo = Vacia | Encolada Video ColaVideo deriving Show
--podemos definir, por ejemplo, una cola de reproducción de la siguiente manera
--colaReproduccion :: ColaVideo
--colaReproduccion = Encolada elPadrino (Encolada breakingBadS01E01
--Vacia))
--Definir la función pelisDelDirector :: ColaVideo -> String -> ColaVideo
--que dada una cola de reproducción de videos q, y el nombre de un director d,
--devuelve la cola de reproducción que tiene solamente las películas del director d (en
--el mismo orden que aparecen en q).

data ColaVideo = Vacia | Encolada Video ColaVideo deriving Show

pelisDelDirector :: ColaVideo -> String -> ColaVideo
pelisDelDirector Vacia _ = Vacia
pelisDelDirector (Encolada (Pelicula nombre director duracion año) cola) d
  | director == d = Encolada (Pelicula nombre director duracion año) (pelisDelDirector cola d)
  | otherwise = pelisDelDirector cola d
pelisDelDirector (Encolada (CapSerie _ _ _ _) cola) d = pelisDelDirector cola d

-----------------
----- Tema B ----
-----------------

--Definir el tipo Video que consta de dos constructores Pelicula y CapSerie con los
--siguientes parámetros:
-- El constructor Pelicula debe tomar como parámetros el nombre, el director, la
--duración (en minutos) y el año de estreno.
-- El constructor CapSerie debe tomar como parámetros el nombre de la serie, el nro
--de capítulo, la temporada, el año de estreno de la temporada.*/

type Nombre = String
type Director = String
type Duracion = Int 
type Año = Int 
type Capitulo = Int 
type Temporada = Int 

data Video = Pelicula Nombre Director Duracion Año 
           | CapSerie Nombre Capitulo Temporada Año deriving Show

--A partir del tipo definido en el punto anterior, definí los siguientes términos(videos):
--odisea2001 :: Video
--odisea2001 = <COMPLETAR>
--correspondiente a la película “2001: Odisea del espacio” con director “Stanley
--Kubrick”, duración 142 minutos y año de estreno 1968.
--theOfficeS02E05 :: Video
--theOfficeS02E05 = <COMPLETAR>
--correspondiente al capítulo de serie “The Office”, con capítulo número 5, temporada 2
--y año de estreno de temporada 2005.

odisea2001 :: Video
odisea2001 = Pelicula "2001: Odisea del espacio" "Stanley Kubrick" 142 1968

theOfficeS02E05 :: Video
theOfficeS02E05 = CapSerie "The Office" 5 2 2005

--Definir la función esDelDirector :: Video -> String -> Bool que dado un
--Video y el nombre de un director, devuelve True si el video es una película del director
--dado.

esDelDirector :: Video -> String -> Bool
esDelDirector (CapSerie _ _ _ _) _ = False
esDelDirector (Pelicula _ director _ _) nombre = director == nombre

--Definir la función esActual :: Video -> Bool que dado un Video, devuelve True
--si el video es un capítulo de serie cuyo año de estreno de temporada es mayor o igual
--a 2020 y Falso en caso contrario.

esActual :: Video -> Bool
esActual (CapSerie _ _ _ año) = año >= 2020
esActual (Pelicula _ _ _ _) = False

--Definir la función tiempoPelis :: [Video] -> Int -> Int que dada una lista
--de videos y un año dado, devuelve la suma de la duración de todas las películas de
--ese año que están en la cola.

tiempoPelis :: [Video] -> Int -> Int
tiempoPelis [] _ = 0
tiempoPelis ((Pelicula _ _ duracion año):xs) x | x == año = duracion + tiempoPelis xs x 
                                               | otherwise = tiempoPelis xs x
tiempoPelis ((CapSerie _ _ _ _):xs) x = tiempoPelis xs x

--Dado el tipo recursivo ColaVideo definido de la siguiente manera
--data ColaVideo = Vacia | Encolada Video ColaVideo deriving Show
--podemos definir colaReproducción de la siguiente manera
--colaReproduccion :: ColaVideo
--colaReproduccion = Encolada elPadrino (Encolada breakingBadS01E01
--Vacia))s
--Definir la función seriesActuales :: ColaVideo -> ColaVideo que dada una
--cola de reproducción de videos q, devuelve la cola de reproducción que tiene
--solamente los capítulos de serie actuales (en el mismo orden que aparecen en q).

data ColaVideo = Vacia | Encolada Video ColaVideo deriving Show

seriesActuales :: ColaVideo -> ColaVideo
seriesActuales Vacia = Vacia 
seriesActuales (Encolada (Pelicula _ _ _ _) cola) = seriesActuales cola
seriesActuales (Encolada (CapSerie nombre cap temp año) cola)
  | esActual (CapSerie nombre cap temp año) = Encolada (CapSerie nombre cap temp año) (seriesActuales cola)
  | otherwise = seriesActuales cola

-----------------
----- Tema G ----
-----------------

--Definir el tipo Ahorro que consta de dos constructores Descuento y Reintegro con
--los siguientes parámetros:
-- El constructor Descuento debe tomar como parámetros el nombre de la
--billetera (por ejemplo "PersonalPay", "Uala", "BnaMas", "NaranjaX"), la
--categoría, es decir en qué es el descuento (por ejemplo "Combustible" ,
--"Supermercado", "ComidaRapida"), el porcentaje de descuento, el tope de
--descuento y la lista de días de la semana que funciona el descuento.
-- El constructor Reintegro debe tomar como parámetros el nombre de la
--billetera virtual en que te darán reintegro, la categoría, es decir en qué es el
--descuento (por ejemplo "Combustible", "Supermercado", "ComidaRapida") y
--el monto de reintegro.
--Ayuda: para el día de la semana use data Dia = Lunes | Martes | Miercoles |
--Jueves | Vienes | Sabado | Domingo deriving (Eq, Show). Puede usar la función
--elem del Preludio para saber si un elemento pertenece a una lista.

type Billetera = String
type Categoria = String
type Porcentaje = Int
type Tope = Int
type Monto = Int

data Dia = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Eq, Show)

data Ahorro = Descuento Billetera Categoria Porcentaje Tope [Dia]
            | Reintegro Billetera Categoria Monto deriving Show

--A partir del tipo definido en el punto anterior, definir los siguientes ejemplos de Ahorro:
--naftaPP :: Ahorro
--naftaPP = <COMPLETAR>
--correspondiente al descuento “PersonalPay” en “Combustible”, 25, 2500, días Lunes y
--Martes.

--macNX :: Ahorro
--macNX = <COMPLETAR>
--correspondiente al reintegro “NaranjaX”, en concepto “comida rapida”, por $3000

naftaPP :: Ahorro
naftaPP = Descuento "PersonalPay" "Combustible" 25 2500 [Lunes, Martes]

macNX :: Ahorro
macNX = Reintegro "NaranjaX" "ComidaRapida" 3000

--Definir la función hayDescuentoDia :: Ahorro -> Dia -> Bool que dado un
--ahorro y un Dia determinado, devuelve True si es el ahorro es un Descuento (notar
--que no puede ser reintegro) del Dia dado, False en caso contrario.

hayDescuentoDia :: Ahorro -> Dia -> Bool
hayDescuentoDia (Descuento _ _ _ _ dias) dia = elem dia dias
hayDescuentoDia _ _ = False

--Definir la función esDescuentoCombustible :: Ahorro -> Bool que dado un
--Ahorro, devuelve True si el ahorro es un Descuento en Combustible.

esDescuentoCombustible :: Ahorro -> Bool
esDescuentoCombustible (Descuento _ "Combustible" _ _ _) = True
esDescuentoCombustible _ = False

--Definir la función mayorDescuentoOReintegro :: [Ahorro] -> Int que
--dada una lista de ahorros, devuelve el mayor de los descuentos o reintegros, tomando
--en el caso de Descuento el tope de descuento. En caso que no haya ahorros
--devuelve 0.

mayorDescuentoOReintegro :: [Ahorro] -> Int
mayorDescuentoOReintegro [] = 0
mayorDescuentoOReintegro ((Descuento _ _ _ tope _):xs) = max tope (mayorDescuentoOReintegro xs)
mayorDescuentoOReintegro ((Reintegro _ _ monto):xs) = max monto (mayorDescuentoOReintegro xs)

--Dado el tipo recursivo ColaAhorro definido de la siguiente manera
--data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show
--podemos definir los ahorros de María como
--ahorrosMaria :: ColaAhorro
--ahorrosMaria = AgregarAhorro naftaPP (AgregarAhorro macNX NoHayAhorro))

--Definir la función ahorrosCombustible :: ColaAhorro -> ColaAhorro
--que dada una cola de ahorros q, devuelve la cola de ahorros que tiene solamente los
--descuentos o reintegros en combustible (en el mismo orden que aparecen en q).

data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show

ahorrosMaria :: ColaAhorro
ahorrosMaria = AgregarAhorro naftaPP (AgregarAhorro macNX NoHayAhorro)

ahorrosCombustible :: ColaAhorro -> ColaAhorro
ahorrosCombustible NoHayAhorro = NoHayAhorro
ahorrosCombustible (AgregarAhorro ahorro cola)
  | esDescuentoCombustible ahorro = AgregarAhorro ahorro (ahorrosCombustible cola)
  | otherwise = ahorrosCombustible cola

-----------------
----- Tema H ----
-----------------

--Definir el tipo Ahorro que consta de dos constructores Descuento y Reintegro con
--los siguientes parámetros:
-- El constructor Descuento debe tomar como parámetros el nombre de la
--billetera (por ejemplo "PersonalPay", "Uala", "BnaMas", "NaranjaX"), la
--categoría, es decir en qué es el descuento (por ejemplo "Combustible",
--"Supermercado", "ComidaRapida"), el monto de descuento, el mes de
--descuento (expresado numéricamente).
-- El constructor Reintegro debe tomar como parámetros el nombre de la
--billetera virtual en que te darán reintegro, el concepto y el monto de reintegro.
--Para las billeteras y los descuentos en particular, se pueden crear tipos de datos
--nuevos o simplemente usar Strings e Int cuando corresponda.

type Billetera = String
type Categoria = String
type Monto = Int
type Mes = Int

data Ahorro = Descuento Billetera Categoria Monto Mes
            | Reintegro Billetera Categoria Monto deriving Show

--A partir del tipo definido en el punto anterior, definí los siguientes ejemplos de Ahorro:
--supermercadoUa :: Ahorro
--supermercadoUa = <COMPLETAR>
--correspondiente al descuento “Uala” en categoría de “Supermercado”, de $1500, para
--el mes 10 (octubre).
--premioBna :: Ahorro
--premioBna = <COMPLETAR>

--correspondiente al reintegro “BnaMas”, en “premio cumplidor”, por $3000.

supermercadoUa :: Ahorro
supermercadoUa = Descuento "Uala" "Supermercado" 1500 10

premioBna :: Ahorro
premioBna = Reintegro "BnaMas" "Premio Cumplidor" 3000

--Definir la función esReintegro :: Ahorro -> String -> Bool que dado ahorro y
--el nombre de una billetera b, devuelve True si el ahorro es un reintegro (notar que no
--puede ser desceunto) correspondiente a la billetera b, False en caso contrario.

esReintegro :: Ahorro -> String -> Bool
esReintegro (Reintegro b _ _) nombre = b == nombre
esReintegro _ _ = False

--Definir la función esDescuentoPrimavera :: Ahorro -> Bool que dado un
--Ahorro, devuelve True si el ahorro es un descuento de los meses de septiembre,
--octubre y noviembre.

esDescuentoPrimavera :: Ahorro -> Bool
esDescuentoPrimavera (Descuento _ _ _ mes) = mes `elem` [9, 10, 11]
esDescuentoPrimavera _ = False

--Definir la función totalDesceuntosMes :: [Ahorro] -> Int -> Int que
--dada una lista de de ahorros y un mes, devuelve la suma de los descuentos del mes
--dado.

totalDescuentosMes :: [Ahorro] -> Int -> Int
totalDescuentosMes [] _ = 0
totalDescuentosMes ((Descuento _ _ monto mes):xs) m | mes == m = monto + totalDescuentosMes xs m
                                                    | otherwise = totalDescuentosMes xs m
totalDescuentosMes ((Reintegro _ _ _):xs) m = totalDescuentosMes xs m

--Dado el tipo recursivo ColaAhorro definido de la siguiente manera
--data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show
--podemos definir los ahorros de Juan como
--ahorrosJuan :: ColaAhorro
--ahorrosJuan = AgregarAhorro supermercadoUa (AgregarAhorro premioBna
--NoHayAhorro))
--Definir la función buenosAhorros :: ColaAhorro -> ColaAhorro
--que dada una cola de ahorros q, devuelve la cola de ahorros (descuentos o reintegros) de
--montos superiores a los $5000 (en el mismo orden que aparecen en q).

data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show

ahorrosJuan :: ColaAhorro
ahorrosJuan = AgregarAhorro supermercadoUa (AgregarAhorro premioBna NoHayAhorro)

buenosAhorros :: ColaAhorro -> ColaAhorro
buenosAhorros NoHayAhorro = NoHayAhorro
buenosAhorros (AgregarAhorro ahorro cola)
  | montoSuperior ahorro = AgregarAhorro ahorro (buenosAhorros cola)
  | otherwise = buenosAhorros cola
  where
    montoSuperior (Descuento _ _ monto _) = monto > 5000
    montoSuperior (Reintegro _ _ monto) = monto > 5000

-----------------
----- Final -----
-----------------

--Descripción del problema
--Para un inventario de una reserva de animales, se necesita un sistema en Haskell para
--especificar el tipo Animal, que puede ser Vertebrado o Invertebrado. Estas categorías tienen
--diferentes características, por eso será necesario definir un tipo específico Animal y algunas
--funciones asociadas.

--Ejercicio 1
--El tipo Animal que tiene 2 constructores:
--Vertebrado con parámetros Nombre (sinónimo de String), Peso (sinónimo de Int),
--Peligrosidad (Int), éste último indica cuán peligroso es del 1 al 10 (siendo 1 no peligroso y 10
--muy peligroso).
---Invertebrado con parámetros Nombre, TienePatas (cuyas posibilidades son Si o No un tipo
--enumerado), y Peligrosidad igual que en el constructor anterior.
--a) Implemente los tipos Peso, Nombre, TienePatas
--b) Implemente el tipo Animal.
--c) Defina los siguientes animales (ejemplos):
--perroCaniche es un vertebrado de nombre “Pompon”, pesa 6 kg, y su nivel de peligrosidad es
--1.
--ArañaPollito es un invertebrado de nombre “Pollito”, que si tiene patas y es de peligrosidad
--10.

-- Implementación del ejercicio 1

type Nombre = String
type Peso = Int
data TienePatas = Si | No deriving (Eq, Show)

data Animal = Vertebrado Nombre Peso Int
            | Invertebrado Nombre TienePatas Int
            deriving (Show)

-- Definición de animales
tiburonBlanco :: Animal
tiburonBlanco = Vertebrado "Tiburon Blanco" 1100 9

perroCaniche :: Animal
perroCaniche = Vertebrado "Pompon" 6 1

aranaPollito :: Animal
aranaPollito = Invertebrado "Pollito" Si 10

--Ejercicio 2
--Defina las siguiente funciones no recursivas sobre para cualquier tipo de Animal.
--a) Escriba una función llamada es_peligroso :: Animal -> Bool que tome un
--Animal devuelva True en caso de que la peligrosidad sea mayor estricta que 5, False en caso
--contrario.
--b) Escriba una función llamada o cuanto_pesa:: Animal -> Int que tome un Animal
--y en caso de ser un vertebrado devuelva el peso del mismo, y en caso ser invertebrado
--devuelva -1

es_peligroso :: Animal -> Bool
es_peligroso (Vertebrado _ _ p) = p > 5
es_peligroso (Invertebrado _ _ p) = p > 5

cuanto_pesa :: Animal -> Int
cuanto_pesa (Vertebrado _ peso _) = peso
cuanto_pesa (Invertebrado _ _ _) = -1

--Definir por recursión la función
--con_patas_peligrosos :: [Animal] -> Int -> [Nombre]
--que dada una lista de animales y un número de peligrosidad n devuelve la lista de los
--nombres de los animales que tienen patas y peligrosidad mayor estricta que n que están en la
--lista.

con_patas_peligrosos :: [Animal] -> Int -> [Nombre]
con_patas_peligrosos [] _ = []
con_patas_peligrosos ((Invertebrado nombre Si p):xs) n
    | p > n = nombre : con_patas_peligrosos xs n
    | otherwise = con_patas_peligrosos xs n
con_patas_peligrosos (_:xs) n = con_patas_peligrosos xs n
