# -*- coding: utf-8 -*-
"""
Created on Mon Jun 24 18:17:48 2019

@author: Chell
"""

import os
import csv

# Path to collect data from the Resources folder
poll_path = os.path.join('Resources', 'election_data.csv')

#Variables
total_votes = 0
khan_votes = 0
correy_votes = 0
li_votes = 0
otooley_votes = 0

with open(poll_path, newline="", encoding='utf-8') as elections:
    csvreader = csv.reader(elections, delimiter=",")
    header = next(csvreader)
    
    
    #Itereate through rows
    for row in csvreader:
    
            #count unique values
            total_votes += 1
            
            if row[2] == "Khan":
                khan_votes += 1
            
            elif row[2] == "Correy":
                correy_votes += 1
            
            elif row[2] == "Li":
                li_votes += 1
            
            elif row[2] == "O'Tooley":
                otooley_votes += 1
            
candidates = ["Khan", "Correy", "Li", "O'Tooley"]
votes = [khan_votes, correy_votes, li_votes, otooley_votes]
                

#Zip and return values 
dict_candidates_and_votes = dict(zip(candidates, votes))
key = max(dict_candidates_and_votes, key=dict_candidates_and_votes.get)


#Print summary of analysis
khan_percent = (khan_votes/total_votes) *100
correy_percent = (correy_votes/total_votes) *100
li_percent = (li_votes/total_votes) *100
otooley_percent = (otooley_votes/total_votes) *100

#Print summary table
print(f"Election Results")
print(f"----------------------------")
print(f"Total Votes: {total_votes}")
print(f"----------------------------")
print(f"Khan: {khan_percent:.3f}%  ({khan_votes})")
print(f"Correy: {correy_percent:.3f}%  ({correy_votes})")
print(f"Li: {li_percent:.3f}%  ({li_votes})")
print(f"O'tooley: {li_percent:.3f}%  ({otooley_votes})")
print(f"----------------------------")
print(f"Winner: {key}")
print(f"----------------------------")

#Output files
output_file = os.path.join('Resources', 'election_results.csv')

with open(output_file, "w") as file:

#Write files
    file.write(f"Election Results")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"Total Votes: {total_votes}")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"Khan: {khan_percent:.3f}% ({khan_votes})")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"Correy: {correy_percent:.3f}% ({khan_votes})")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"Li: {li_percent:.3f}% ({khan_votes})")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"O'Tooley: {otooley_percent:.3f}% ({khan_votes})")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")
    file.write(f"Winner: {key}")
    file.write("\n")
    file.write(f"----------------------------")
    file.write("\n")



