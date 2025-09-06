x, y = map(int, input().split())

linha = 0

for i in range(y):
    linha += 1
    if linha == x:
        print(i + 1, end = '\n')
        linha = 0
    else:
        print(i + 1, end = ' ')
