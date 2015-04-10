module SessionsHelper
  # Logs in the given user.
  def log_in(client)
    session[:client_id] = client.id
  end

  # Returns the current logged-in user (if any).
  def current_client
    @current_client ||= Client.find_by(id: session[:client_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_client.nil?
  end


  # Logs out the current user.
  def log_out
    session.delete(:client_id)
    @current_client = nil
  end

end
