module PPON where

import Documento

data PPON = TextoPP String | IntPP Int | ObjetoPP [(String, PPON)] deriving (Eq, Show)

pponAtomico :: PPON -> Bool
pponAtomico pp = case pp of 
  ObjetoPP _  -> False
  _           -> True

pponObjetoSimple :: PPON -> Bool
pponObjetoSimple pp = case pp of 
  ObjetoPP xs -> foldr (\(_, val) rec -> pponAtomico val && rec) (True) xs -- Comprueba si todos los elementos de la lista son ppones atomicos
  _           -> False

intercalar :: Doc -> [Doc] -> Doc
intercalar sep ds = case ds of
  []  -> vacio
  [d] -> d
  _   -> foldr1 (\d rec -> d <+> sep <+> rec) ds -- Concatena todos los documentos con sep entre ellos. 

entreLlaves :: [Doc] -> Doc
entreLlaves ds = case ds of 
  []  -> texto "{ }"
  _   -> texto "{" <+> indentar 2 ( linea <+> intercalar (texto "," <+> linea) ds) <+> linea <+> texto "}"

entreLlavesSinLineas :: [Doc] -> Doc
entreLlavesSinLineas ds = case ds of 
  []  -> texto "{ }"
  _   -> texto "{ " <+> indentar 2 (intercalar (texto ", ") ds) <+> texto " }"

aplanar :: Doc -> Doc
aplanar = foldDoc (vacio) (\str rec -> texto str <+> rec) (\_ rec -> texto " " <+> rec)

pponADoc :: PPON -> Doc
pponADoc d = case d of
  TextoPP str -> texto (show str)
  IntPP i     -> texto (show i)
  ObjetoPP xs -> if pponObjetoSimple d then entreLlavesSinLineas docList else entreLlaves docList
    where
      docList = foldr (\(key, val) rec -> (toDoc key val) : rec) [] xs
      toDoc str d' = texto (show str) <+> texto ": " <+> pponADoc d'

{-
  El tipo de recursión de pponADoc es primitiva ya que al llamar pponObjetoSimple d, en esa funcion llamamos a
   pponAtomico sobre el valor que es el segundo componente de "la cabeza".
   Al operar de esta manera, deja de ser recursion estructural y es recursion primitiva.
-}