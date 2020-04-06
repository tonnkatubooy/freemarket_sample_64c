# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # GET /resource/sign_up
  #1ページ目
  def new
    @user = User.new
  end

  # POST /resource
  #1ページ目post
  def create
    session[:nickname] = params[:user][:nickname]
    session[:first_name] = params[:user][:first_name]
    session[:last_name] = params[:user][:last_name]
    session[:first_name_kana] = params[:user][:first_name_kana]
    session[:last_name_kana] = params[:user][:last_name_kana]
    session[:birthday] = birthday_join
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    # session[:phone_number] = params[:user][:phone_number]
    @user = User.new(
      nickname: session[:nickname],
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_name_kana: session[:first_name_kana],
      last_name_kana: session[:last_name_kana],
      birthday: session[:birthday],
      email: session[:email],
      # phone_number: session[:phone_number]
    )
    #SNSで登録する場合
    if session[:provider].present? && session[:uid].present?
      # パスワードは自動生成する
      password = Devise.friendly_token.first(7)
      @user.password = password
      session[:password] = password
    #メールアドレスで登録する場合
    else
      @user.password = session[:password]
    end
    @phone = @user.phone_number
    # バリデーションチェック
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    render :new_phone
  end

  #2ページ目post
  def create_phone
    @user = User.create(
      nickname: session[:nickname],
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_name_kana: session[:first_name_kana],
      last_name_kana: session[:last_name_kana],
      birthday: session[:birthday],
      email: session[:email],
      password: session[:password]
    )
    @phone = Phone.new(phone_params)
    unless @phone.valid?
      flash.now[:alert] = @phone.errors.full_messages
      render :new_phone and return
    end
    @phone.save
    if session[:provider].present? && session[:uid].present?
      @sns = SnsCredential.create(
        user_id: @user.id,
        uid: session[:uid],
        provider: session[:provider]
      )
    end
    sign_in(:user, @user)
  end

  protected

  def phone_params
    params.require(:user).permit(:phone_number).merge(user_id: @user.id)
  end

  #birthdayのパラメータをData型として生成する。
  def birthday_join
    params[:user][:last_name_kana] = Date.new(
      params[:user]["birthday(1i)"].to_i,
      params[:user]["birthday(2i)"].to_i,
      params[:user]["birthday(3i)"].to_i
    )
  end



end
