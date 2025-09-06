def sao_multiplos(A, B):
    if A % B == 0 or B % A == 0:
        return True
    else:
        return False

def main():
    A, B = map(int, input().split())
    if sao_multiplos(A, B):
        print("Sao Multiplos")
    else:
        print("Nao sao Multiplos")

if __name__ == "__main__":
    main()

