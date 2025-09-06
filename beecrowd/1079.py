N = int(input())

for cada in range (N):
    X, Y, Z = input().split()

    X_float = float(X)
    Y_float = float(Y)
    Z_float = float(Z)

    media_ponderada = ((X_float * 2) + (Y_float * 3) + (Z_float * 5)) / 10
    print(f'{media_ponderada:.1f}')
