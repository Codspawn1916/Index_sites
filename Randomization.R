###
title: " supor mega randomization"
author: "Chat GPT, then Lucia Liet"
date: "5/24/2023"
output: "html document"
###

batchMSup <- read.csv("Supors_megabatch.csv") # Upload supor list file

# Store all columns
ID <- batchMSup$ID
sample_barcode <- batchMSup$Sample.Barcode
sample_label <- batchMSup$Sample.Label
freezer_name <- batchMSup$Freezer.Name
rack_name <- batchMSup$Rack.Name
box_name <- batchMSup$Box.Name
filter_type <- batchMSup$Filter.Type..Conditional.

# Combine the Sample.Barcode and Box.Name columns into a data frame
combined_data <- data.frame(Sample.Barcode = sample_barcode, Sample.Label = sample_label,
                Freezer.Name = freezer_name, Rack.Name = rack_name, Box.Name = box_name,
                ID = ID)
                       

# Randomize the combined data frame
set.seed(2) # Set seed for reproducibility
combined_data <- combined_data[sample(nrow(combined_data)), ]

# Split the randomized data frame back into separate columns
batchMSup$ID <- combined_data$ID
batchMSup$Sample.Barcode <- combined_data$Sample.Barcode
batchMSup$Sample.Label <- combined_data$Sample.Label
batchMSup$Freezer.Name <- combined_data$Freezer.Name
batchMSup$Rack.Name <- combined_data$Rack.Name
batchMSup$Box.Name <- combined_data$Box.Name

write.csv(batchMSup, file = "Batch_Megasup_randomized.8.csv", row.names = FALSE) # Save the randomized dataset as CSV
