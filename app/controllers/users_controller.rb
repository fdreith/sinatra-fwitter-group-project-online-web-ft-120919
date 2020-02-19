class UsersController < ApplicationController

    get '/signup' do 
        if logged_in?
          redirect to '/tweets'
        else
            erb :'users/signup'
        end
    end
    
    post '/signup' do 
        user = User.create(username: params["username"], email: params["email"], password: params["password"])
        if user.save
          session[:user_id]=user.id
          redirect to '/tweets'
        else 
          redirect to '/signup'
        end
    end

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do 
        user = User.find_by(username: params["user"][":username"].strip)
        if user && user.authenticate(params["user"][":password"])
            session[:user_id]=user.id
            redirect to "/tweets"
        else
            redirect to '/login'
        end
    end


end
