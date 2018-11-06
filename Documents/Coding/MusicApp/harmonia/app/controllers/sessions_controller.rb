class SessionsController < ApplicationController

QUIPS = [
  "thy knave!",
  "ye blackguard!",
  "ya wascally wabbit!",
  "silly!",
  "dude!",
  "you dun goofed!",
  "have an iced herbal tea and try again.",
  "do not pass GO, do not collect $200",
  "YOU SHALL NOT PASS!!",
  "request denied.",
  "you are the weakest link..goodbye!",
  "easter egg message!",
  ", i spent an entire day working on this and this is the thanks I get?"
]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid credentials, #{QUIPS.sample}"]
      render :new
    end


  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
