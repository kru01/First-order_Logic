from fact import Fact
from rule import Rule

class KnowledgeBase:
    def __init__(self,fact=set(),rule=list()) -> None:
        self.fact = fact
        self.rule = rule

    def addFact(self,newFact):
        self.fact.add(newFact)

    def get_relevant_facts(self, rule):
        facts = []
        for fact in self.fact:
            if rule.relevant(fact.func): facts.append(fact)
        return facts

    def initizalize(self,inputFile):
        f = open(inputFile)
        Lines = f.readlines()
        for line in Lines:
            if ('*' in line): continue #Comment
            if (('(' not in line) and (')' not in line)): continue
            if (':-' in line):
                newRule = Rule()
                newRule.parseRule(line)
                self.rule.append(newRule)
            else:
                newFact = Fact()
                newFact.parseFact(line)
                self.fact.add(newFact)
    