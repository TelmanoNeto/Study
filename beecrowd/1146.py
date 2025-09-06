linha = 0

while True:
    fim = int(input())

    if fim == 0:
        break
    else:
        for i in range(fim):
            linha += 1
            if linha == fim:
                print(i + 1, end = '\n')
                linha = 0
            else:
                print(i + 1, end = ' ')
