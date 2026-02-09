def f(A, n):
    if n == 0:
        return 0
    else:
        return f(A, n - 1) + A[n - 1]


print(f([1, 2, 3], 3))


def newF(A, n):
    if n == 0:
        return 0
    x = 0
    for i in range(n):
        x += A[i]

    return x


print(newF([1, 2, 3], 3))
