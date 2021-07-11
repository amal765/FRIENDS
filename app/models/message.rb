# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :reciever, class_name: 'User', foreign_key: 'reciever_id'

  delegate :name, to: :sender, prefix: :sender
end
