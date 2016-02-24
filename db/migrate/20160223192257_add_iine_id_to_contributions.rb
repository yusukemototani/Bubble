class AddIineIdToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :iine, :integer, default: 0
  end
end
