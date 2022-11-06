WebTemplate::App.controllers :users, :provides => [:json] do
  post :create, :map => '/registrar' do
    # begin
    #   new_user = UserCreator.new(user_repo, self).create_user(user_params[:name]) # User.new(user_params[:name])
    #   status 201
    #   user_to_json new_user
    # rescue InvalidUser => e
    #   status 400
    #   {error: e.message}.to_json
    # end
    status 201
  end
end
