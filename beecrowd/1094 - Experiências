N = int(input())

coelho = 0
rato = 0
sapo = 0

for vezes in range(N):
  quantidade = input()
  quantidade_cobaias = int(quantidade[0:2])
  if quantidade[-1] == 'C':
    coelho += quantidade_cobaias 
  elif quantidade[-1] == 'R':
    rato += quantidade_cobaias
  else:
    sapo += quantidade_cobaias

total = sapo + coelho + rato

percentual_coelhos = (coelho / total) * 100
percentual_ratos = (rato / total) * 100
percentual_sapos = (sapo / total) * 100

print(f'Total: {total} cobaias')
print(f'Total de coelhos: {coelho}')
print(f'Total de ratos: {rato}')
print(f'Total de sapos: {sapo}')
print(f'Percentual de coelhos: {percentual_coelhos:.2f} %')
print(f'Percentual de ratos: {percentual_ratos:.2f} %')
print(f'Percentual de sapos: {percentual_sapos:.2f} %')
