notas = 0
media = 0

while notas < 2:
    nota = float(input())

    if nota < 0 or nota > 10:
        print('nota invalida')
    else:
        notas += 1
        media += nota

media_final = media / 2
print(f'media = {media_final:.2f}')
