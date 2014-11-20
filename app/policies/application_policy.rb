class ApplicationPolicy
  attr_reader :user, :record
  def initialize(user,record)
    @user = user
    @record = record
  end

  def self.allow(actions, &condition)
    condition ||= ->{true}
    Array(actions).each do |action|
      define_method(action,&condition)
    end
  end

  def self.disallow(actions)
    allow(actions){false}
  end

  disallow %w[index show new create edit update destroy]
end
