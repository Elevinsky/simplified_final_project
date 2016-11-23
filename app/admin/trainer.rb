ActiveAdmin.register Trainer do

 permit_params :name, :tues_start_hour, :tues_start_min, :tues_start_am_pm, :wed_start_hour, :wed_start_min, :wed_start_am_pm, :thur_start_hour, :thur_start_min, :thur_start_am_pm, :fri_start_hour, :fri_start_min, :fri_start_am_pm, :sat_start_hour, :sat_start_min, :sat_start_am_pm, :sun_start_hour, :sun_start_min, :sun_start_am_pm, :tues_end_hour, :tues_end_min, :tues_end_am_pm, :wed_end_hour, :wed_end_min, :wed_end_am_pm, :thur_end_hour, :thur_end_min, :thur_end_am_pm, :fri_end_hour, :fri_end_min, :fri_end_am_pm, :sat_end_hour, :sat_end_min, :sat_end_am_pm, :sun_end_hour, :sun_end_min, :sun_end_am_pm

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
