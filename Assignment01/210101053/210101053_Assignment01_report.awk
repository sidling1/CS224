#Ubuntu 22.04 LTS

BEGIN{print "--------------------------------  INVENTORY REPORT  --------------------------------\n"
    print "PART NO.  " , "Price  " , "Quantity on hand  ", "Reorder point  ","Minimum order  ", "Order amount\n"}
{   
    OrderAmount = 0;
    partno = $1;
    price = $2;
    onhandquantity = $3;
    reorderpt = $4;
    minorder = $5;
    if(onhandquantity<reorderpt){OrderAmount = reorderpt+minorder-onhandquantity}
    printf("%-10s %-15s %-15s %-15s %-15s %-15s\n\n",partno,price,onhandquantity,reorderpt,minorder,OrderAmount)
}
END{print "\n-------------------------------------  END REPORT  ----------------------------------"}