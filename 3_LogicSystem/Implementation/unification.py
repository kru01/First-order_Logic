from .fact import Fact

def isVariable(x):
    #queen(X, england), X is an variable
    #alphabet(x), x is just a constant
    return (isinstance(x,str) and x[0].isupper())

def isCompound(x):
    #A compound is represent with function,relation and argument
    #Example brother(harry, phillips) 
    #A Fact is a compound itself
    return (isinstance(x,Fact))

def isList(x):
    #A list contain of argrument, for deeper recursion in the UNIFY function
    return (isinstance(x,list))

def REST(x): #With x as an Fact, this function return a list of x arguments in the range [1,n]
    xList = x.copy()
    return xList[1:]

def FIRST(x): #return the first element of the list (x[0])
    return x[0]

def UNIFY(x,y,theta):
    if (not theta): return False
    if (x == y): return theta
    if (isVariable(x)): return UNIFY_VAR(x,y,theta)
    if (isVariable(y)): return UNIFY_VAR(y,x,theta)
    if (isCompound(x) and isCompound(y)): return UNIFY(x.args,y.args,UNIFY(x.func,y.func,theta))
    if (isList(x) and isList(y) and (len(x) == len(y))): return UNIFY(REST(x),REST(y),UNIFY(FIRST(x),FIRST(y),theta))
    #If list x and y have different number of agruments, eventually when recursive into the deeper layer
    # We will have a state where just one of its is a list
    return False

def UNIFY_VAR(var,x,o):
    if (var in o.mapping): return UNIFY(o.mapping[var],x,o)
    if (x in o.mapping): return UNIFY(var,o.mapping[x],o) 
    o.mapping[var] = x
    return o