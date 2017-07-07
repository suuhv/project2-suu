class AvatarUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    url = "avatar/" << [version_name, "avatar_default.jpg"].compact.join("_")
    ActionController::Base.helpers.asset_path url
  end
end
