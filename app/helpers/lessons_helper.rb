module LessonsHelper
  def not_owner(lesson)
     if current_user
        lesson.user == current_user ? false : true
     else
       true
     end
  end
end
