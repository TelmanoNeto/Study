def soma_impares(X, Y):
  soma = 0
  if X % 2 == 0:
    X += 1

  for i in range(Y):
    soma += X
    X += 2

  return soma

N = int(input())

for i in range(N):
  X, Y = map(int, input().split())
  resultado = soma_impares(X, Y)
  print(resultado)
