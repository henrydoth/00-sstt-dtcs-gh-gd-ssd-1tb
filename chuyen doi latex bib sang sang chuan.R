# ???? Các hàm c???n
convert_latex_to_unicode <- function(text) {
  text <- gsub("\\{\\\\u ([aeiouyAEIOUY])\\}", "\u0306\\1", text, perl = TRUE)  # d???u ?? â ê ô ?? ??
  text <- gsub("\\{\\\\'([aeiouyAEIOUY])\\}", "\u0301\\1", text, perl = TRUE)   # d???u s???c
  text <- gsub("\\{\\\\`([aeiouyAEIOUY])\\}", "\u0300\\1", text, perl = TRUE)   # d???u huy???n
  text <- gsub("\\{\\\\~([aeiounAEIOUN])\\}", "\u0303\\1", text, perl = TRUE)   # d???u ngã
  text <- gsub("\\{\\\\\\^([aeiouAEIOU])\\}", "\u0302\\1", text, perl = TRUE)   # d???u m??
  text <- gsub("\\{\\\\\\.([aeiouAEIOU])\\}", "\u0307\\1", text, perl = TRUE)   # d???u n???ng
  text <- gsub("\\{\\\\a\\'([aeiou])\\}", "\u1EA1\\1", text, perl = TRUE)       # ch??? ???
  text <- gsub("\\{\\\\DJ\\}", "??", text, perl = TRUE)                           # ch??? ??
  text <- gsub("\\{\\\\dj\\}", "??", text, perl = TRUE)                           # ch??? ??
  text <- gsub("\\{([^\\}]*)\\}", "\\1", text, perl = TRUE)                      # b??? d???u {}
  return(text)
}

# ???? Hàm ?????c file, x??? lý, ghi l???i
convert_bib_latex_to_unicode <- function(input_bib, output_bib) {
  # ?????c file g???c
  bib_lines <- readLines(input_bib, encoding = "UTF-8")
  
  # Áp d???ng chuy???n ?????i
  bib_cleaned <- sapply(bib_lines, convert_latex_to_unicode)
  
  # Ghi file m???i
  writeLines(bib_cleaned, output_bib, useBytes = TRUE)
  
  cat("??? Chuy???n ?????i thành công! File m???i:", output_bib, "\n")
}

# ???? G???i hàm:
convert_bib_latex_to_unicode("sstt_reference.bib", "sstt_reference_clean.bib")
