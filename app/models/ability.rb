class Ability 
  include CanCan::Ability

  def initialize(current_user)
    current_user ||= User.new
    can :view, User, id: current_user.id
    if current_user.admin?
      can :view, :all
    end
  end
end