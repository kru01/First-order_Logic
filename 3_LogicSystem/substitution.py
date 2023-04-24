class Substitution:
    def __init__(self) -> None:
        self.mapping = dict()
        #For example a substituion o = {x/A, y/z ,....} we can see it as a mapping from x -> A, y -> z, ....

    def __repr__(self):
      return ', '.join('{} = {}'.format(key, value) for key, value in self.mapping.items())

    def SUBST(self,fact): #Replace arg in fact with its mapping in substitution o
        for i in range(len(fact.args)):
            if (fact.args[i] in self.mapping):
                fact.args[i] = self.mapping[(fact.args[i])]
    def clone(self):
        newSub = Substitution()
        newSub.mapping = self.mapping
        return newSub
