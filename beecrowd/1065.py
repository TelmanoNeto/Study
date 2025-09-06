num1 = float(input())
num2 = float(input())
num3 = float(input())
num4 = float(input())
num5 = float(input())


lista = (num1, num2, num3, num4, num5)

valor = 0

for i in lista:
    if i % 2 == 0:
        valor +=1

print(f'{valor} valores pares')

