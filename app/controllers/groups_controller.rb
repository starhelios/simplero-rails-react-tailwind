class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :update, :destroy]

    def index

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

        @group.uuid = SecureRandom.uuid

        if @group.save
            render 'api/groups/show'
        else
            render json: { status: false, message: 'Unable to create group', errors: @group.errors.full_messages }
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
        render json: { status: true, message: 'Group Deleted!' }
    end

    def request_to_join
        group = Group.find(params[:group_id]);
        if(group.access_level == 'public')
            GroupMember.new(group_id: params[:group_id], user_id: params[:user_id], joining_date: DateTime.now)
        else
            JoiningRequest.new(group_id: params[:group_id], user_id: params[:user_id], status: 'pending')
        end
        render json: { status: true, message: 'Your request has been submitted!' }
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
        params.require(:group).permit(:name, :access_level, :owner_id)
    end

end