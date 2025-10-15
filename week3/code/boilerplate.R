# A boilerplate R script

MyFunction <- function (Arg1, Arg2) {

    #Statements involveing Arg1 and Arg2
    print(paste("Argument", as.character(Arg1), "is a", class(Arg1)))
    print(paste("Argument", as.character(Arg2), "is a", class(Arg2)))
    
    return (c(Arg1, Arg2)) # optional but useful
}

MyFunction(1,2) #test the function
MyFunction("Riki", "Tiki") #Different test