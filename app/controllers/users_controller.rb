class UsersController < ApplicationController

    get '/signup' do 
        if !logged_in?
            erb :'users/create_user'
        else
            redirect to '/tweets'
        end
    end
    
    post '/signup' do 
        if params["username"] == "" || params["email"] == "" || params["password"] == ""
            redirect to '/signup'
        else 
            user = User.create(username: params["username"], email: params["email"], password: params["password"])
            session[:user_id]=user.id
            redirect to '/tweets'
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
