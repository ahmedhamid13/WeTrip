class AddSuperadmin < ActiveRecord::Migration[6.0]
  def change
        User.create! do |u|
            u.first_name  = 'admin'
            u.last_name  = 'weTrip'
            u.email     = 'admin@admin.com'
            u.password  = 'admin123'
            u.superadmin_role = true
            u.user_role = false
    end
  end
end
