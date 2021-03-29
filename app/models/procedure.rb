class Procedure < ApplicationRecord
  belongs_to :task
  
  #validatesを設定する必要あり
  
  def check_finishment
      if self.finishment == true
         return  "完了"
      else
         return "未完了"
      end
  end
  
end
