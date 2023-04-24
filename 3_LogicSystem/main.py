from KB import KnowledgeBase
from fact import Fact
from FC import forwardChaining

inputFile = "input.pl"

kb = KnowledgeBase()
kb.initizalize(inputFile)

print('Done initialize knowledge base from input')

f = open("report.txt","w")
for fact in kb.fact: f.write(str(fact)+'\n')
for rule in kb.rule: f.write(str(rule)+'\n')

f = open("query.txt","r")
fo = open("output.txt","w")
for queryText in f.readlines():
    query = Fact()
    query.parseFact(queryText)
    print('Currently process query',queryText)
    substs = set(forwardChaining(kb,query))
    substs_str = ' ;\n'.join([str(subst) for subst in substs]) + '.\n'
    fo.write(queryText+'\n')
    fo.write(substs_str)
    fo.write('/========================/'+'\n')
print('Done processing all query')