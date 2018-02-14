# frozen_string_literal: true

class AddVersionsForPaperTrail < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.string   :item_type
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: 4_294_967_295
      t.text     :object_changes, limit: 4_294_967_295

      t.timestamps
    end

    add_index :versions, %i[item_type item_id]
  end
end
