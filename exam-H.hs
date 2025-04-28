-----------------------
---- Examen Tema H ----
------------------------

--Ejercicio 1
--a)

data Ahorro = Descuento NombreBilletera Categoria Monto Mes | Reintegro NombreBilletera Concepto Monto
    deriving (Show, Eq)

type NombreBilletera = String
type Categoria = String
type Concepto = String
type Monto = Int
type Mes = Int

--b)

supermercadoUa :: Ahorro
supermercadoUa = Descuento "Uala" "Supermercado" 1500 10

premioBna :: Ahorro
premioBna = Reintegro "BnaMas" "Premio Cumplidor" 3000

--c) 

esReintegro :: Ahorro -> String -> Bool
esReintegro (Reintegro billetera _ _) nombre = billetera == nombre
esReintegro _ _ = False