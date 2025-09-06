grenal = 0
inter = 0
gremio = 0
empate = 0

while True:
    gols_inter, gols_gremio = map(int, input().split())
    grenal += 1

    if gols_gremio > gols_inter:
        gremio += 1
    elif gols_inter > gols_gremio:
        inter += 1
    else:
        empate += 1

    novo = int(input('Novo grenal (1-sim 2-nao)\n'))
    if novo == 1:
        continue
    else:
        break

maior_vencedor = ''

if inter > gremio:
    maior_vencedor = 'Inter'
elif gremio > inter:
    maior_vencedor = 'Gremio'

print(
    f'{grenal} grenais\n' 
f'Inter:{inter}\n'  
f'Gremio:{gremio}\n' 
f'Empates:{empate}\n' 
f'{maior_vencedor} venceu mais'
)
