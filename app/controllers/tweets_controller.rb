class TweetsController < ApplicationController

    get '/tweets' do 
        if logged_in?
            erb :'tweets/index'
        else 
            redirect to '/login'
        end
    end

    get '/tweets/new' do 
        erb :'tweets/new'
    end

    post '/tweets' do 
    end


end
