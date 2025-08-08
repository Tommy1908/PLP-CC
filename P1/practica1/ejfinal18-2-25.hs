--(A) Definir y dar el tipo de foldForm
--(B) Definir fnn :: Form -> Bool -> Form usando foldForm. Que pasa una formula x a forma normal negada si el booleano es True y pasa a la negacion de x a forma normal negada si el booleano es False.
--Ej:
--fnn (And (Prop "x") Neg(Or (Prop "y") Neg(Prop "z"))) True = (And (Prop "x") (And Neg(Prop "y") (Prop "z")))
--fnn (And (Prop "x") Neg(Or (Prop "y") Neg(Prop "z"))) False = (Or Neg(Prop "x") (Or (Prop "y") Neg(Prop "z"))) 


data Form = Prop String
            | And Form Form 
            | Or Form Form 
            | Neg Form deriving Show

foldForm :: (String -> b) -> (b -> b -> b) -> (b -> b -> b) -> (b -> b) -> Form -> b
foldForm fProp fAnd fOr fNeg f = case f of
    Prop s  -> fProp s
    And x y -> fAnd (rec x) (rec y)
    Or x y  -> fOr (rec x) (rec y)
    Neg x   -> fNeg (rec x)
    where
        rec = foldForm fProp fAnd fOr fNeg



fnn :: Form -> Bool -> Form
fnn = foldForm fProp fAnd fOr fNeg
    where 
        fProp = (\str bool   -> if bool then Prop str else Neg(Prop str))
        fAnd  = (\rx ry bool -> if bool then And (rx True) (ry True) else Or (rx False) (ry False))
        fOr   = (\rx ry bool -> if bool then Or (rx True) (ry True) else And (rx False) (ry False))
        fNeg  = (\rx bool    -> if bool then rx False else rx True)

