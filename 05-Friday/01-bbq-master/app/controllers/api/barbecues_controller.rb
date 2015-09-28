class Api::BarbecuesController < ApplicationController

  def show
    barbecue = Barbecue.find(params[:id])
    users = Barbecue.find(params[:id]).users
    items = Barbecue.find(params[:id]).items
    render json: { barbecue: barbecue, users: users, items: items }
  end
  
  def join
    barbecue = Barbecue.find(params[:id])
    barbecue.users.push(current_user)
    barbecue.save
    render json: barbecue # not used
  end

  def addItem
    barbecue = Barbecue.find(params[:id])
    barbecue.items.create(name: params[:input])
    render json: barbecue # not used
  end

end
