num1 = int(input())
num2 = int(input())
num3 = int(input())
num4 = int(input())
num5 = int(input())


lista = (num1, num2, num3, num4, num5)

valor1 = 0
valor2 = 0
valor3 = 0
valor4 = 0

for par in lista:
    if par % 2 == 0:
        valor1 += 1
print(f'{valor1} valor(es) par(es)')

for impar in lista:
    if impar % 2 == 1:
        valor2 += 1
print(f'{valor2} valor(es) impar(es)')

for positivo in lista:
    if positivo > 0:
        valor3 += 1
print(f'{valor3} valor(es) positivo(s)')

for negativo in lista:
    if negativo < 0:
        valor4 += 1
print(f'{valor4} valor(es) negativo(s)')
