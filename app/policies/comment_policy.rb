class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.author? || user.editor? if user.present?
  end

  def update?
    if user.present?
      return true if user.editor?
      user.id == comment.author_id
    end
  end

  def destroy?
    if user.present?
      return true if user.editor?
      user.id == comment.author_id
    end
  end

  def publish?
    user.editor? if user.present?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
      scope.all
    elsif user.present? && user.author?
      scope.where(:author_id => user.id) | scope.published
    else
      scope.where(:published => true)
    end
    end
  end
end
