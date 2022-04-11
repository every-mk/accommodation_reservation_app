class ProfilesController < ApplicationController
  def show
  end

  def update
    current_user.profile.image_name = get_profile_image_name
    if current_user.profile.update(configure_profile_update_params)
      delete_profile_icon_image(current_user.id)
      update_profile_icon_image(current_user.id, current_user.profile.image_name)
      flash[:notice] = ""
      redirect_to profile_path
    else
      render "show"
    end
  end

  private

  def get_profile_image_name
    params.require(:profile).permit(:icon_image)[:icon_image].original_filename
  end

  def delete_profile_icon_image(user_id)
    FileUtils.rm_r("public/uploads/user/image/#{user_id}")
    Dir.mkdir("public/uploads/user/image/#{user_id}")
  end

  def update_profile_icon_image(user_id, image_name)
    File.binwrite("public/uploads/user/image/#{user_id}/#{image_name}", params.require(:profile).permit(:icon_image)[:icon_image].read)
  end

  def configure_profile_update_params
    params.require(:profile).permit(:name, :introduce)
  end
end
