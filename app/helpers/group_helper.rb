module GroupHelper
    def update_last_activity(group_id)
        group = Group.find(group_id)
        group.update(last_activity: DateTime.now)
        group.save
    end
end
