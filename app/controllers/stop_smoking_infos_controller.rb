class StopSmokingInfosController < ApplicationController
  def create
    @info = current_user.stop_smoking_info.build
    if @info.save
      flash[:success] = '禁煙スタートしました'
      redirect_to user_url(current_user)
    else
      flash.now[:danger] = '禁煙スタート失敗しました。'
      redirect_to user_url(current_user)
    end
  end
  
  def smoking_fail
    @info = StopSmokingInfo.find(params[:id])
    @info.update(fail_flag: true, fail_datetime: Time.current)
    redirect_to user_url(current_user)
  end
end
