class Task < ApplicationRecord
  
  #新規カラム追加 -status presenceは指定された属性が空でないことを確認する
  #空白を許さず、10文字以下を許容する
  validates :status,presence: true, length:{maximum:10}
end
