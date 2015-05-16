#!/usr/bin/python

################################################################################
# Autor: Andrés Herrera Poyatos
# Universidad de Granada, May, 2015
################################################################################

# Compute the number of solutions that are needed to check in problem 5

#---------------- EXPLANATION -----------------#

"""
    There are m machines and n jobs. We want to compute in how many ways
    the jobs can be assigned to the machines. However, we don't care about
    the order in which the machine does the jobs. Besides, we want each machine
    to do at least one job and we just care about the distribution of the jobs,
    not which machine has each set of jobs.

    The first requirement let us with m^n possible assignations. Furthermore,
    if each machine does at least a job we can forget those assignations that
    leave a machine with no job. Let's a_i be the number of assignations in
    this way for i = 1,...,m machines. Then, a_1 = 1 and

    i^n = CNR(i,1) a_1 + CNR(i,2) a_2 + ... + CNR(i,i) a_i

    where CNR are combinations without repetitions.

    We can compute a_m with this relationship (first compute a_2, then a_3 and
    so on). The only thin left is dividing by the number of permutations of the
    m machines since we don't care about which machine has each set of jobs.
"""

#---------------- FUNCTIONS -----------------#

import math # Maths (factorial, pow)
import sys  # sys.argv

def combNR(n,m):
    return (math.factorial(n) / math.factorial(m)) / math.factorial(n-m)

def solutions(m,n):
    solutions = [0,1]
    for i in range(2,m+1):
        solutions.append(math.pow(i,n) - sum([combNR(i,j)*solutions[j] for j in range(1,i)]))
    return solutions[-1] / math.factorial(m)

#---------------- MAIN -----------------#

# See if arguments are correct
if len(sys.argv) != 3:
    print("Sintax: computeNumberSolutions.py <number machines> <number jobs>")
    sys.exit()

[m, n] = [int(x) for x in sys.argv[1:3]]

print(solutions(m,n))
