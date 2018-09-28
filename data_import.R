# Reading a text file into R

# 1st thing: Decide or Find your directory 
# Example if you want to read text file
# Should have the .txt extension

text_to_table <- read.delim("by_country.txt")

#----------------------------------------------
# Best to execute as below:
file_name <- read.delim("name.txt", header=TRUE, sep="\t")
# Type the name if you want to see 
file_name
# The use of header=TRUE and sep="\t" is to be able to then see this in
# table format
View(file_name)

# OR Text file converison from .txt to .csv
text_to_table <- read.delim("name.txt")

write.table(text_to_table, 
            file="to_table_example.csv",sep=",",col.names=FALSE,row.names=FALSE)

# We use file="xxxxxxxxxx.csv" to specify the name we want to give to the file that will now have
# a .csv extension and is going to be saved in our directory

write.table(text_to_table, 
            file="by_country_example.csv",sep=",",col.names=FALSE,row.names=FALSE)






