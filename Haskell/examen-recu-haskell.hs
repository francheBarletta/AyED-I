data Periferico = Mouse Dpi ManoHabil Bluetooh 
                | Camara Resolucion Mic 
                | GamePad Marca Analogico Botones Bluetooh 
                deriving (Show)

type Dpi = Int
data ManoHabil = Derecha | Izquierda deriving (Show)
type Bluetooh = Bool
type Resolucion = Int
type Mic = Bool 
type Marca = String 
type Analogico = Bool
type Botones = Int

buena_para_videoconferencias :: Periferico -> Bool
buena_para_videoconferencias p = es_camara p

es_camara :: Periferico -> Bool
es_camara (Camara resolucion True) = resolucion >= 3
es_camara _ = False

tiene_bt :: Periferico -> Bool
tiene_bt (Mouse _ _ True) = True
tiene_bt (GamePad _ _ _ True) = True
tiene_bt _ = False

solo_bt :: [Periferico] -> [Periferico]
solo_bt [] = []
solo_bt (x:xs) = if tiene_bt x then x : solo_bt xs else solo_bt xs

cuantos_bt :: [Periferico] -> Int
cuantos_bt [] = 0
cuantos_bt (x:xs) = (if tiene_bt x then 1 else 0) + cuantos_bt xs

data CajaPeriferico = AgregaPeriferico Periferico CajaPeriferico | CajaVacia

todos_bluetooth :: CajaPeriferico -> Bool
todos_bluetooth CajaVacia = True
todos_bluetooth (AgregaPeriferico p resto) = tiene_bt p && todos_bluetooth resto