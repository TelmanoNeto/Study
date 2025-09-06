codigo1, qtd1, valor1 = input().split(' ')

codigo1 = int(codigo1)
qtd1 = int(qtd1)
valor1 = float(valor1)

codigo2, qtd2, valor2 = input().split(' ')

codigo2 = int(codigo2)
qtd2 = int(qtd2)
valor2 = float(valor2)

conta1 = qtd1 * valor1
conta2 = qtd2 * valor2
valor_total = conta1 + conta2

print(f'VALOR A PAGAR: R$ {valor_total:.2f}')

