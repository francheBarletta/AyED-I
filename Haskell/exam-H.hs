-----------------------
---- Examen Tema H ----
------------------------

-- Ejercicio 1
-- a)

data Ahorro = Descuento NombreBilletera Categoria Monto Mes | Reintegro NombreBilletera Concepto Monto
  deriving (Show, Eq)

type NombreBilletera = String

type Categoria = String

type Concepto = String

type Monto = Int

type Mes = Int

-- b)

supermercadoUa :: Ahorro
supermercadoUa = Descuento "Uala" "Supermercado" 1500 10

premioBna :: Ahorro
premioBna = Reintegro "BnaMas" "Premio Cumplidor" 3000

-- c)

esReintegro :: Ahorro -> String -> Bool
esReintegro (Reintegro billetera _ _) nombre = billetera == nombre
esReintegro _ _ = False

-- gchi> esReintegro supermercadoUa "Uala"
-- False
-- ghci> esReintegro premioBna "BnaMas"
-- True

-- d)

esDescuentoPrimavera :: Ahorro -> Bool
esDescuentoPrimavera (Descuento _ _ _ mes) = mes == 9 || mes == 10 || mes == 11
esDescuentoPrimavera _ = False

-- ghci> esDescuentoPrimavera supermercadoUa
-- True
-- ghci> esDescuentoPrimavera premioBna
-- False
-- ghci> esDescuentoPrimavera (Reintegro "BnaMas" "Premio Cumplidor" 3000)
-- False

-- e)

totalDescuentosMes :: [Ahorro] -> Int -> Int
totalDescuentosMes [] _ = 0
totalDescuentosMes (Descuento _ _ monto mes : xs) mesBuscardo
  | mes == mesBuscardo = monto + totalDescuentosMes xs mesBuscardo
  | otherwise = totalDescuentosMes xs mesBuscardo

-- ghci> totalDescuentosMes [supermercadoUa, premioBna] 10
-- 1500
-- ghci> totalDescuentosMes [supermercadoUa, premioBna] 11
-- 0
-- ghci> totalDescuentosMes [supermercadoUa, premioBna] 9
-- 0

-- 2)

data ColaAhorro = NoHayAhorro | HayAhorro Ahorro ColaAhorro
  deriving (Show, Eq)

ahorrosJuan :: ColaAhorro
ahorrosJuan = HayAhorro supermercadoUa (HayAhorro premioBna NoHayAhorro)

buenosAhorros :: ColaAhorro -> ColaAhorro
buenosAhorros NoHayAhorro = NoHayAhorro
buenosAhorros (HayAhorro ahorro cola)
  | esReintegro ahorro "BnaMas" = HayAhorro ahorro (buenosAhorros cola)
  | otherwise = buenosAhorros cola

-- ghci> buenosAhorros ahorrosJuan
-- HayAhorro (Reintegro "BnaMas" "Premio Cumplidor" 3000) NoHayAhorro
-- ghci> buenosAhorros (AgregarAhorro supermercadoUa NoHayAhorro)
-- NoHayAhorro