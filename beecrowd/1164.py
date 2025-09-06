n = int(input())

for i in range(n):
    num = int(input())
    divisores = []
    for k in range(1,num):
        if num % k == 0:
            divisores.append(k)

    soma = 0
    for numero in divisores:
        soma += numero

    if soma != num:
        print(f'{num} nao eh perfeito')
    else:
        print(f'{num} eh perfeito')
