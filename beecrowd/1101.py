while True:
    m, n = map(int, input().split())

    if m <= 0 or n <= 0:
        break

    if m > n:
        menor = n
        maior = m
    else:
        menor = m
        maior = n

    for i in range(menor, maior + 1):
        print(i, end = ' ') 

    soma = sum(range(menor, maior + 1))
    print(f'Sum={soma}')
