-----------------------
---- Examen Tema H ----
------------------------

--Ejercicio 1
--a)

data Vagon = Minerales Mineral Capacidad Cantidad | Cisterna Liquido Cantidad Temperatura
    deriving (Show, Eq)

type Mineral = String
type Liquido = String
type Capacidad = Int
type Cantidad = Int
type Temperatura = Float

--b)

vagonCobre :: Vagon
vagonCobre = Minerales "Cobre" 50 35

vagonAgua :: Vagon
vagonAgua = Cisterna "Agua" 25 15.8

--c)

excesoMinerales :: Vagon -> Int -> Bool
excesoMinerales (Minerales _ _ cantidad) limite = cantidad > limite
excesoMinerales _ _ = False
--ghci> excesoMinerales vagonCobre 30
--True
--ghci> excesoMinerales vagonAgua 30
--False

--d)

cisternaFrio :: Vagon -> Bool
cisternaFrio (Cisterna _ _ temperatura) = temperatura < 5
cisternaFrio _ = False
--ghci> cisternaFrio vagonAgua
--True
--ghci> cisternaFrio vagonCobre
--False

--e)

minimaCarga :: [Vagon] -> Int
minimaCarga [] = 0
minimaCarga (Minerales _ _ cantidad : xs) = cantidad + minimaCarga xs
minimaCarga (Cisterna _ _ _ : xs) = minimaCarga xs
--ghci> minimaCarga [vagonCobre, vagonAgua]
--35
--ghci> minimaCarga [vagonAgua, vagonCobre]
-- 35

--2)

data Tren = SinVagones | Encadena Vagon Tren
    deriving (Show, Eq)

ejemploTren :: Tren
ejemploTren = Encadena vagonAgua (Encadena vagonCobre SinVagones)

sumarCarga :: Tren -> Int -> Tren
sumarCarga SinVagones _ = SinVagones
sumarCarga (Encadena vagon tren) cantidad = Encadena (sumarVagon vagon cantidad) (sumarCarga tren cantidad)
--ghci> sumarCarga ejemploTren 10
--Encadena (Cisterna "Agua" 25 15.8) (Encadena (Minerales "Cobre" 50 45) SinVagones)
--ghci> sumarCarga ejemploTren 20
--Encadena (Cisterna "Agua" 25 15.8) (Encadena (Minerales "Cobre" 50 55) SinVagones)
--ghci> sumarCarga ejemploTren 0