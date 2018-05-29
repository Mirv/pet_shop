class ApplicationPolicy
  include Pundit
  attr_reader :user, :record

  def initialize(user, record)
    # raise NoUserProvidedError, "must be logged in" unless user
    raise Pundit::NotAuthorizedError, 
      "AppPolicy: must be logged in - No user supplied or it was invalid user/pass" unless user
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
      # @user = user.user_detail
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
    
    def resolve_admin
      scope
    end

  end

  class NoUserProvidedError < Pundit::NotAuthorizedError 
    def initialize(options = {})
      super
    end
  end

end