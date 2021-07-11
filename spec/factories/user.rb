FactoryBot.define do
  factory :user do |f|
  	role
  	f.sequence (:email) { |n| "user#{n}@example.com" }
  	f.password { 'password' }
  	f.password_confirmation { 'password' }
  end
end
