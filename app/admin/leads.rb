ActiveAdmin.register Lead do
    index do
        selectable_column
        id_column
        column  :full_name
        column  :company_name
        column  :email
        column  :phone
        column  :project_name
        column  :project_desc
        column  :department
        column  :message
        column  :attached_file
        column  :timestamp
        actions
    end
end
