module SessionsHelper
  # Logs in the given user.
  def log_in(client)
    session[:client_id] = client.id
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_client.nil?
  end

  # Returns the current logged-in user (if any).
  def current_client
    @current_client ||= Client.find_by(id: session[:client_id])
  end

  # Returns true if the given user is the current user.
  def current_client?(client)
    client == current_client
  end

  # Logs out the current user.
  def log_out
    session.delete(:client_id)
    @current_client = nil
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

end
