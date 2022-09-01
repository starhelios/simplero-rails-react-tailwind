class Api::V1::GroupsController < ApplicationController
    before_action :set_group, only: [:show, :update, :destroy]

    def index
        groups = Group.paginate(page: params[:page], per_page: 15)
        render json: { status: true, data: groups }
    end

    def show
        render json: { status: true, data: @group }
    end

    def create
        group = Group.new(group_params)
        if group.access_level == "secret"
            group.invitation_link = SecureRandom.alphanumeric(32);
        if group.save
            render json: { status: true, message: 'Group created!', data: group }
            
        else
            render json: { status: false, message: 'Unable to create group', errors: group.errros.full_messages }
        end
    end

    def update
        if @group.update(group_params)
            render json: { status: true, message: 'Group Updated!', data: @group }
        else
            render json: { status: false, message: 'Unable to update group', errors: @group.errros.full_messages }
        end
    end

    def destroy
        @group.destroy
        render json: { status: true, message: 'Group Deleted!' }
    end

    private 

    def set_group
        @group = Group.find(params[:id])
    end

    def group_params
        params.require(:group).permit(:name, :access_level, :owner_id)
    end

end