class PrItem < ApplicationRecord
  belongs_to :pr_list

  scope :completed, -> do 
    where(completed: true)
  end
    

end
