First forms ...

Senario A:  verifying a specific target
  def not_authorized_as?(subject)
    raise Pundit::NotAuthorizedError unless subject
  end

Senario B:  just practicing good abstraction  
  def not_authorized_user
    raise Pundit::NotAuthorizedError
  end
  
Second form of abstraction ...

Senario A:
  def not_authorized_as?(subject)
    not_authorized unless subject
  end

Senario B:  
  def not_authorized(subject = "Pundit")
    (subject + "::NotAuthorizedError").constantize
  end
  