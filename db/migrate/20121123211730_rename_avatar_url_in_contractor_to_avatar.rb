class RenameAvatarUrlInContractorToAvatar < ActiveRecord::Migration
  def change
    rename_column :contractors, :avatar_url, :avatar
  end
end
