-- Ejercicio 1
cubo :: Float -> Float
cubo x = x^3

-- Ejercicio 2
menorValor :: Int -> Int -> Int -> Int
menorValor x y z
  | x <= y && x <= z = x
  | y <= x && y <= z = y
  | z <= x && z <= y = z

-- Ejercicio 3
tercerElemento :: [hola] -> hola
tercerElemento (x:y:z:xs) = z

-- Ejercicio 4
inversoDeTripleta :: (a, b, c) -> (c, b, a)
inversoDeTripleta (a, b, c) = (c, b, a)

-- Ejercicio 5
tercerCaracter :: String -> Char
tercerCaracter = tercerElemento 

-- Ejercicio 6
rotarIzquierda :: [a] -> [a]
rotarIzquierda (x:xs) =  xs ++ [x]

-- Ejercicio 7
maxMin = undefined

-- Ejercicio 8
ordenarTres = undefined

-- Ejercicio 9
quitarSegundo = undefined

-- Ejercicio 10
sumatoria :: Num a => [a] -> a
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

sumaUmbral :: (Num a, Ord a) => [a] -> a -> Bool
sumaUmbral xs n | sumatoria xs > n = True
                | otherwise = False
