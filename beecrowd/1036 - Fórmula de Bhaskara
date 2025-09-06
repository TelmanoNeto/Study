def calcular_raizes_bhaskara(A, B, C):
    delta = B**2 - 4*A*C

    if delta < 0 or A == 0:
        print("Impossivel calcular")
    else:
        x1 = (-B + (delta ** 0.5)) / (2*A)
        x2 = (-B - (delta ** 0.5)) / (2*A)
        print(f"R1 = {x1:.5f}")
        print(f"R2 = {x2:.5f}")

def main():
    A, B, C = map(float, input().split())
    calcular_raizes_bhaskara(A, B, C)

if __name__ == "__main__":
    main()
