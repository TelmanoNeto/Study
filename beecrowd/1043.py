l1, l2, l3 = input().split()

l1 = float(l1)
l2 = float(l2)
l3 = float(l3)

condicao = l1 + l2 > l3 and l1 + l3 > l2 and l2 + l3 > l1
perimetro = l1 + l2 + l3
area = (l1 + l2) * l3 /2

if condicao:
  print(f'Perimetro = {perimetro:.1f}')

else:
  print(f'Area = {area:.1f}')
