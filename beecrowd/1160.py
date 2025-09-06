n = int(input())

for i in range(n):
    PA,PG,G1,G2 = input().split()
    PA,PG = int(PA), int(PG)
    G1,G2 = float(G1)/100 + 1, float(G2)/100+ 1

    anos = 0

    while PA <= PG:
        PA = (PA * G1)// 1
        PG = (PG * G2)// 1
        anos += 1

    if anos > 100:
        print('Mais de 1 seculo.')
    else:
        print(f'{anos} anos.')
