# frozen_string_literal: true

# AddCreatorRefToUsers
class AddCreatorRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :creator, foreign_key: true
  end
end
