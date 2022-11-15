QUESTION1

Commands For Execution-
-Run the terminal in the same folder as the Question1.py file.
-Wrtite the command: python3 Question1.py.
-It will ask for the amount of money whose change is to be calculated.
-It will output the minimum number of Coins and The total number of Coins of each denomination used.

Explanation of the Code:
I defined an array of dimensions (no. of denominations) X (Total amount to be paid + 1).
I defined element infinity using float('inf') so that we can show a case which is not possible using current denominations as it required infinite number of minimum coins.
The value of the array element C[i][j] gives us the minimum number of Coins Required to Pay amout j using denominations of coins from 0 to i-1th in the Denominations array.
Then i have looped through all the j values for each i to calculate the minimum number of coins required to pay amount j.
For the first row i.e for i=0, we have only one denominatoins hence there are three cases:
1.The denomination is greater than amount to be paid in which case it is not possible to pay hence C[i][j] = inf
2.The denomination divides the amount to be paid exactly meaning that we can pay the amount exactly using the given denomation and C[i][j] = Amt/Denomination.
3.The denomination is smaller than the total amount but it does not divide the amount hence it is not possible to pay the amount using only that denomination hence leading to C[i][j] = inf.
Now using these cases , the first row will be filled completely.
For the subsequent cases , for j=0 i.e. the amount to be paid is zero required zero coins minimum hence C[i][0] = 0 for all i.
Now there are further two cases we have to consider when we are filling the i th row -
1.We use the i th Denomination : Hence the minimum number of coins now ill be 1+C[i][j-denomination] and since we are filling the table row-wise we know the value of C[i][j-denomination]
2.We do not use the i th Denomination : Hence the minimum number of coins used will be the same as C[i-1][j] because it is the same case as paying using i-1 denominations.
So for the C[i][j] we take the minimum value from the above test cases.
Using this algorithm we fill the whole table of C , 
and the required answer is C[n-1][N] i.e. the value of the element with denomations used from 0 to n-1 to pay the amount N.

Now to calculate the number of each denomination used we make use of the table we created above.
We iterate bottom to top in the last column of the table and we take note of the row value after which the value in the cell changes. A change in value implies that the value does not come from above and hence we have used that denomination. Then we subtract that denomination from out current column value and continue the same algorithm from the row we are on and change the column to column - row value , till we reach column 0.

-------------------------------------------------------------------------------------------------------------------------

QUESTION2

they are written according to pdflatex complier.

Commands For Execution:
-Run the terminal in the same folder as both the Question2a and 2b.tex files.
-Write the following commands:
				pdflatex Question2a.tex
				pdflatex Question2b.tex
-The pdf will be created in the same folder along with some other files.

Note - In Question2a , the hrefs links are not working on the first compilation and show ?? in their place , but on compiling and building again (running the first command again) the problem is getting resolved.










