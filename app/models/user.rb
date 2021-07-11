# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recieved_messages, class_name: 'Message', foreign_key: 'reciever_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  def unread_messages
    recieved_messages.where(read_at: nil)
  end
end
