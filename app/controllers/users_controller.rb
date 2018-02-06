class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
     flash[:danger] = 'vilain garnement ... tu vas finir par te faire taper sur les doigts !'
     redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     if @user.save
     log_in @user
      flash[:success] = "Bienvenue dans l'app Secrete Moussaillon!"
      redirect_to @user
         else
       render 'new'
     end
  end

   private

     def user_params
       params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
     end

     def edit
        @user = User.find(params[:id])
     end

     def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to root_url
     end

end
