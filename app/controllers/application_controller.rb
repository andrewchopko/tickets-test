class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :resource, :collection

  def new
    initialize_resource
  end

  def create
    build_resource

    resorce.save!
  end

  def update
    resource.update! resource_params
  end

  def destroy
    resource.destroy!
  end
end
