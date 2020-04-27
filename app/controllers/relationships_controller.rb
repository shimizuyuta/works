class RelationshipsController < ApplicationController
    def create
        user =User.find(params:[:follow_id])
        current_user.follow(user)
        flash[:sucess]='フォローしました'
        redirect_to user
    end
    def destroy
        user=User.find(params[:follow_id])
        current_user.unfollow(user)
        flash[:success]='ユーザーのフォローを解除した'
        redirect_to user
    end
end
