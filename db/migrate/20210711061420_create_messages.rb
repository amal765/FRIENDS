# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.bigint :sender_id, index: true
      t.bigint :reciever_id, index: true
      t.datetime :created_at
      t.datetime :seen_at
      t.datetime :read_at
    end
  end
end
