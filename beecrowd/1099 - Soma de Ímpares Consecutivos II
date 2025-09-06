N = int(input())

for i in range(N):
    X, Y = map(int,input().split())

    if X > Y:
        X, Y = Y, X

    soma_impares = 0

    for i in range(X+1, Y):
        if i % 2 == 1:
            soma_impares += i
    print(soma_impares)
