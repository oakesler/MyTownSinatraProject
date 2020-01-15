class PostsController < ApplicationController
  
  get '/posts' do
    "you are logged in as #{session[:email]}"