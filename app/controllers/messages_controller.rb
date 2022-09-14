class MessagesController < ApplicationController
before_action :require_user
    def create
       @message=current_user.messages.build(message_params)
       if @message.save
        flash[:success]="Message sent"
        redirect_to root_path
       else
        flash[:error]="Try again"
       end
    end

    def message_params
    params.require(:message).permit(:body)
    end

end