class TagsController < ApplicationController
  def show
    tag_name = params[:name].to_sym
    tag_id = Tag::TAG_NAMES[tag_name].to_i
    @tag = Tag.find(tag_id)
  end
end
