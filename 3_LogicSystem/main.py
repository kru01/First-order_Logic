from Implementation.KB import KnowledgeBase
from Implementation.fact import Fact
from Implementation.FC import forwardChaining

inputFile = "input.pl"

kb = KnowledgeBase()
kb.initizalize(inputFile)

print('--> Done initializing Knowledge Base from input.\n')

f = open("report.txt","w")
for fact in kb.fact: f.write(str(fact)+'\n')
for rule in kb.rule: f.write(str(rule)+'\n')
f.close()

f = open("query.txt","r")
fo = open("output.txt","w")
for queryText in f.readlines():
    query = Fact()
    query.parseFact(queryText)
    print(f'Currently processing query {queryText}')
    substs = set(forwardChaining(kb,query))
    substs_str = ' ;\n'.join([str(subst) for subst in substs]) + '.\n'
    fo.write(queryText+'\n')
    fo.write(substs_str)
    fo.write('/========================/'+'\n')
print('\n--> Done processing all queries.')
f.close()
fo.close()