-----------------------
---- Examen Tema G ----
------------------------

-- Ejercicio 1
-- a)

data Ahorro = Descuento NombreBilletera Categoria Descuento Tope [Dia] | Reintegro NombreBilletera Categoria Monto
  deriving (Show, Eq)

type NombreBilletera = String

type Categoria = String

type Descuento = Int

type Tope = Int

type Monto = Int

type Dia = String

-- b)

naftaPP :: Ahorro
naftaPP = Descuento "PersonalPay" "Combustible" 25 2500 ["Lunes", "Martes"]

macNX :: Ahorro
macNX = Reintegro "NaranjaX" "Comida Rapida" 3000

-- c)

hayDescuentoDia :: Ahorro -> Dia -> Bool
hayDescuentoDia (Descuento _ _ _ _ dias) dia = dia `elem` dias
hayDescuentoDia (Reintegro _ _ _) _ = False

-- ghci> hayDescuentoDia naftaPP "Lunes"
-- True
-- ghci> hayDescuentoDia naftaPP "Miercoles"
-- False
-- ghci> hayDescuentoDia macNX "Lunes"
-- False

-- d)

esDescuentoCombustible :: Ahorro -> Bool
esDescuentoCombustible (Descuento _ "Combustible" _ _ _) = True
esDescuentoCombustible (Descuento _ _ _ _ _) = False

-- ghci> esDescuentoCombustible naftaPP
-- True
-- ghci> esDescuentoCombustible macNX
-- False
-- ghci> esDescuentoCombustible (Reintegro "NaranjaX" "Comida Rapida" 3000)
-- False

-- e)

mayorDescuento0Reintegro :: [Ahorro] -> Int
mayorDescuento0Reintegro [] = 0
mayorDescuento0Reintegro (Descuento _ _ _ _ _ : xs) = mayorDescuento0Reintegro xs
mayorDescuento0Reintegro (Reintegro _ _ monto : xs)
  | monto > 0 = max monto (mayorDescuento0Reintegro xs)
  | otherwise = mayorDescuento0Reintegro xs

-- ghci> mayorDescuento0Reintegro [naftaPP, macNX]
-- 3000
