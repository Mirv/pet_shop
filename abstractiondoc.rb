###
###  Current (4th) abstraction
###

# Senario A: verifying a specific target
  def not_authorized_as?(subject)
    not_authorized unless subject
  end

# Senario B:  just practicing good abstraction   
  def userAdminMod?
   owner_check? || admin? || moderator? 
  end
  
  def authorize_or_error?
    not_authorized unless userAdminMod?
  end
  
  #  Could probably skip - might help with decoupling
  def not_authorized
    not_authorized_error
  end

  def not_authorized_error(subject = "Pundit")
    (subject + "::NotAuthorizedError").constantize
  end


###
###  first level of abstraction
###

# Senario A:  verifying a specific target
  def not_authorized_as?(subject)
    raise Pundit::NotAuthorizedError unless subject
  end

# Senario B:  just practicing good abstraction  
  def not_authorized_user
    raise Pundit::NotAuthorizedError
  end
  
###
###  second level of abstraction
###

# Senario A:
  def not_authorized_as?(subject)
    not_authorized unless subject
  end

# Senario B:  
  def not_authorized(subject = "Pundit")
    (subject + "::NotAuthorizedError").constantize
  end
  
###
###  Third level of abstraction
###

# Senario A:
  def not_authorized_as?(subject)
    not_authorized unless subject
  end

  #  Note, once I raise an error, this code no longer works in scope
  #  ... section & this leads me to believe there is one more abstraction
  def userAdminMod?
   not_authorized unless owner_check? || admin? || moderator? 
  end
  
  def not_authorized
    not_authorized_error
  end

  def not_authorized_error(subject = "Pundit")
    (subject + "::NotAuthorizedError").constantize
  end

###
###  Fourth abstraction
###

# Senario A:
  def not_authorized_as?(subject)
    not_authorized unless subject
  end

# Senario B:  
  def userAdminMod?
   owner_check? || admin? || moderator? 
  end
  
  def authorize_or_error?
    not_authorized unless userAdminMod?
  end
  
  #  Could probably skip - might help with decoupling
  def not_authorized
    not_authorized_error
  end

  def not_authorized_error(subject = "Pundit")
    (subject + "::NotAuthorizedError").constantize
  end