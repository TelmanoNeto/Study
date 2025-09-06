seq = [0,1]

for i in range(2,61):
    seq.append(seq[i-1] + seq[i-2])

n = int(input())

for k in range(n):
    num = int(input())

    print(f'Fib({num}) = {seq[num]}')
