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