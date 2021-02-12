class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :shopping_cart ,if: :current_user
    around_action :switch_locale
    # rescue_from CanCan::AccessDenied do |exception|
    #   respond_to do |format|
    #     format.json { head :forbidden }
    #     format.html { redirect_to main_app.root_url, :alert => exception.message }
    #   end
    # end

    protected

    def switch_locale(&action)
      if request.path_info.include?('en')
        locale = 'en'
      else
        locale = I18n.default_locale
      end
      I18n.with_locale(locale, &action)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :gender, :nationality, :mobile])
    end

    def shopping_cart
      @book_trips = BookTrip.where(user_id: current_user.id)
      puts @book_trips.inspect
    end
end
