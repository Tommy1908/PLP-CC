module Documento
  ( Doc,
    vacio,
    linea,
    texto,
    foldDoc,
    (<+>),
    indentar,
    mostrar,
    imprimir,
  )
where

data Doc = Vacio | Texto String Doc | Linea Int Doc deriving (Eq, Show)
-- Para indoles pracitcos nos vamos a referir al doc del Texto y la Linea como la cola del documento. 


vacio :: Doc
vacio = Vacio

linea :: Doc
linea = Linea 0 Vacio

texto :: String -> Doc
texto t | '\n' `elem` t = error "El texto no debe contener saltos de línea"
texto [] = Vacio
texto t = Texto t Vacio

{- foldDoc : 
Si d es vacio devuelve fVacio, lo cual seria el caso base. 
Si d es un texto, devuelve el resultado de aplicar fTexto a str y el caso recursivo
Si d es una linea, devuelve el resultado de aplicar fLinea a i y el caso recursivo -}
foldDoc :: (b) -> (String -> b -> b) -> (Int -> b -> b) -> Doc -> b
foldDoc fVacio fTexto fLinea d = case d of
  Vacio               -> fVacio                               
  Texto str documento -> fTexto str (recursivo documento)    
  Linea i documento   -> fLinea i (recursivo documento)       
  where recursivo = foldDoc fVacio fTexto fLinea


{- <+> : 
Si estamos aplicando fTexto y el caso recursivo es otro Texto, concatena los strings y le pone la cola del caso recursivo como cola.
Si no, deja el caso recursivo como cola. Donde encuentra vacio en d1, lo reemplaza por d2. 

Como se aplica a la interseccion del los documentos (el final de d1 y el principio de d2), suponiendo que ambos d1 y d2 cumplen el invariante, cumple el invariante porque
cuando los concatena, no quedan Textos seguidos de Textos por la explicacion anteriormente mencionada. Por lo que la primera parte del invariate se cumple. 
Finalmente, como inicialmente d1 y d2 cumplen, el invariante este se mantiene luego de aplicar la funcion.
-}
infixr 6 <+>
(<+>) :: Doc -> Doc -> Doc
(<+>) d1 d2 = foldDoc (d2) fTexto fLinea d1 
            where
              fTexto = \str1 rec -> case rec of
                Texto str2 drec   -> Texto (str1 ++ str2) drec
                _                 -> Texto str1 rec
              fLinea = \i rec -> Linea i rec

{- indentar:
Cumple el invariante, ya que como i > 0, en ningun momento (espacios + i) puede ser menor que 0. 
Toda las otras partes del documento que no sean Lineas tambien lo cumple debido a que no se ven modificadas por la funcion.
-}
indentar :: Int -> Doc -> Doc
indentar i d = foldDoc (Vacio) (fTexto) (fLinea) d
              where fTexto = (\str rec -> Texto str rec)
                    fLinea = (\espacios rec -> Linea (espacios + i) rec) 

mostrar :: Doc -> String
mostrar = foldDoc ("") (\str rec -> str ++ rec) (\i rec -> "\n" ++ espacios i ++ rec)
            where espacios n = take n (repeat ' ') -- De una lista infinita de ' ', se toman los primeros n.

imprimir :: Doc -> IO ()
imprimir d = putStrLn (mostrar d)
