----------------
-- Practico 1 --
----------------

--Laboratorio 1

esCero :: Int -> Bool
esCero x = x == 0

esPositivo :: Int -> Bool
esPositivo x = x > 0

esVocal :: Char -> Bool
esVocal n = n `elem` "aeiou"
-- esVocal x = x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u'

valorAbsoluto :: Int -> Int
valorAbsoluto x | x >= 0 = x
                | True = -x -- Otherwise = True
-- valorAbsoluto x = if x >= 0 then x else -x

--Laboratorio 2

paraTodo :: [Bool] -> Bool
paraTodo [] = True
paraTodo (x:xs) | x = True && paraTodo xs
                | otherwise = False
                
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)

promedio :: [Int] -> Int
promedio xs = sumatoria xs `div` length xs

--Laboratorio 3

--Las variables libres en todas las expresiones son: 'xs' 'x' 'ys'

arregloPositivo :: [Int] -> Bool
arregloPositivo [] = True
arregloPositivo (x:xs) | x >= 0 = arregloPositivo xs
                       | otherwise = False
                       
arreglosIguales :: Int -> [Int] -> Bool
arreglosIguales n [] = False
arreglosIguales n (x:xs) | (x == n) = True 
                         | otherwise = arreglosIguales n xs
                         
listasIguales :: [Int] -> Bool
listasIguales [] = True
listasIguales (x:y:xs) | (x == y) = listasIguales xs
                       | otherwise = False
--Laboratorio 4

--Muchos ejercicios estan repetidos y hechos en el Lab2, las variables libres son: 'xs' 'n' 'ys'

maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs) | (x > maximo xs) = x
              | otherwise = maximo xs
              
minimo :: [Int] -> Int
minimo [x] = x
minimo (x:xs) | (x < minimo xs) = x
              | otherwise = minimo xs
              
comparacionListas :: [Int] -> [Int] -> Bool
comparacionListas xs ys = maximo xs < minimo ys

--Laboratorio 5

todos :: [Bool] -> Bool
todos [] = True
todos (x:xs) = x && todos xs

--Laboratorio 6

-- Variables libres: 'n' 'xs'

productoPares :: [Int] -> Int
productoPares [] = 1
productoPares (x:xs) | even x = x * productoPares xs
                     | otherwise = productoPares xs

--ghci> productoPares [1,2,3,4,5,6]
--48
--ghci> productoPares [1..6]
--48

sumaCoordPar :: [Int] -> Int
sumaCoordPar [] = 0
sumaCoordPar [x] = x
sumaCoordPar (x:y:xs) = x + sumaCoordPar xs

--ghci> sumaCoordPar [1,2,3,4]
--4

--Laboratorio 7

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] _ = True
paratodo' (x:xs) n | n x = paratodo' xs n
                   | otherwise = False

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] _ = False
existe' (x:xs) n | n x = True
                 | otherwise = existe' xs n
                
sumatoria' :: [a] -> (a -> Bool) -> Bool
sumatoria' [] _ = True
sumatoria' (x:xs) n = n x && sumatoria' xs n

productoria' :: [a] -> (a -> Bool) -> Bool
productoria' [] _ = True
productoria' (x:xs) n = n x && productoria' xs n

--Laboratorio 8

--ghci> paratodo' [0,0,0,0] esCero 
--True
--ghci> paratodo' [0,0,0,1] esCero 
--False
--ghci> paratodo' "hola" esVocal 
--False
--ghci> existe' [0,0,1,0] esCero
--True
--ghci> existe' "hola" esVocal 
--True
--ghci> existe' "tnt" esVocal 
--False

--Laboratorio 9

--verifica que todos los números de una lista sean pares.
todosPares :: [Int] -> Bool 
todosPares [] = True
todosPares (x:xs) | (x `mod` 2 == 0) = todosPares xs
                  | otherwise = False

--Bool verifica si existe algún número dentro del segundo parámetro que
--sea múltiplo del primer parámetro.
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n [] = False
hayMultiplo n (x:xs) | (x `mod` n == 0) = True
                     | otherwise = hayMultiplo n xs

--dado un número no negativo n, calcula la suma de los primeros n cuadrados
sumaCuadrados :: Int -> Int 
sumaCuadrados 0 = 0
sumaCuadrados x = sum [i^2 | i <- [0..x-1]]

--dado en entero n y una lista ls, devuelve True si y solo si, existe algún elemento en ls que divida a na.
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n [] = False
existeDivisor n (x:xs) | (x `mod` n == 0) = True
                       | otherwise = existeDivisor n xs
                       
--dado un entero n, devuelve True si y solo si n es primo.
esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n = not (existeDivisor n [2..n-1])

--calcula el producto de todos los números primos de una lista.
multiplicaPrimos :: [Int] -> Int
multiplicaPrimos [] = 1
multiplicaPrimos (x:xs) | esPrimo x = x * multiplicaPrimos xs
                        | otherwise = multiplicaPrimos xs
                        
--dado un entero n, devuelve True si y sólo si n está en la sucesión de Fibonacci.

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

esFib :: Int -> Bool
esFib n = n `elem` takeWhile (<= n) (map fib [0..])
  where
    fib 0 = 0
    fib 1 = 1
    fib x = fib (x-1) + fib (x-2)

--dada una lista xs de enteros, devuelva si todos los elementos de la lista pertenecen (o no) a la sucesión de Fibonacci.

todosFib :: [Int] -> Bool
todosFib [] = True
todosFib (x:xs) | esFib x = todosFib xs
                | otherwise = False
                
--Laboratorio 10

--map :: (a -> b) -> [a] -> [b]
--ghci> map succ [1,-4,6,2,-8]
--[2,-3,7,3,-7]

--filter :: (a -> Bool) -> [a] -> [a]
--ghci> filter esPositivo [1,-4,6,2,-8]
--[1,6,2]

--Laboratorio 11

duplicaValores :: [Int] -> [Int]
duplicaValores [] = []
duplicaValores (x:xs) = (x ^ 2) : duplicaValores xs

--Laboratorio 12

primIguales :: [Int] -> [Int]
primIguales [] = []
primIguales xs = takeWhile esPrimo xs

