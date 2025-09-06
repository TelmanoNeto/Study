entrada1 = input().split()
dia_inicio = int(entrada1[1])
hora_inicio, minuto_inicio, segundo_inicio = map(int, input().split(' : '))

entrada2 = input().split()
dia_fim = int(entrada2[1])
hora_fim, minuto_fim, segundo_fim = map(int, input().split(' : '))

tempo_inicio_segundos = (dia_inicio * 86400) + (hora_inicio * 3600) + \
    (minuto_inicio * 60) + segundo_inicio
tempo_final_segundos = (dia_fim * 86400) + (hora_fim * 3600) + \
    (minuto_fim * 60) + segundo_fim
tempo_jogado = tempo_final_segundos - tempo_inicio_segundos

dias = tempo_jogado // 86400
tempo_jogado = tempo_jogado % 86400

horas = tempo_jogado // 3600
tempo_jogado = tempo_jogado % 3600

minutos = tempo_jogado // 60
tempo_jogado = tempo_jogado % 60

segundos = tempo_jogado

print(f'{dias} dia(s)')
print(f'{horas} hora(s)')
print(f'{minutos} minuto(s)')
print(f'{segundos} segundo(s)')
