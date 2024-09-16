class AllowNullUserIdInPlannerViews < ActiveRecord::Migration[7.1]
  def change
    change_column_null :planner_views, :user_id, true
  end
end
