# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def roles
    Role.joins(:users).where(users: { id: self.id }).select([:id, :name]).map{|r| { id: r.id, name: r.name }}
  end

  def role_names
    Role.joins(:users).where(users: { id: self.id }).pluck(:name)
  end

  def roles_i_dont_have
    Role.joins('left join users_roles on users_roles.role_id = roles.id')
        .where('users_roles.user_id is null or users_roles.user_id != 1', self.id)
        .pluck(:name)
  end

  def has_role?(role)
    role_names.include? role.to_s
  end
end
