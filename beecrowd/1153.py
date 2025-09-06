N = int(input())
fatorial = 1

for i in range(N):
    fatorial *= N
    N -= 1

print(fatorial)
