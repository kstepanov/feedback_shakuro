ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel link_to('Recent Feedbacks', admin_feedbacks_path) do
          table_for Feedback.recent(5) do
            column(:id) { |feedback| auto_link(feedback, feedback.id) }
            column :project_name
            column :feature_name
            column :customer_name
            column :rate
          end
        end
      end

      column do
        panel link_to('Recent Requests', admin_requests_path) do
          table_for Request.recent(5) do
            column(:id) { |request| auto_link(request, request.id) }
            column :project_name
            column :feature_name
            column :customer_name
            column :customer_email
          end
        end
      end
    end
  end
end
