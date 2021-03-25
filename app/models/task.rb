class Task < ApplicationRecord
  belongs_to :user
   scope :unfinish, -> {where(finishment: false)}
   #タスク完了ボタンの際使う
  def next_procedure_content
      self.procedures.each do |procedure|
          unless procedure.find_by(finishment: false)
              return procedure.content
          end
      end
  end
  
  def next_procedure_content
      self.procedures.each do |procedure|
          unless procedure.find_by(finishment: false)
              return procedure.date
          end
      end
  end
  
   def change_status  #タスクを完了にする
     self.finishment = true
   end
end
