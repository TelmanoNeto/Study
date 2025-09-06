N = int(input())

for i in range(N):
    F1, F2 = map(int, input().split())
    
    while(F1 != 0):
        resto = F2 % F1
        F2 = F1
        F1 = resto
        divisor = F2

    print(divisor)
