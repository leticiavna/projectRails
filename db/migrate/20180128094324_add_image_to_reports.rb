class AddImageToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :image, :string
  end
end
