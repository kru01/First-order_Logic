#Fact is given in a form of compound
#For example: prince(prince_harry)
class Fact:
    def __init__(self,func='',args=list()) -> None:
        self.func = func
        self.args = args

    def __lt__(self, rhs):
      if (self.func == rhs.func): return(self.args < rhs.args)
      return (self.func < rhs.func)

    def __eq__(self, rhs):
        return ((self.func == rhs.func) and (self.args == rhs.args))

    def __hash__(self):
      return hash(str(self))
    
    def __repr__(self):
      return '{}({})'.format(self.func, ', '.join(self.args))
    
    def copy(self):
      return Fact(self.func, self.args.copy())
    
    #The hashing is use to put fact in a set()
    #The equal operator is use to compare compound x and y in the UNIFY
    #It's easier to know if p1^p2^p3^....p^n is literally the same as p1' ^ p2' ^ .....^ pn'
        
    def parseFact(self,fact_str):
        # Example: female(princess_diana).
      fact_str = fact_str.strip().rstrip('.').replace(' ', '')
      sep_idx = fact_str.index('(')

      # function and args are separated by '('
      func = fact_str[:sep_idx]
      args = fact_str[sep_idx + 1 : -1].split(',')
      self.func = func
      self.args = args
