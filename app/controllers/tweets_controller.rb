class TweetsController < ApplicationController

    get '/tweets' do 
        @tweets = Tweet.all
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
        @tweet = Tweet.create(content: params["content"], user_id: current_user.id)
    end

    get '/tweets/:id' do

        erb :'tweets/show'
    end 

    get '/tweets/:id/edit' do
        
        erb :'tweets/edit'
    end 


end
