class SessionsController < ApplicationController

  def new
  end
  # create a new session when input login and password matches user record
  def create
    @user = User.find_by_login(params[:session][:login])
    if @user && (params[:session][:password]) == @user.password.to_s
      session[:user_id] = @user.id
      redirect_to apps_path
    else
      render 'new'  # stay in login page if not matched
    end
  end

  # destoy current session when called
  def destroy
    session.delete(:user_id)
    render 'new'
  end

  def signup
    @user = User.new
  end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

  def create_user
    #取出哈希param中的name、email等元素
    login = params[:user][:login]
    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]
    userexist = User.find_by(login:login)
    @user = User.new
    #先判断name、email是否为空
    if login.blank?
      flash.notice = "username or email can't be blank"
      render :signup
    elsif userexist
      flash.notice = "user is already registered"
      render :signup
      #判断名字的长度是否大于10
      #判断密码和确认密码是否一致
    elsif password != password_confirmation
      flash.notice = "password inconsistence"
      render :signup
      #上面条件全部不符合，会进入else语句，将填写的信息保存到数据中
    else
      @user.login = login
      @user.password = password
      #.save保存成功时，返回true，失败时返回false
      boolean = @user.save
      if boolean
        flash.notice = "register successful"
        redirect_to :login #注册成功，将页面重定向到登录页面
      else
        flash.notice = "register failed"
        render :signup
      end
    end
  end


  def create_login
    #从params中取email、password的值
    #strip是去除字符串头部和尾部的空格的方法
    login = params[:login]
    password = params[:password]
    #通过email查找用户
    user = User.find_by(login:login)
    session[:user_id] = user.id
    if user
      if user.password == passwor
      redirect_to '/apps/index'
      else
        render :login
      end
    else
      render :login
    end
    # #如果用户存在，进行下面判断
    # if user
    #   #用户的身份为管理员，状态为激活，密码正确，可以登录成功
    #   if user.password == password
    #     redirect_to '/apps/index'
    #   else
    #     render :login
    #   end
    #   #如果用户不存在，需要提示用户去注册
    # else
    #   flash.notice = "No user found, Sigh up"
    #   render :login
    # end
  end

end
