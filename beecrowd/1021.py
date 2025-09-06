valor = input()
valor = float(valor)
valor = valor * 100
valor=int(valor)


cem = valor // 10000
valor = (valor % 10000)

cinquenta = (valor) // 5000
valor = (valor % 5000)

vinte = (valor) // 2000
valor = (valor % 2000)

dez = (valor) // 1000
valor = valor % 1000

cinco = (valor) // 500
valor = valor % 500

dois = (valor) // 200
valor = valor % 200

um = (valor) // 100
valor = valor % 100

cinquenta_centavos = valor // 50
valor = valor % 50

vinte_cinco = valor // 25
valor = valor % 25

dez_centavos = valor // 10
valor = valor % 10

cinco_centavos = valor // 5
valor = valor % 5
um_centavo = valor 


print('NOTAS:')
print(f'{cem} nota(s) de R$ 100.00')
print(f'{cinquenta} nota(s) de R$ 50.00')
print(f'{vinte} nota(s) de R$ 20.00')
print(f'{dez} nota(s) de R$ 10.00')
print(f'{cinco} nota(s) de R$ 5.00')
print(f'{dois} nota(s) de R$ 2.00')
print('MOEDAS:')
print(f'{um} moeda(s) de R$ 1.00')
print(f'{cinquenta_centavos} moeda(s) de R$ 0.50')
print(f'{vinte_cinco} moeda(s) de R$ 0.25')
print(f'{dez_centavos} moeda(s) de R$ 0.10')
print(f'{cinco_centavos} moeda(s) de R$ 0.05')
print(f'{um_centavo} moeda(s) de R$ 0.01')
