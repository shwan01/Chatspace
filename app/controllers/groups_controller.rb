class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create
  end
end
