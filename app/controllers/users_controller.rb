class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :other_users, :conversations]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /others/1
  # returns an array of users that the current user hasn't swiped right (liked) yet
  def other_users
    @remaining_users = User.all - @user.likes

    render json: @remaining_users
  end

  def conversations

    recipient_convos = @user.recipient_conversations.map do |recipient_convo|
      {
        user: UserSerializer.new(User.find(recipient_convo.user_b_id)),
        messages: recipient_convo.messages
      }
    end

    render json: recipient_convos
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /signup
  def create
    @user = User.new(user_params)

    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: token}, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /login
  def log_in
    @user = User.find_by(email: params[:email])
    # if user exist & password is correct,
    # then encrypt the userID and return it in a key 'jwt' along with the User Object
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: token}, status: :accepted
    else
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end
  end

  # PATCH/PUT /users/1
  def update
    # Finds the personality and returns a random character based on the users gender
    personality_name = params[:personality].upcase
    @personality = Personality.find_by(title: personality_name)
    @character_list_by_gender = nil

    if params[:gender].upcase == "OTHER"
      @character_list_by_gender = @personality.characters
    else
      @character_list_by_gender = @personality.characters.select { |character| character.gender.upcase == params[:gender].upcase }
    end
    @random_character = @character_list_by_gender.sample

    if @user.update(character: @random_character)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :gender, :preference, :username, :age, :character_id)
    end
end
