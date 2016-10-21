ActiveAdmin.register Admin::Feedback, as: 'Feedback' do
  permit_params :customer_name, :customer_email, :project_name, :feature_name, :rate, :details
  actions :index, :show, :edit, :update

  index do
    selectable_column
    id_column
    column :customer_name
    column :customer_email
    column :project_name
    column :feature_name
    column :rate
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :request
      row :customer_name
      row :customer_email
      row :project_name
      row :feature_name
      row :rate
      row :details
      row :created_at
    end
  end

  form do |f|
    f.inputs 'Request Details' do
      f.input :customer_name
      f.input :customer_email
      f.input :project_name
      f.input :feature_name
      f.input :rate
      f.input :details
    end
    f.actions
  end
end
