class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :update, :destroy]

  def index
    @resources = collection.all

    render json: { collection_key => @resources }
  end

  def show
    render json: { member_key => @resource }
  end

  def create
    @resource = collection.new(resource_params)

    if @resource.save
      render json: { id: @resource.id }, status: :created
    else
      render json: { errors: @resource.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(resource_params)
      render json: { id: @resource.id }
    else
      render json: { errors: @resource.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy

    render json: { id: @resource.id }
  end

  protected
    def set_resource
      @resource = collection.find(params[:id])
    end

    def resource_params
      params.require(member_key).permit(*permitted_keys)
    end

    def collection_key
      @collection_key ||= controller_name.to_sym
    end

    def member_key
      @member_key ||= controller_name.singularize.to_sym
    end

    def collection
      @collection ||= klass.all
    end

    def klass
      @klass ||= controller_name.singularize.camelize.constantize
    end

    def permitted_keys
      klass.column_names - %w(id created_at updated_at)
    end
end
