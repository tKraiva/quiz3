# frozen_string_literal: true

class Ability
  include CanCan::Ability


  def initialize(user)
    
      user ||= User.new # guest user (not logged in)
    
    if user.is_admin?
      can :manage, :all
    end
    alias_action :create, :read, :update, :destroy, to: :crud
   
    can(:crud, Auction) do |auction|
      auction.user == user
    end
   
    can(:crud, Bid) do |bid|
      bid.user == user

    end
    

  end
end
