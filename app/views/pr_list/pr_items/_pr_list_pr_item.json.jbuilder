json.extract! pr_list_pr_item, :id, :description, :completed, :completed_at, :pr_list_id, :created_at, :updated_at
json.url pr_list_pr_item_url(pr_list_pr_item, format: :json)
