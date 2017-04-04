class Admin::AdminController < ApplicationController
  before_action :authenticate_user!, :check_admin

  layout 'admin'

  def index; end

  private

  def check_admin
    if current_user.email != 'admin@admin.com'
      redirect_to root_path, flash: { error: 'Insufficient rights!' }
    end
  end
end
