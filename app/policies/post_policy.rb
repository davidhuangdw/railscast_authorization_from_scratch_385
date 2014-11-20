class PostPolicy < ApplicationPolicy
  allow %w{index show}

  allow :new do
    user.present?
  end

  allow %w{create edit update destroy} do
    user.try(:admin?)
  end
end
