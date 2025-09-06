salario = float(input())
imposto = 0

if salario < 2000:
    print('Isento')
elif 2000 < salario <= 3000:
    imposto += (salario - 2000) * 0.08
    print(f'R$ {imposto:.2f}')
elif 3000 < salario <= 4500:
    imposto += (salario - 3000) * 0.18 + 80
    print(f'R$ {imposto:.2f}')
else:
    imposto += (salario - 4500) * 0.28 + 350
    print(f'R$ {imposto:.2f}')

