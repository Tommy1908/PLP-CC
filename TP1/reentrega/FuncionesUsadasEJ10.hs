foldDoc :: (b) -> (String -> b -> b) -> (Int -> b -> b) -> Doc -> b
foldDoc fVacio fTexto fLinea d = case d of    ---------------------------- {F0}
  Vacio               -> fVacio                               
  Texto str documento -> fTexto str (recursivo documento)    
  Linea i documento   -> fLinea i (recursivo documento)       
  where recursivo = foldDoc fVacio fTexto fLinea


indentar :: Int -> Doc -> Doc
indentar i d = foldDoc (Vacio) (fTexto) (fLinea) d    -------------------- {I0}
              where fTexto = (\str rec -> Texto str rec)
                    fLinea = (\espacios rec -> Linea (espacios + i) rec) 