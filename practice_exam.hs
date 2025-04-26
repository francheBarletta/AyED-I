-----------------------
---- Examen Tema A ----
------------------------

import Data.Kind (Type)

--Ejercicio 1
--a)

data Video = Pelicula NombrePelicula Director Duracion Año | CapSerie NombreSerie NumCapitulo Temporada Año 
    deriving (Show, Eq)

type NombrePelicula = String
type NombreSerie = String
type Director = String
type Duracion = Int
type Año = Int
type NumCapitulo = Int
type Temporada = Int

--b)

elPadrino :: Video
elPadrino = Pelicula "El Padrino" "Francis Ford Coppola" 177 1972

breakingBadS01E01 :: Video
breakingBadS01E01 = CapSerie "Breaking Bad" 1 1 2008

--c)

esPrimerCapitulo :: Video -> Bool
esPrimerCapitulo (CapSerie _ 1 _ _) = True
esPrimerCapitulo (CapSerie _ _ _ _) = False

--ghci> esPrimerCapitulo breakingBadS01E01 
--True
--ghci> esPrimerCapitulo elPadrino 
--Exception: practice_exam.hs:(31,1)-(32,43): Non-exhaustive patterns in function esPrimerCapitulo

--d

esEstreno :: Video -> Bool
esEstreno (Pelicula _ _ _ 2024) = True
esEstreno (Pelicula _ _ _ _) = False

--ghci> esEstreno elPadrino
--False
--ghci> esEstreno (Pelicula "Nueva Pelicula" "Director" 120 2024)
--True

--e)

duracionPeliMasLarga :: [Video] -> Int
duracionPeliMasLarga [] = 0
duracionPeliMasLarga (Pelicula _ _ duracion _ : xs) = max duracion (duracionPeliMasLarga xs)
duracionPeliMasLarga (_ : xs) = duracionPeliMasLarga xs
--ghci> duracionPeliMasLarga [elPadrino, breakingBadS01E01]
--177
--ghci> duracionPeliMasLarga [breakingBadS01E01]
--0

--Ejercicio 2

data ColaVideo = Vacia | Encolada Video ColaVideo deriving (Show)

colaReproduccion :: ColaVideo
colaReproduccion = Encolada elPadrino (Encolada breakingBadS01E01 Vacia)

pelisDelDirector :: ColaVideo -> String -> ColaVideo
pelisDelDirector Vacia _ = Vacia
pelisDelDirector (Encolada (Pelicula titulo director duracion año) xs) d 
    | director == d = Encolada (Pelicula titulo director duracion año) (pelisDelDirector xs d)
    | otherwise = pelisDelDirector xs d
    
--ghci> pelisDelDirector colaReproduccion "Francis Ford Coppola"
--Encolada (Pelicula "El Padrino" "Francis Ford Coppola" 177 1972) Vacia
--ghci> pelisDelDirector colaReproduccion "Otro Director"
--Vacia