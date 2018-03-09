class EditCatRentalRequests < ActiveRecord::Migration[5.1]
  def change
    change_column :cat_rental_requests, :status, :string, default: 'Pending', null: false
  end
end
