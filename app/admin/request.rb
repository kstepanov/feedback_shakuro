ActiveAdmin.register Admin::Request, as: 'Request' do
  permit_params :customer_name, :customer_email, :project_name, :feature_name

  controller do
    def create
      request_creator = RequestCreator.new(permitted_params['admin_request'], current_admin_user)
      @resource = request_creator.request

      if request_creator.create
        redirect_to admin_requests_path, flash: { notice: 'Request sucessfully sent' }
      else
        render :new
      end
    end
  end

  index do
    selectable_column
    id_column
    column :project_name
    column :feature_name
    column :customer_name
    column :customer_email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :admin_user
      row :project_name
      row :feature_name
      row :customer_name
      row :customer_email
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Request Details' do
      f.input :project_name
      f.input :feature_name
      f.input :customer_name
      f.input :customer_email
    end
    f.actions
  end
end
