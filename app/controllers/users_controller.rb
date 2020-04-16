#users_controller.rb
class UsersController < ApplicationController
  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    response_text = "New user created with user ID #{new_user.id}"
    render plain: response_text
  end
end
