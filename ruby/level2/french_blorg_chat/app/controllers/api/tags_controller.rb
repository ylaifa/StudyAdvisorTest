class Api::TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:name])
    respond_to do |format|
      format.json { render json: @tag.to_json, status: :ok }
    end
  end
end