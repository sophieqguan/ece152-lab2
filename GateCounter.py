

"""

S = ABC + AB'C' + A'B'C + A'BC'
C = AB + BC + AC

S0 = ABC + AB'C' + A'B'C + A'BC' (4 terms -> 4 + 1 = 5 gates)
C1 = AB + BC + AC (3 terms -> 4 gates)
--> tot = 5 + 4 = 9 gates

S1 = AB(AB+BC+AC) + AB'(AB+BC+AC)' + A'B'(AB+BC+AC)+A'B(AB+BC+AC)'
   -> s0 had 4 C's, half takes 4, half takes 5  -> 5 + 2 * 4 + 2 * 5 = 23
   -> 5 gates + 4 + 5 + 4 + 5 = 23 gates
C2 = AB + B(AB+BC+AC) + A(AB+BC+AC)
   -> C1 had 2 C's, each takes 4, so 4 + 2 * 4 = 12
   -> 4 gates + 4 + 4 = 12 gates
--> tot = 12 + 23 = 35

S2 = 23 gates + 8 * 4.5 = 23 + 36 = 59
... etc

"""

def S(num_of_c, prev):
    gates = prev + num_of_c * 4.5
    print("\tnum of gates in S: %d" % gates)
    return gates


def C(num_of_c, prev):
    gates = prev + num_of_c * 4
    print("\tnum of gates in C: %d" % gates)
    return gates


def count():
    s = 5           # number of gates in S
    sc = 4          # number of Cin's in S
    c = 4           # number of gates in Cout
    cc = 2          # number of Cin's in Cout
    sum = s + c     # total number of gates

    n = 1
    while n < 4:
        print("-- FA %d -- " % n)
        s = S(sc, s)
        c = C(cc, c)
        sc *= 2
        cc *= 2

        sum += s + c
        n += 1

    return "\n-- total: %d gates -- " % sum


if __name__ == '__main__':
    print(count())
