class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :read, :all
      can :manage, [Word, Lesson, Caterory]
      can [:edit, :update, :destroy], User do |other_user|
        user != other_user
      end
    else
      can [:read, :create], Lesson
      can :update, Lesson do |lesson|
        lesson.user == user
      end
      can :read, [Word, Caterory, User]
      can :update, User do |current_user|
        current_user == user
      end
    end
  end
end
