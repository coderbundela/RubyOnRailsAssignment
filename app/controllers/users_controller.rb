class UsersController < ApplicationController
  def index
    @users = User.all
    @total_users = @users.count
    liquid_template = Liquid::Template.parse(File.read(Rails.root.join('app', 'views', 'users', 'index.liquid')))
    @rendered_content = liquid_template.render('users' => @users.as_json,'users_count' => @total_users)
  end
  def search
    if params[:search].present?
      query = params[:search].downcase
      @users = User.where("LOWER(name->>'first') LIKE ? OR LOWER(name->>'last') LIKE ?", "%#{query}%", "%#{query}%")
    else
      @users = {}
    end
    @users_found= @users.count
    liquid_template = Liquid::Template.parse(File.read(Rails.root.join('app', 'views', 'users', 'search.liquid')))
    @rendered_content = liquid_template.render('users' => @users.as_json,'users_count' => @users_found,'query' =>params[:search].downcase)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      head :no_content
    else
      head :unprocessable_entity
    end
  end
end
