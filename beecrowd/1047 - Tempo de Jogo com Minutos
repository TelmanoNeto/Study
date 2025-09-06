hora_inicial, minuto_inicial, hora_final, minuto_final = \
      map(int, input().split())

tempo_inicial = hora_inicial * 60 + minuto_inicial
tempo_final = hora_final * 60 + minuto_final
duracao_em_minutos = tempo_final - tempo_inicial

if duracao_em_minutos <= 0:
    duracao_em_minutos += 24 * 60

horas = duracao_em_minutos // 60
minutos = duracao_em_minutos % 60

print(
    f'O JOGO DUROU {horas} HORA(S) ' \
    f'E {minutos} MINUTO(S)'
    )
