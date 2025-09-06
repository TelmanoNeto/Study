def verificar_tipo_triangulo(A, B, C):
    lados = [A, B, C]
    lados.sort(reverse=True)

    A = lados[0]
    B = lados[1]
    C = lados[2]

    if A >= B + C:
        print("NAO FORMA TRIANGULO")
    else:
        # Verifica o tipo de triângulo
        if A**2 == B**2 + C**2:
            print("TRIANGULO RETANGULO")
        elif A**2 > B**2 + C**2:
            print("TRIANGULO OBTUSANGULO")
        else:
            print("TRIANGULO ACUTANGULO")

        if A == B == C:
            print("TRIANGULO EQUILATERO")
        elif A == B or A == C or B == C:
            print("TRIANGULO ISOSCELES")

def main():
    A, B, C = map(float, input().split())
    verificar_tipo_triangulo(A, B, C)

if __name__ == "__main__":
    main()
