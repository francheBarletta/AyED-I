-----------------------
---- Examen Tema C ----
------------------------

--Ejercicio 1
--Parte 1
data TipoGaseosa = Coca | Sprite | Pepsi deriving (Show, Eq)
data TipoSnack = Papitas | Chocolate | Alfajor deriving (Show, Eq)
data TipoMaquina = MaquinaGaseosa | MaquinaSnack deriving (Show, Eq)

type Peso = Int
type Precio = Int

data Producto = Gaseosa TipoGaseosa Peso Precio | Snack TipoSnack Peso Precio deriving (Show, Eq)

data Maquina = MkMaquina TipoMaquina [Producto] deriving (Show, Eq)

--Parte 2
es_maquina_vacia :: Maquina -> Bool
es_maquina_vacia (MkMaquina _ []) = True
es_maquina_vacia _ = False
-- es_maquina_vacia (MkMaquina MaquinaGaseosa []) 
-- True
-- es_maquina_vacia (MkMaquina MaquinaSnack [Snack Papitas 100 500]) 
-- False

agregar_producto :: Producto -> Maquina -> Maquina
agregar_producto (Gaseosa tipo peso precio) (MkMaquina MaquinaGaseosa productos) = MkMaquina MaquinaGaseosa (Gaseosa tipo peso precio : productos)
agregar_producto (Snack tipo peso precio) (MkMaquina MaquinaSnack productos) = MkMaquina MaquinaSnack (Snack tipo peso precio : productos)
agregar_producto _ maquina = maquina
-- agregar_producto (Gaseosa Coca 500 700) (MkMaquina MaquinaGaseosa []) 
-- MkMaquina MaquinaGaseosa [Gaseosa Coca 500 700]
-- agregar_producto (Snack Alfajor 150 300) (MkMaquina MaquinaGaseosa []) 
-- MkMaquina MaquinaGaseosa []

cantidad_total :: Maquina -> Int
cantidad_total (MkMaquina _ []) = 0
cantidad_total (MkMaquina tipo (Gaseosa _ peso _ : xs)) = peso + cantidad_total (MkMaquina tipo xs)
cantidad_total (MkMaquina tipo (Snack _ peso _ : xs)) = peso + cantidad_total (MkMaquina tipo xs)
-- cantidad_total (MkMaquina MaquinaSnack [Snack Papitas 100 200, Snack Chocolate 150 300]) 
-- 250
-- cantidad_total (MkMaquina MaquinaGaseosa []) 
-- 0


--Ejercicio 2
data RegistroDeReabastecimiento = HistorialVacio | Agregar Producto RegistroDeReabastecimiento deriving Show

contiene_gaseosa :: RegistroDeReabastecimiento -> TipoGaseosa -> Bool
contiene_gaseosa HistorialVacio _ = False
contiene_gaseosa (Agregar (Gaseosa tipo _ _) resto) buscada = tipo == buscada || contiene_gaseosa resto buscada
contiene_gaseosa (Agregar (Snack _ _ _) resto) buscada = contiene_gaseosa resto buscada
-- contiene_gaseosa (Agregar (Gaseosa Coca 500 700) (Agregar (Snack Alfajor 100 300) HistorialVacio)) Coca 
-- True
-- contiene_gaseosa (Agregar (Snack Chocolate 100 400) HistorialVacio) Sprite 
-- False
