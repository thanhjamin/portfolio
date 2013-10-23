class RemarkPolicy < ApplicationPolicy
  attr_reader :user, :remark

  def initialize(user, remark)
    @user = user
    @remark = remark
  end

  def create?
    if user.present?
      user.author? || user.editor?
    end
  end

  alias_method :update?, :create?
  alias_method :destroy?, :create?
  alias_method :approved?, :create?

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && (user.author? || user.editor?)
        scope.all
      else
        scope.where(:approved => true)
      end
    end
  end
end
