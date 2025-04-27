----------------
-- Practico 2 --
----------------

--Ejercicio 1
import Prelude hiding (Maybe, Nothing, Just)

data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Eq)

titulo :: Carrera -> String
titulo Matematica  = "Licenciatura en Matematica"
titulo Fisica      = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia  = "Licenciatura en Astronomia"

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq)

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do  = 'C'
cifradoAmericano Re  = 'D'
cifradoAmericano Mi  = 'E'
cifradoAmericano Fa  = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La  = 'A'
cifradoAmericano Si  = 'B'

--Ejercicio 3

--a)
minimoElemento :: (Ord a) => [a] -> a
minimoElemento [] = error "La lista no puede estar vacia"
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

--minimoElemento [1,2,3]
--1

--b)
minimoElemento' :: (Ord a, Bounded a) => [a] -> a 
minimoElemento' [] = maxBound
minimoElemento' [x] = x
minimoElemento' (x:xs) = min x (minimoElemento' xs)

--Ejercicio 4

--a)
--Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int

--Tipos algebraicos sin parametros (aka enumerado)
data Zona = Arco | Defensa | Mediocampo | Delantera deriving (Eq, Show)
data TipoRevez = DosManos | UnaMano deriving (Eq, Show)
data Modalidad = Carrera | Pista | Monte | BMX deriving (Eq, Show)
data PiernaHabil =  Izquierda | Derecha deriving (Eq, Show)

--Sinonimo
type ManoHabil = PiernaHabil

--Deportista es un tipo algebraico con constructores parametricos
data Deportista = Ajedresista                                    -- Constructor sin argumentos
                | Ciclista Modalidad                             -- Constructor con un argumento
                | Velocista Altura                               -- Constructor con un argumento
                | Tenista TipoRevez ManoHabil Altura             -- Constructor con tres argumentos
                | Futbolista Zona NumCamiseta PiernaHabil Altura -- Constructor con cuatro argumentos
                deriving (Eq, Show)

--c)
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (Velocista _ : xs) = 1 + contar_velocistas xs
contar_velocistas (_ : xs) = contar_velocistas xs

--Main> let lista = [Velocista 175, Ciclista Pista, Ajedresista, Velocista 180, Futbolista Delantera 10 Izquierda 185]
--Main> contar_velocistas lista
--2

--d)
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas (Futbolista zona _ _ _ : xs) z
  | zona == z  = 1 + contar_futbolistas xs z
  | otherwise  = contar_futbolistas xs z
contar_futbolistas (_: xs) z = contar_futbolistas xs z

--ghci> let lista = [Futbolista Arco 1 Derecha 180, Futbolista Defensa 2 Izquierda 175, Ciclista Pista, Ajedresista]
--ghci> let zona = Arco
--ghci> contar_futbolistas lista zona
--1

--Ejercicio 5
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

data Alteracion = Bemol | Natural | Sostenido deriving (Show, Eq)

--c)

data NotaMusical = Nota NotaBasica Alteracion deriving (Eq)

--d)

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota _ Sostenido) = 1
sonidoCromatico (Nota _ Bemol) = -1
sonidoCromatico (Nota _ Natural) = 0

--ghci> let nota = Nota Do Sostenido
--ghci> sonidoCromatico nota
--1

--Ejercicio 6

data Maybe a = Nothing | Just a deriving (Eq, Show)

dividir :: Int -> Int -> Maybe Int
dividir x 0 = Nothing
dividir x y = Just (x `div` y)

--ghci> dividir 10 2
--5

--a)

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:_) = Just x

--Ejercicio 7

data Cola = VaciaC | Encolada Deportista Cola deriving (Eq, Show)
--a)

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ xs) = Just xs

--ghci> let cola = Encolada Ajedresista (Encolada (Ciclista Pista) VaciaC)
--ghci> atender cola
--Just (Encolada (Ciclista Pista) VaciaC)

encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = Encolada d VaciaC
encolar d (Encolada x xs) = Encolada x (encolar d xs)

--ghci> let cola = Encolada Ajedresista (Encolada (Ciclista Pista) VaciaC)
--ghci> encolar (Tenista DosManos Izquierda 180) cola
--Encolada Ajedresista (Encolada (Ciclista Pista) (Encolada (Tenista DosManos Izquierda 180) VaciaC))

buscar :: Deportista -> Cola -> Zona -> Maybe Deportista
buscar _ VaciaC _ = Nothing
buscar d (Encolada x xs) z
  | d == x = Just x
  | otherwise = buscar d xs z
  
--ghci> let cola = Encolada Ajedresista (Encolada (Ciclista Pista) VaciaC)
--ghci> buscar Ajedresista cola Arco
--Just Ajedresista

--Ejercicio 8

data ListaAsoc a b = Vacia | Asoc a b (ListaAsoc a b)

type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String

--b1) 
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Asoc _ _ xs) = 1 + la_long xs
--ghci> let lista = Asoc 1 "uno" (Asoc 2 "dos" Vacia)
--ghci> la_long lista
--2
 
--b2)
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia ys = ys
la_concat xs Vacia = xs
la_concat (Asoc x y xs) ys = Asoc x y (la_concat xs ys)
--ghci> let lista1 = Asoc 1 "uno" (Asoc 2 "dos" Vacia)
--ghci> let lista2 = Asoc 3 "tres" (Asoc 4 "cuatro" Vacia)
--ghci> la_concat lista1 lista2
--Asoc 1 "uno" (Asoc 2 "dos" (Asoc 3 "tres" (Asoc 4 "cuatro" Vacia)))

--b3)
la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia k v = Asoc k v Vacia
la_agregar (Asoc x y xs) k v
  | x == k = Asoc x v xs
  | otherwise = Asoc x y (la_agregar xs k v)
--ghci> let lista = Asoc 1 "uno" (Asoc 2 "dos" Vacia)
--ghci> la_agregar lista 2 "dos_modificado"
--Asoc 1 "uno" (Asoc 2 "dos_modificado" Vacia)
--ghci> la_agregar lista 3 "tres"
--Asoc 1 "uno" (Asoc 2 "dos" (Asoc 3 "tres" Vacia))

--b4)
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Asoc x y xs) = (x, y) : la_pares xs
--ghci> let lista = Asoc 1 "uno" (Asoc 2 "dos" Vacia)
--ghci> la_pares lista
--[(1,"uno"),(2,"dos")]
--ghci> let lista = Asoc 1 "uno" (Asoc 2 "dos" (Asoc 3 "tres" Vacia))
--ghci> la_pares lista
--[(1,"uno"),(2,"dos"),(3,"tres")]
--ghci> let lista = Asoc 1 "uno" (Asoc 2 "dos" (Asoc 3 "tres" Vacia))
--ghci> la_pares lista
--[(1,"uno"),(2,"dos"),(3,"tres")]

--b5)
la_buscar :: Eq a => ListaAsoc a b -> a -> Maybe b
la_buscar Vacia _ = Nothing
la_buscar (Asoc x y xs) k
  | x == k = Just y
  | otherwise = la_buscar xs k
--ghci> let lista = Asoc 1 "uno" (Asoc 2 "dos" Vacia)
--ghci> la_buscar lista 1
--Just "uno"

--b6)
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar k (Asoc x y xs)
  | x == k = xs
  | otherwise = Asoc x y (la_borrar k xs)
--ghci> let lista = Asoc 1 "uno" (Asoc 2 "dos" Vacia)
--ghci> la_borrar 1 lista
--Asoc 2 "dos" Vacia
--ghci> let lista = Asoc 1 "uno" (Asoc 2 "dos" (Asoc 3 "tres" Vacia))
--ghci> la_borrar 2 lista
--Asoc 1 "uno" (Asoc 3 "tres" Vacia)