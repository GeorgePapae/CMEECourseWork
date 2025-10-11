taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a python script to populate a dictionary called taxa_dic derived from
# taxa so that it maps order names to sets of taxa and prints it to screen.
# 
# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc. 
# OR, 
# 'Chiroptera': {'Myotis  lucifugus'} ... etc

#### Your solution here #### 

taxa_dic={}
for taxon in taxa:
        if taxon[1] not in taxa_dic:
                taxa_dic[taxon[1]] = {taxon[0]}
        else:
                taxa_dic[taxon[1]].add(taxon[0])
print(taxa_dic)

# Now write a list comprehension that does the same (including the printing after the dictionary has been created)  
 
#### Your solution here ####

taxa_dic = {order: {taxon[0] for taxon in taxa if taxon[1] == order} for order in {taxon[1] for taxon in taxa}}
print(taxa_dic)