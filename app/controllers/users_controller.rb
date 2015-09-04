class UsersController < ApplicationController

  def validate
    user = User.find_by(params[:attribute]=>params[:value])
    respond_to do |format|
      if user
        format.json { render( json: {count: 1}.to_json) }
      else
        format.json { render( json: {count: 0}.to_json) }
      end
    end
  end

end
