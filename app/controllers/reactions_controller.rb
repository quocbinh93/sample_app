class ReactionsController < ApplicationController
  before_action :logged_in_user
  before_action :find_reactable
  
  def create
    # Tìm reaction hiện tại của user (nếu có)
    @existing_reaction = @reactable.reactions.find_by(user: current_user)

    if @existing_reaction
      # Nếu reaction mới giống reaction cũ -> xóa reaction (unlike)
      if @existing_reaction.reaction_type == reaction_params[:reaction_type]
        @existing_reaction.destroy
      else
        # Nếu reaction mới khác reaction cũ -> cập nhật reaction
        @existing_reaction.update(reaction_params)
      end
    else
      # Nếu chưa có reaction nào -> tạo mới
      @reaction = @reactable.reactions.build(reaction_params)
      @reaction.user = current_user
      @reaction.save
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js   # Sẽ render create.js.erb
    end
  end

  def destroy
    @reaction = current_user.reactions.find_by(reactable: @reactable)
    @reaction&.destroy
    
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js
    end
  end

  private

    def reaction_params
      params.require(:reaction).permit(:reaction_type)
    end

    def find_reactable
      @reactable = if params[:comment_id]
                    Comment.find(params[:comment_id])
                  elsif params[:micropost_id]
                    Micropost.find(params[:micropost_id])
                  end
    end
end
