data AEB a = Hoja a | Bin (AEB a) a (AEB a)
-- Estrictamente binario
miArbol = Bin (Hoja 3) 5 (Bin (Hoja 7) 8 (Hoja 1))
{-
    5
3       8
      7   1
-}

foldAEB :: (a -> b) -> (b -> a -> b -> b) -> AEB a -> b
foldAEB fHoja fBin tree = case tree of
    Hoja n      -> fHoja n
    Bin t1 n t2 -> fBin (rec t1) n (rec t2)
  where
    rec = foldAEB fHoja fBin

alturaAEB :: AEB a -> Int
alturaAEB = foldAEB (const 1) (\recI _ recD -> 1 + max recI recD)

cantNodosAEB :: AEB a -> Int
--cantNodosAEB = foldAEB (const 1) (\ri r rd -> 1 + ri + rd)
cantNodosAEB = foldAEB (\fHoja x -> (+x)) (\ri r rd -> 1 + ri + rd)