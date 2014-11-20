class TopicPolicy < ApplicationPolicy
  allow %w{index show}

  allow :new do
    user.present?
  end

  allow %w{create edit update destroy} do
    user && (user.admin? || user == record.try(:user))
  end
end
