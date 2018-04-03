class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user.user_detail
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def new?
    create?
  end

  def create?
    user
  end

  def edit?
    update?
  end
  
  def update?
    false
  end

  def destroy?
    false
  end

  def admin?
    user.admin
  end

  def userAdmin?
    if owner_check? || admin? 
      true
    else
      not_authorized
    end
  end

  def not_authorized_as?(subject)
    not_authorized unless subject
  end

  def not_authorized
    raise not_authorized_error
  end

  def not_authorized_error(subject = "Pundit")
    (subject + "::NotAuthorizedError").constantize
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end