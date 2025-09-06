def fibonacci(n):
  sequencia = []
  a, b = 0, 1

  for i in range(n):
    sequencia.append(a)
    a,b = b, a + b

  msg = ''
  for _ in range(len(sequencia)):
    if _ < len(sequencia) - 1:
      msg += str(sequencia[_]) + ' '
    else:
      msg += str(sequencia[_])
    
  return msg

n = int(input())
print(fibonacci(n))
