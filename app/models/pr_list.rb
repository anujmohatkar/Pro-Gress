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

  def status
    case percent_complete.to_i
    when 0
      'Not Started'
    when 100
      'Finished'
    else
      'In Production'
    end
  end

  def badge_color
    case percent_complete.to_i
    when 0
      'warning'
    when 100
      'success'
    else
      'primary'
    end
  end
end
