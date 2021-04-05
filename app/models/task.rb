class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  belongs_to :user
  has_many :procedures
  scope :unfinish, -> {where(finishment: false).order(created_at: :desc)}
   #タスク完了ボタンの際使う
  def next_procedure_content
      
      @procedure = self.procedures.find_by(finishment: false)
      
      if @procedure
          return @procedure.content
      else
          puts "次の工程はありません"
      end
    
  end
  
  def favorite_status
      if self.favorite == true
          puts "お気に入り登録済み"
      else
          puts "お気に入り未登録"
      end
  end
  
  def next_procedure_date
      @procedure = self.procedures.find_by(finishment: false)
      
      if @procedure
          return @procedure.deadline
      else
          puts "次の工程はありません"
      end
  end
  
   def change_status  #タスクを完了にする
     self.finishment = true
   end
end
