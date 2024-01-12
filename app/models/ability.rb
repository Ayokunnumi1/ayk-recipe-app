# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :destroy, Recipe, user_id: user.id
    can :destroy, Food, user_id: user.id

    return unless user.persisted?

    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id

    can :read, Recipe, is_public: true
    can :read, Food do |food|
      food.user_id == user.id  # Allow reading only if the food belongs to the user
    end
  end
end
