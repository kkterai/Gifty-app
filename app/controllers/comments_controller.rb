class CommentsController < ApplicationController
    before_action :set_list_item

    def create
     @list_item.comments.build(comment_params)
     if @list_item.save
       redirect_to @list_item
     else
       flash[:alert] = "please try again"
       redirect_to @list_item
     end
    end

    private

    def set_list_item
        if params[:id]
            @list_item = ListItem.find(params[:id])
        else
            @list_item = ListItem.find(params[:list_item_id])
        end
    end

    def comment_params
        params.require(:comment).permit(:content)
    end

end
