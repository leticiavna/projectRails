json.extract! report, :id, :title, :content, :category_id, :user_id, :created_at, :updated_at
json.url report_url(report, format: :json)
