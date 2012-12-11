class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_lang
  before_filter :require_login
  
  def set_lang
    if params[:lang] && get_available_locales.include?(params[:lang].to_sym)
      lang = params[:lang]
      I18n.locale = lang
      session[:lang] = lang
    elsif session[:lang] && get_available_locales.include?(session[:lang].to_sym)
      I18n.locale = session[:lang] 
    else
      set_locale
    end
  end

  def logged_in?
    session[:user_id] != nil 
  end

  def current_user
    if logged_in?
      @usu = User.find session[:user_id]
    end
  end

  helper_method :logged_in?
  helper_method :current_user
  
  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be member to access this section"
      redirect_to root_url 
    end
  end  
  
  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.locale = get_available_locales.include?(extract_locale.to_sym) ? extract_locale : I18n.default_locale
  end

  def extract_locale
    request.env['HTTP_ACCEPT_LANGUAGE'] != nil ? request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first : I18n.default_locale
  end
  
  def get_available_locales
    I18n.available_locales
  end
  
end