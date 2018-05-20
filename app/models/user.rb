# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  email                     :string           default(""), not null
#  encrypted_password        :string           default(""), not null
#  reset_password_token      :string
#  reset_password_sent_at    :datetime
#  remember_created_at       :datetime
#  sign_in_count             :integer          default(0), not null
#  current_sign_in_at        :datetime
#  last_sign_in_at           :datetime
#  current_sign_in_ip        :string
#  last_sign_in_ip           :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  consumed_timestamp        :datetime
#  encrypted_otp_secret      :string
#  encrypted_otp_secret_iv   :string
#  encrypted_otp_secret_salt :string
#  consumed_timestep         :integer
#  otp_required_for_login    :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :two_factor_authenticatable, # Remember to remove database_authenticatable
         :two_factor_backupable,
         otp_secret_encryption_key: ENV['OTP_SECRET_ENCRYPTION_KEY']
end
