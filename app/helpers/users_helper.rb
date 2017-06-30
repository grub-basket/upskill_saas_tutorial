module UsersHelper
  def job_title_icon
    if @user.profile.job_title == "Developer"
      "<i class='fa fa-code'></i>".html_safe
      # quotes, [empty] icon tag, inside the class, type "fa" and the icon name from font awesome, then secure what's in the quotes with .html_safe.
    elsif @user.profile.job_title == "Entreprenuer"
      # notice how "elsif" lacks a second 'e'
      "<i class='fa fa-lightbulb-o'></i>".html_safe
    elsif @user.profile.job_title == "Investor"
      "<i class='fa fa-dollar'></i>".html_safe
    end
  end
end