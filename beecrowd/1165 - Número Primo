n = int(input())

for i in range(n):
    num = int(input())
    divisores = []
    for k in range(1,num+1):
        if num % k == 0:
            divisores.append(k)

    soma = 0
    for numero in divisores:
        soma += numero

    if len(divisores) > 2:
        print(f'{num} nao eh primo')
    else:
        print(f'{num} eh primo')
