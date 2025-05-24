-----------------------
---- Examen Tema B ----
------------------------

-- Ejercicio 1
-- a)

data Video = Pelicula NombrePelicula Director Duracion Año | CapSerie NombreSerie NumCapitulo Temporada Año
  deriving (Show, Eq)

type NombrePelicula = String

type NombreSerie = String

type Director = String

type Duracion = Int

type Año = Int

type NumCapitulo = Int

type Temporada = Int

-- b)

breakingBadS01E01 :: Video
breakingBadS01E01 = CapSerie "Breaking Bad" 1 1 2008

elPadrino :: Video
elPadrino = Pelicula "El Padrino" "Francis Ford Coppola" 177 1972

odisea2001 :: Video
odisea2001 = Pelicula "2001: Odisea en el espacio" "Stanley Kubrick" 142 1968

theOfficeS02E05 :: Video
theOfficeS02E05 = CapSerie "The Office" 5 2 2005

-- c)

esDelDirector :: Video -> String -> Bool
esDelDirector (Pelicula _ director _ _) d = director == d
esDelDirector (CapSerie _ _ _ _) _ = False

-- ghci> esDelDirector elPadrino "Francis Ford Coppola"
-- True
-- ghci> esDelDirector elPadrino "El Bananero"
-- False

-- d)

esActual :: Video -> Bool
esActual (Pelicula _ _ _ anio) = anio >= 2020
esActual (CapSerie _ _ _ anio) = anio >= 2020

-- ghci> esActual elPadrino
-- False
-- ghci> esActual elPadrino
-- False

-- e)

tiempoPelis :: [Video] -> Int -> Int
tiempoPelis [] _ = 0
tiempoPelis (Pelicula _ _ duracion anio : xs) anioDado
  | anio == anioDado = duracion + tiempoPelis xs anioDado
  | otherwise = tiempoPelis xs anioDado
tiempoPelis (_ : xs) anioDado = tiempoPelis xs anioDado

-- ghci> let videos = [elPadrino, odisea2001, breakingBadS01E01]
-- ghci> tiempoPelis videos 1972
-- 177

-- Ejercicio 2

data ColaVideo = Vacia | Encolada Video ColaVideo deriving (Show)

colaReproduccion :: ColaVideo
colaReproduccion = Encolada elPadrino (Encolada breakingBadS01E01 Vacia)

seriesActuales :: ColaVideo -> ColaVideo
seriesActuales Vacia = Vacia
seriesActuales (Encolada x xs)
  | esActual x = Encolada x (seriesActuales xs)
  | otherwise = seriesActuales xs

-- ghci> seriesActuales colaReproduccion
-- Encolada (Pelicula "El Padrino" "Francis Ford Coppola" 177 1972) (Encolada (CapSerie "Breaking Bad" 1 1 2008) Vacia)
-- ghci> seriesActuales (Encolada breakingBadS01E01 (Encolada theOfficeS02E05 Vacia))
-- Encolada (CapSerie "Breaking Bad" 1 1 2008) (Encolada (CapSerie "The Office" 5 2 2005) Vacia)