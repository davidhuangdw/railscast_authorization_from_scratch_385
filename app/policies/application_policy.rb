class ApplicationPolicy
  attr_reader :user, :record
  def initialize(user,record)
    @user = user
    @record = record
  end

  %w[index new create edit update destroy].each do |action|
    define_method(action){false}
  end

  def self.allow(actions, &condition)
    condition ||= ->{true}
    Array(actions).each do |action|
      define_method(action,&condition)
    end
  end

end
