library(RefManageR)

# B?????c 1: ?????c file .bib
bib <- ReadBib("sstt_reference.bib")

# B?????c 2: L???y toàn b??? các key (ID)
all_keys <- bib$key
cat("T???ng s??? entry:", length(all_keys), "\n")

# B?????c 3: Tìm key trùng
duplicated_keys <- all_keys[duplicated(all_keys)]

# B?????c 4: In ra danh sách key trùng (duy nh???t)
duplicated_keys_unique <- unique(duplicated_keys)

cat("Các key b??? trùng:\n")
print(duplicated_keys_unique)
