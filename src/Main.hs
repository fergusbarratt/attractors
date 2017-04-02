module Main where
import Data.Csv
import System.Environment
import qualified Data.ByteString.Lazy.Char8 as B

type Point3 = (Float, Float, Float)
type Point2 = (Float, Float)

-- time evolution is via iterate (!! n for the nth application) 
µ = iterate

-- Continuous dynamical systems (euler step form)
δ = 0.01
-- Lorentz map
σ = 10.0
ρ = 28.0
β = 8.0/3.0
λ :: Point3 -> Point3
λ  (x, y, z) = (x+δ*(σ*(y-x)), y+δ*(x*(ρ-z) - y), z+δ*(x*y - β*z))

-- Discrete dynamical systems. 
-- Henon Map
a = 1.4
b = 0.3
η :: Point2 -> Point2
η (x, y) = (1.0 - a*x^2 + y, b*x)
-- Duffing Map
å = 2.75
œ = 0.2 -- normally a and b
(∂)::Point2 -> Point2
(∂) (x, y) = (y, -œ*x + å*y - y^3) 

writeDataPoints :: Int -> IO ()
writeDataPoints n = do
  B.writeFile "/Users/fergusbarratt/Dropbox/Projects/fra/data/h.csv" $ encode $ take n $ µ η (0.0, 0.0)
  B.writeFile "/Users/fergusbarratt/Dropbox/Projects/fra/data/l.csv" $ encode $ take n $ µ λ (5.0, 5.0, 30.0)
  B.writeFile "/Users/fergusbarratt/Dropbox/Projects/fra/data/d.csv" $ encode $ take n $ µ (∂) (0.5, 0.5)



main :: IO ()
main = do
  n <- getArgs
  writeDataPoints $ read (head n)
  print $ take 5 $ µ (∂) (0.5, 0.5)
