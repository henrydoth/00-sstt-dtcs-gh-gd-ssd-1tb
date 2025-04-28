# Sau khi knit xong Rmd bằng officedown, chạy đoạn này để áp dụng template Word

library(officer)

# Đọc template Word
template_doc <- read_docx("sstt_dtcs_quato_words_input.docx")

# Đọc nội dung kết quả đã knit (giả sử tên là: sstt_dtcs_flextable_vn.docx)
# Bạn cần đổi tên file này đúng theo file đầu ra từ knit
knit_doc <- read_docx("sstt_dtcs_flextable_vn.docx")

# Chuyển toàn bộ nội dung từ file knit sang template
# Cách đơn giản: dán body của file knit vào template
for (i in seq_len(length(knit_doc))) {
  block <- block_list(knit_doc)[[i]]
  template_doc <- body_add(template_doc, block, pos = "beforeEnd")
}

# Lưu file kết quả hoàn chỉnh với template
print(template_doc, target = "baocao_voi_template.docx")