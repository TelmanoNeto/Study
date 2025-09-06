-- Função para calcular o MDC usando o algoritmo de Euclides
mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (a `mod` b)

-- Função principal
main :: IO ()
main = do
    -- Solicita o número de entradas
    putStrLn "Quantas entradas?"
    n <- readLn

    -- Repete o processo para cada entrada
    replicateM_ n $ do
        -- Solicita as quantidades de figurinhas de Marcelo e Vicente
        putStrLn "Figurinhas de Marcelo:"
        marcelo <- readLn
        putStrLn "Figurinhas de Vicente:"
        vicente <- readLn

        -- Calcula o MDC
        let resultado = mdc marcelo vicente

        -- Exibe o resultado
        putStrLn $ "Maior bolo de figurinhas possível: " ++ show resultado
        putStrLn ""  -- Linha em branco para separar as entradas