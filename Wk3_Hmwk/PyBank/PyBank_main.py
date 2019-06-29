# -*- coding: utf-8 -*-
"""
Created on Mon Jun 24 18:17:48 2019

@author: Chell
"""
import os
import csv

# Path to collect data from the Resources folder
budget_path = os.path.join('Resources', 'budget_data.csv')
#budget_path = os.path.join(C:\Users\Chell\Documents\Training\GWU\Wk3- Python\Hmwk\PyBank\Resources)

# Create empty lists to iterate through specific rows for the following variables
total_months = []
total_profit = []
monthly_profit_change = []

#read in csvfile 
with open(budget_path, newline='') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')
    csv_header = next(csvreader)

#1 - The total number of months included in the dataset
#2 - The net total amount of "Profit/Losses" over the entire period   
#3 - The average of the changes in "Profit/Losses" over the entire period
#4 - The greatest increase in profits (date and amount) over the entire period
#5 - The greatest decrease in losses (date and amount) over the entire period
    
    for row in csvreader:
    
        #calculate totals
        total_months.append(row[0])
        total_profit.append(int(row[1]))
    
    #Iterate for Monthly change in profits
    for i in range(len(total_profit)-1):
        
        #Difference
        monthly_profit_change.append(total_profit[i+1]-total_profit[i])
    
#Max and Min
max_increase_value = max(monthly_profit_change)
max_decrease_value = min(monthly_profit_change)

#Match max and min to month
max_increase_month = monthly_profit_change.index(max(monthly_profit_change)) +1
max_decrease_month = monthly_profit_change.index(min(monthly_profit_change)) +1

#Print
print("Financial Analysis")
print("-------------------------")
print(f"Total Months: {len(total_months)}")
print(f"Total: ${sum(total_profit)}")
print(f"Average Change: {round(sum(monthly_profit_change)/len(monthly_profit_change),2)}")
print(f"Greatest Increase in Profits: {total_months[max_increase_month]} (${(str(max_increase_value))})") 
print(f"Greatest Decrease in Profits: {total_months[max_decrease_month]} (${(str(max_decrease_value))})")

##Create path
data_output = os.path.join('Resources','pybank_analysis.csv')

##Write data to .csv
with open(data_output, "w") as file:
    file.write("Financial Analysis")
    file.write("\n")
    file.write("----------------------------")
    file.write("\n")
    file.write(f"Total Months: {len(total_months)}")
    file.write("\n")
    file.write(f"Total: ${sum(total_profit)}")
    file.write("\n")
    file.write(f"Average Change: {round(sum(monthly_profit_change)/len(monthly_profit_change),2)}")
    file.write("\n")
    file.write(f"Greatest Increase in Profits: {total_months[max_increase_month]} (${(str(max_increase_value))})")
    file.write("\n")
    file.write(f"Greatest Decrease in Profits: {total_months[max_decrease_month]} (${(str(max_decrease_value))})")
