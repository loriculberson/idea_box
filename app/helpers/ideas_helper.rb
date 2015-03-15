module IdeasHelper

  def ideas_header
    if current_user.admin? 
      "Admin Dashboard" 
    else 
      "Welcome to #{current_user.username}'s Ideas"
    end 
  end
end
