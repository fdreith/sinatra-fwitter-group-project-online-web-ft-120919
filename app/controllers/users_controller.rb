class UsersController < ApplicationController

    get '/signup' do 
        if !logged_in?
            erb :'users/create_user'
        else
            redirect to '/tweets'
        end
    end
    
    post '/signup' do 
        if logged_in?
            redirect to '/tweets'
        else
            if params["username"] == "" || params["email"] == "" || params["password"] == ""
                redirect to '/signup'
            else 
                user = User.create(username: params["username"], email: params["email"], password: params["password"])
                session[:user_id]=user.id
                redirect to '/tweets'
            end
        end
    end

    get '/login' do 
        if logged_in?
            redirect to '/tweets'
        else
            erb :'users/login'
        end
    end

    post '/login' do 
        user = User.find_by(username: params["username"])
        if user && user.authenticate(params["password"])
            session[:user_id]=user.id
            redirect to '/tweets'
            # erb :'tweets/index'
        else
            redirect to '/login'
        end
        
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect to '/login'
        else 
            redirect to '/'
        end
    end

end
