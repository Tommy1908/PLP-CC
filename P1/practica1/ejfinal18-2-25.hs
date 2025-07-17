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


--fnn = foldForm fProp fAnd fOr fNeg
--fnn :: Form -> Bool -> Form
--    where 
--        fProp = (\str bool   -> str)
--        fAnd  = (\rx ry bool -> if bool then And rx ry else Or rx ry)
--        fOr   = (\rx ry bool -> if bool then And rx ry else Or rx ry)
--        fNeg  = (\rx bool    -> rx )

fnn :: Form -> Bool -> Form
fnn form positive = foldForm fProp fAnd fOr fNeg form
  where
    fProp s = if positive then Prop s else Neg (Prop s)
    
    fAnd f1 f2 = if positive 
                 then And f1 f2 
                 else Or f1 f2
    
    fOr f1 f2 = if positive 
                then Or f1 f2 
                else And f1 f2
    
    fNeg f = f



isProp :: Form -> Bool
isProp (Prop _) = True
isProp _        = False

isAnd :: Form -> Bool
isAnd (And _ _) = True
isAnd _       = False

isOr :: Form -> Bool
isOr (Or _ _) = True
isOr _      = False

isNeg :: Form -> Bool
isNeg (Neg _) = True
isNeg _       = False