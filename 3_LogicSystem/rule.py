from fact import Fact
from unification import UNIFY
from substitution import Substitution

class Rule:
    #Premise is a conjunction of literal (p1^p2^....^pn)
    def __init__(self,premises=list(),conclusion=Fact()) -> None:
        self.premises = premises
        self.conclusion = conclusion
        self.func = []
    def __repr__(self):
        return '{} => {}'.format(' & '.join([str(cond) for cond in self.premises]), str(self.conclusion))

    def relevant(self, fact_func):
      return fact_func in self.func
      #For example wife(X, Y) ^ king(Y) => queen(X)
      #Then the fact King(arg) is relevant to the conclusion

    def may_triggered(self, new_facts):
      # Check if any fact pi in new_facts is unified with a premise in rule
      for new_fact in new_facts:
         for premise in self.premises:
            if UNIFY(new_fact, premise, Substitution()):
               return True
      return False  

    def parseRule(self,rule_str):
        #example: mother(X, Y) :- female(X), parent(X, Y).
        rule_str = rule_str.strip().rstrip('.').replace(' ', '')
        sep_idx = rule_str.find(':-')
        newFact = Fact()
        newFact.parseFact(rule_str[: sep_idx])
        conclusion = newFact
        premises = []
        list_fact_str = rule_str[sep_idx + 2:].split('),')

        for idx, fact_str in enumerate(list_fact_str):
            if idx != len(list_fact_str) - 1:
                fact_str += ')'
            newFact = Fact()
            newFact.parseFact(fact_str)
            premises.append(newFact)
        self.premises = premises
        self.conclusion = conclusion
        for premise in self.premises:
            self.func.append(premise.func)
