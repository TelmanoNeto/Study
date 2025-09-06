i = 0
j = 10

while i <= 21:
    if i % 10 == 0:
        print(f'I={i / 10:.0f} J={j / 10:.0f}')
        j += 10
        print(f'I={i / 10:.0f} J={j / 10:.0f}')
        j += 10
        print(f'I={i / 10:.0f} J={j / 10:.0f}')
        i += 2
        j = i + 10
    else:
        print(f'I={i / 10:.1f} J={j / 10:.1f}')
        j += 10
        print(f'I={i / 10:.1f} J={j / 10:.1f}')
        j += 10
        print(f'I={i / 10:.1f} J={j / 10:.1f}')
        i += 2
        j = i + 10
