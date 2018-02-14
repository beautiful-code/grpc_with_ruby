# frozen_string_literal: true

class CreateStudentsDetails < ActiveRecord::Migration[5.1]
  def change
    create_table(:students) do |t|
      t.column :name, :string
      t.column :age, :int
      t.column :deleted_at, :datetime

      t.timestamps
    end
  end
end
