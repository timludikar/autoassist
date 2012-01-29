ActiveAdmin.register User do
    
    config.sort_order = 'ID'
    
    filter :first
    filter :last
    filter :email
    
    index do
        column "ID", :id
        column :first
        column :last
        column :email
        default_actions
    end
    
    form do |f|
        f.inputs "User Information" do
            f.input :first
            f.input :last
            f.input :email
            f.input :address1
            f.input :address2
            f.input :postcode
            f.input :prov
            f.input :phone_number
        end
        f.buttons
    end
    
    show :title => :email do
        panel "User Informatin" do
            attributes_table_for user do
                row("First name") { user.first }
                row("Last name") { user.last }
                row("Email address") { user.email }
                row("Address 1") { user.address1 }
                row("Address 2") { user.address2 }
                row("Postal code") { user.postcode }
                row("Province") { user.prov }
                row("Phone number") { user.phone_number }
            end
        end
        
        panel "User Statistics" do
            attributes_table_for user do
                row("Login count") { user.sign_in_count }
                row("Current IP") { user.current_sign_in_ip }
                row("Last IP") { user.last_sign_in_ip }
                row("Current login") { user.current_sign_in_at }
                row("Last login") { user.last_sign_in_at }
                row("Created on") { user.created_at }
                row("Updated on") { user.updated_at }
            end
        end
    end
    
    sidebar "Password Reset", :only => [:edit, :show] do
        ul do
            li "First List First Item"
            li "Second List Second Item"
        end
    end
    
    sidebar "Help", :only => [:edit, :show] do
        ul do
            li "First List First Item"
            li "Second List Second Item"
        end
    end
end
