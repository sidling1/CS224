# An integer greater than any positive integer
# Used to tell that the transaction is not possible
inf = float('inf')

# Total Amount of whose change has to be calculated
N = int(input("How much money do you have? ")) 

# Denominations available
Denominations = [1,5,10,20,25,50] 
n=len(Denominations)


# initializing a 2*2 array in which we will store
# the minimum number of coins 
# using first i denominations to pay j amount
C =  [[0 for x in range(N+1)] for y in range(n)] 


#initializing the number of coins of particular denominations currently in use
Coins = {}
for x in Denominations:
    Coins[x] = 0

# Minimum Number of Coins Required
def Change(n,N):
    # Running two loops such that
    # For each i i.e for each extra denomination added
    # All the values of j are iterated
    for i in range(n):
        for j in range(N+1):
            if j == 0: #there is no way in which we can pay zero rupees hence we require zero coins
                C[i][j] = 0
                continue
            if i == 0: #if we use only the first denomination then there are the following cases
                if j < Denominations[i]:
                    C[i][j]=inf
                elif j%Denominations[i]==0:
                    C[i][j] = int(j/Denominations[i])
                else:
                    C[i][j] = inf
                continue
            if j-Denominations[i] >= 0: #for the rest of the table we fill it using the previously calculated data
                C[i][j] = min(C[i-1][j],1+C[i][j-Denominations[i]]) # first case is we dont use the ith denomination and the second case is we use the ith denomination and we take the minimum of both the cases
            else:
                C[i][j] = C[i-1][j]
    # C[n-1][N] denotes the
    # Minimum Number of coins using 0 to n-1 denominations of coins
    # to give N amount of money
    print(C[n-1][N]) #prints the minimum number of coins required to pay the required amount using denominations from 0th position to n-1th position.

# Number of Coins of Respective Denominations
def Coin_Counter(n,N):
    j=N
    i=n-1
    while j!=0: #we loop in the C table from down to up 
        while i!=0: #and incrementing the denomination  
            if C[i][j] != C[i-1][j]: #where the minimum number of coins required change hence we use that denomination 
                Coins[Denominations[i]]+=1
                j = j-Denominations[i] #and we move down the same row to the amount now left to be paid
                break
            if C[0][j] == C[1][j]:
                Coins[Denominations[0]] = C[0][j]
                j = j - Denominations[0]*C[0][j]
                break
            i-=1
    print(Coins) #print the number of coins of each denomination used.

Change(n,N)
Coin_Counter(n,N)