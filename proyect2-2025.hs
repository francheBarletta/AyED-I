--Ejercicio 1

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

--Ejercicio 3

--a)
--Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int

--Tipos algebraicos sin parametros (aka enumerado)
data Zona = Arco | Defensa | Mediocampo | Delantera
data TipoRevez = DosManos | UnaMano
data Modalidad = Carrera | Pista | Monte | BMX
data PiernaHabil =  Izquierda | Derecha

--Sinonimo
type ManoHabil = PiernaHabil

--Deportista es un tipo algebraico con constructores parametricos
data Deportista = Ajedresista                                    -- Constructor sin argumentos
                | Ciclista Modalidad                             -- Constructor con un argumento
                | Velocista Altura                               -- Constructor con un argumento
                | Tenista TipoRevez ManoHabil Altura             -- Constructor con tres argumentos
                | Futbolista Zona NumCamiseta PiernaHabil Altura -- Constructor con cuatro argumentos


--c)
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (Velocista _ : xs) = 1 + contar_velocistas xs
contar_velocistas (_ : xs) = contar_velocistas xs

--Main> let lista = [Velocista 175, Ciclista Pista, Ajedresista, Velocista 180, Futbolista Delantera 10 Izquierda 185]
--Main> contar_velocistas lista
--2