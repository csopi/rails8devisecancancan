class Ability
  include CanCan::Ability

  def initialize(user)
    def initialize(user)
      if user.admin?
        can :manage, :all
      end
    end
  end
end
