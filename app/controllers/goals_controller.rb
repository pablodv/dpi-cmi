class GoalsController < ApplicationController
  unloadable

  before_filter :find_project, :authorize, :only => :index

  def index
    tracker = Tracker.where(name: "Goal").first
    @values  = tracker.custom_fields.where(name: "Kind of goal").first.try(:possible_values)

    @goals = @values.map{ |v| CustomValue.where(value: v).map(&:customized) }
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end
end
