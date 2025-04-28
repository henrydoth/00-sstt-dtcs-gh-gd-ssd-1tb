library(tidyverse)
library(officer)

read_docx() |> 
  
  body_add_par("Table of Contents", style = "heading 1") |> 
  body_add_toc(level = 2) |> 
  body_add_par("Table of figures", style = "heading 1") |> 
  body_add_toc(style = "Image Caption") |> 
  body_add_par("Table of tables", style = "heading 1") |> 
  body_add_toc(style = "Table Caption") |>




  body_add_par(value = "BÁO CÁO TÓM TẮT NGHIÊN CỨU", style = "Normal") |> 
  body_add_par(value = "BS.CK2 Đỗ Thanh Liêm", style = "centered") |> 
  
  
  body_add_par(value = "Tổng quan về suy giảm nhận thức và bệnh sa sút trí tuệ, vai trò của test thần kinh nhận thức.", style = "heading 1") |> 
  body_add_par(value = "Vai trò của phân tích test thần kinh nhận thức.", style = "heading 2") |> 
  body_add_par(value = "Các nghiên cứu trong nước liên quan ", style = "heading 3") |> 
  
  body_add_par(value = "Báo cáo tiến độ ", style = "heading 3") |>  
  body_add_img("i1.png", height = 3, width = 4.39, style = "centered") |>
  
  
  
  print(target = "sstt_dtcs_2025.docx")