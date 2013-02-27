namespace :cmi do
  desc 'Create CMI needed custom tracker'
  task :create_tracker => :environment do
    Tracker.find_or_create_by_name(
      name: "Goal",
      is_in_roadmap: 1,
      core_fields: ["assigned_to_id", "category_id", "fixed_version_id", "parent_issue_id",
        "start_date", "due_date", "estimated_hours", "done_ratio", ""]
    )
  end

  desc 'Create CMI needed kind of goal'
  task :create_goal_kind => :environment do
    if tracker = Tracker.where(:name => "Goal").first
      params = {
        name: "Kind of goal",
        field_format: "list",
        multiple: false,
        searchable: false,
        default_value: "",
        is_required: true, is_for_all: true, is_filter: false,
        possible_values: "Financiera\r\nClientes\r\nProcesos\r\nAprendizaje y Crecimiento",
        tracker_ids: [tracker.id]
      }

      CustomField.new_subclass_instance("IssueCustomField", params).save
    end
  end
end
