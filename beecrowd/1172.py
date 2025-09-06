vetor = [0 for i in range(10)]

for l in range(10):
    num = int(input())

    if num <= 0:
        vetor[l] = 1
    else:
        vetor[l] = num

    print(f'X[{l}] = {vetor[l]}')
