class PrList < ApplicationRecord
  has_many :pr_items
  belongs_to :user



  def percent_complete
    return 0 if total_items == 0
    ( 100 * completed_items.to_f / total_items).round(1)
  end



  def completed_items
    @completed_items ||= pr_items.completed.count

  end

  def total_items
    @total_items ||= pr_items.count
  end
end
