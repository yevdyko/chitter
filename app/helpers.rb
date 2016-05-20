module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def format_time(creation_date)
    Time.parse(creation_date.to_s).ago.to_words
  end

end
