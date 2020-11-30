class Integer
  # 数字に3桁区切りのカンマを入れる
  def number_with_separator
    return self.to_s.gsub(/(\d)(?=\d{3}+$)/, '\\1,')
  end
end