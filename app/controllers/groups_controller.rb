class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :update, :destroy]
    before_action :authenticate_user!
   
    def index
        groups = Group
        type = params[:type]
        if type == 'owner'
            groups = groups.where(owner_id: current_user.id)
        elsif type == 'member'
            groups = current_user.groups
        end
        @groups = groups.where.not(access_level: 'secret').paginate(page: params[:page], per_page: 15)
    end

    def show
        @is_admin = current_user.id == @group.owner_id
        @is_member = @is_admin || GroupMember.find_by(user_id: current_user.id, group_id: @group.id) ? true : false
        if !@is_member
            redirect_to groups_path, flash:{errors: ['You need to join the group'], title: 'Access Denied'}
        end
        @post = Post.new
    end

    def create
        @group = Group.new(group_params)
        @group.owner_id = current_user.id
        @group.uuid = SecureRandom.uuid
        if @group.save
            GroupMember.create(group_id: @group.id, user_id: current_user.id, joining_date: DateTime.now)
            redirect_to groups_path
        else
            redirect_back fallback_location: groups_path, flash:{errors: @group.errors.full_messages}
        end
    end

    def update
        errors = []
        
        
        @group = Group.find(params[:id])
        if !@group.update(group_params)
            errors =  @group.errors.full_messages
            render json: { status: false, message: 'Unable to update group', errors: @group.errors.full_messages }
        end
        redirect_back fallback_location: group_path(uuid: @group.uuid), flash:{errors: errors}
    end

    def destroy
        @group.destroy
        redirect_back fallback_location: groups_path
    end

    def request_to_join
        group = Group.find(params[:group_id]);
        if(group.access_level == 'public')
            GroupMember.create(group_id: params[:group_id], user_id: params[:user_id], joining_date: DateTime.now)
        else
            JoiningRequest.create(group_id: params[:group_id], user_id: params[:user_id], status: 'pending')
        end
        redirect_back fallback_location: groups_path
    end

    def approve_or_reject_request
        request = JoiningRequest.find(params[:request_id]);
        if to_boolean(params[:status]) == true
            GroupMember.create(group_id: request.group_id, user_id: request.user_id, joining_date: DateTime.now)
            request.status = 'approved'
        else
            request.status = 'rejected'
        end
        request.save
        redirect_back fallback_location: group_path(uuid: request.group.uuid)
    end

    def remove_member
        member = GroupMember.find(params[:membership_id]);
        member.destroy
        redirect_back fallback_location: group_path(uuid: member.group.uuid)
    end

    private 

    def set_group
        @group = Group.find_by(uuid: params[:uuid])
    end

    def group_params
        params.require(:group).permit(:name, :access_level)
    end

    def to_boolean(str)
        str.downcase == 'true'
      end

end