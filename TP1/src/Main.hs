module Main (main) where

import Documento
import PPON
import Test.HUnit

main :: IO ()
main = runTestTTAndExit allTests

allTests :: Test
allTests =
  test
    [ "Ejercicio 2" ~: testsEj2,
      "Ejercicio 3" ~: testsEj3,
      "Ejercicio 4" ~: testsEj4,
      "Ejercicio 6" ~: testsEj6,
      "Ejercicio 7" ~: testsEj7,
      "Ejercicio 8" ~: testsEj8,
      "Ejercicio 9" ~: testsEj9
    ]

testsEj2 :: Test
testsEj2 =
  test
    [ vacio <+> vacio ~?= vacio,
      texto "a" <+> texto "b" ~?= texto "ab",
      (texto "a" <+> linea) <+> texto "b" ~?= texto "a" <+> (linea <+> texto "b"),
      (texto "a" <+> linea) <+> texto "b" ~?= texto "a" <+> (linea <+> texto "b"),
      vacio <+> texto "chom" <+> linea <+> vacio <+> texto "adios" ~?= texto "chom" <+> linea <+> texto "adios"
    ]

testsEj3 :: Test
testsEj3 =
  test
    [ indentar 2 vacio ~?= vacio,
      indentar 2 (texto "a") ~?= texto "a",
      indentar 2 (texto "a" <+> linea <+> texto "b") ~?= texto "a" <+> indentar 2 (linea <+> texto "b"),
      indentar 2 (linea <+> texto "a") ~?= indentar 1 (indentar 1 (linea <+> texto "a")),
      indentar 0 (indentar 1 (linea <+> texto "test")) ~?= indentar 1 (linea <+> texto "test")
    ]

testsEj4 :: Test
testsEj4 =
  test
    [ mostrar vacio ~?= "",
      mostrar linea ~?= "\n",
      mostrar (indentar 2 (texto "a" <+> linea <+> texto "b")) ~?= "a\n  b",
      mostrar (indentar 2 (texto "a" <+> linea <+> texto "b" <+> linea <+> texto "c")) ~?= "a\n  b\n  c",
      mostrar (texto "abc") ~?= "abc"
    ]

pericles, merlina, addams, familias, t1, t2, t3, t4, t5:: PPON
pericles = ObjetoPP [("nombre", TextoPP "Pericles"), ("edad", IntPP 30)]
merlina = ObjetoPP [("nombre", TextoPP "Merlina"), ("edad", IntPP 24)]
addams = ObjetoPP [("0", pericles), ("1", merlina)]
familias = ObjetoPP [("Addams", addams)]
t1 = IntPP 19
t2 = TextoPP "PLP"
t3 = ObjetoPP [("Cumple", t1), ("Materia", t2)]
t4 = ObjetoPP [("p1", t3), ("p2", ObjetoPP [("Cumple", IntPP 27), ("Materia", TextoPP "ALGO")])]
t5 = ObjetoPP [("Facu", t4)]

testsEj6 :: Test
testsEj6 =
  test
    [ pponObjetoSimple pericles ~?= True,
      pponObjetoSimple addams ~?= False,
      pponObjetoSimple t1 ~?= False,
      pponObjetoSimple t2 ~?= False,
      pponObjetoSimple t3 ~?= True,
      pponObjetoSimple t4 ~?= False,
      pponObjetoSimple t5 ~?= False
      
    ]

a, b, c, p :: Doc
a = texto "a"
b = texto "b"
c = texto "c"
p = texto "palabra" 

testsEj7 :: Test
testsEj7 =
  test
    [ mostrar (intercalar (texto ", ") []) ~?= "",
      mostrar (intercalar (texto ", ") [a, b, c]) ~?= "a, b, c",
      mostrar (entreLlaves []) ~?= "{ }",
      mostrar (entreLlaves [a, b, c]) ~?= "{\n  a,\n  b,\n  c\n}",
      mostrar (entreLlaves [a, b, c]) ~?= "{\n  a,\n  b,\n  c\n}",
      mostrar (intercalar (texto ", ") [a]) ~?= "a",
      mostrar (entreLlaves [a]) ~?= "{\n  a\n}"    
      ]

testsEj8 :: Test
testsEj8 =
  test
    [ 
      mostrar (aplanar (a <+> linea <+> b <+> linea <+> c)) ~?= "a b c",
      mostrar (aplanar vacio) ~?= "",
      mostrar (aplanar (b <+> linea) <+> aplanar (linea <+> linea <+> linea <+> a)) ~?= "b    a",
      mostrar (aplanar (vacio <+> linea <+> vacio)) ~?= " ",
      mostrar (aplanar (linea <+> p <+> linea)) ~?= " palabra "
    ]

testsEj9 :: Test
testsEj9 =
  test
    [ mostrar (pponADoc pericles) ~?= "{ \"nombre\": \"Pericles\", \"edad\": 30 }",
      mostrar (pponADoc addams) ~?= "{\n  \"0\": { \"nombre\": \"Pericles\", \"edad\": 30 },\n  \"1\": { \"nombre\": \"Merlina\", \"edad\": 24 }\n}",
      mostrar (pponADoc familias) ~?= "{\n  \"Addams\": {\n    \"0\": { \"nombre\": \"Pericles\", \"edad\": 30 },\n    \"1\": { \"nombre\": \"Merlina\", \"edad\": 24 }\n  }\n}",
      mostrar (pponADoc (IntPP 7)) ~?= "7",
      mostrar (pponADoc (TextoPP "juanceto01")) ~?= "\"juanceto01\""
    ]
