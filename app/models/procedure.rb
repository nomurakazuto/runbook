class Procedure < ApplicationRecord
  belongs_to :task
  
  #validatesを設定する必要あり
  
  def check_finishment
      if self.finishment == true
          puts "完了"
      else
          puts "未完了"
      end
  end
  
end
