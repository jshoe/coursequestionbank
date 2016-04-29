class AddDefaultValueToUid < ActiveRecord::Migration
  def change
    change_column :problems, :uuid, :string, :default => SecureRandom.uuid
  end
end
