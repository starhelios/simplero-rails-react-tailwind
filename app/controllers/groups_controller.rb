class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :update, :destroy]
    before_action :authenticate_user!
   
    before_action do
        @current_user = current_user
    end

    def index
        
        # binding.pry
        # @group = Group.new
        user = current_user
        groups = Group
        type = params[:type]
        if type == 'owner'
            groups = groups.where(owner_id: user.id)
        elsif type == 'member'
            groups = user.groups
        end
        @groups = groups.where.not(access_level: 'secret').paginate(page: params[:page], per_page: 15)
        
    end

    def show
    end

    def create
        @group = Group.new(group_params)
        @group.owner_id = current_user.id
        @group.uuid = SecureRandom.uuid
        if @group.save
            redirect_to groups_path
        else
            redirect_back fallback_location: groups_path, flash:{errors: @group.errors.full_messages}
        end
    end

    def update
        if @group.update(group_params)
            render 'api/groups/show'
        else
            render json: { status: false, message: 'Unable to update group', errors: @group.errors.full_messages }
        end
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
        if params[:status] == true
            GroupMember.new(group_id: request.group_id, user_id: request.user_id, joining_date: DateTime.now)
            request.status = 'approved'
            request.save
        else
            request.status = 'rejected'
        end
        render json: { status: true, message: 'Request Updated!' }
    end

    def remove_member
        member = GroupMember.find(params[:membership_id]);
        member.destroy
        render json: { status: true, message: 'Memeber Removed from group!' }
    end

    private 

    def set_group
        @group = Group.find_by(uuid: params[:uuid])
    end

    def group_params
        params.permit(:name, :access_level)
    end

end