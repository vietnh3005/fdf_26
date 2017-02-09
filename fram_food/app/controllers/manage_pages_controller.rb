class ManagePagesController < ApplicationController
  layout "admin_layout"
  def show
    if valid_page?
      render template: "manage_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname.new Rails.root +
      "app/views/manage_pages/#{params[:page]}.html.erb"
  end
end
