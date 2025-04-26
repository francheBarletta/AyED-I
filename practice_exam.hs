-----------------------
---- Examen Tema A ----
------------------------

import Data.Kind (Type)

--Ejercicio 1
--a)

data Video = Pelicula NombrePelicula Director Duracion Año | CapSerie NombreSerie NumCapitulo Temporada Año

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

--d) 

esEstreno :: Video -> Bool
esEstreno (Pelicula _ _ _ 2024) = True
esEstreno (Pelicula _ _ _ _) = False
