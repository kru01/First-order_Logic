#Forward Chaining
import itertools
from .unification import UNIFY
from .substitution import Substitution

def subst(facts_1, facts_2):           # Generalized Modus Ponens
   if len(facts_1) != len(facts_2):
      return False

   for f1, f2 in zip(facts_1, facts_2):
      if f1.func != f2.func:
         return False

   return UNIFY(facts_1, facts_2, Substitution())

def forwardChaining(kb, query):
   res = set()
   for fact in kb.fact:
      theta = UNIFY(fact, query, Substitution())
      if theta:
         if (len(theta.mapping) == 0):
            res.add('true')
            return res
         res.add(theta)

   last_generated_facts = kb.fact.copy()

   while True:
      new_facts = set()
      for rule in kb.rule:
         if not rule.may_triggered(last_generated_facts): continue
         num_premises = len(rule.premises)
        # Get facts that relevant to the current rule
         potential_facts = kb.get_relevant_facts(rule)
      #  Create all posible permution of array potenital_fact and length of permutation is num_premise
         potential_premises = itertools.permutations(potential_facts, num_premises)
         # for premise in potential_premises: print(str(premise))
         for tuple_premises in potential_premises:
            premises = [premise for premise in tuple_premises]
            theta = subst(rule.premises, premises)
            if not theta:
               continue
            
            new_fact = rule.conclusion.copy()
            theta.SUBST(new_fact)
            
            if new_fact not in new_facts and new_fact not in kb.fact:
               new_facts.add(new_fact)
               theta = UNIFY(new_fact, query, Substitution())
               if theta:
                  if (len(theta.mapping) == 0):
                     kb.facts.update(new_facts)
                     res.add('true')
                     return res
                  res.add(theta)

      last_generated_facts = new_facts
      if not new_facts:
         if not res:
            res.add('false')
         return res
      kb.fact.update(new_facts)