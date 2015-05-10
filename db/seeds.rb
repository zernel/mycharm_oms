admin_data   = YAML::load( File.open("#{Rails.root}/db/seed/admins_data.yml") )
if admin_data['admins']
	admin_data['admins'].each_pair do |key, attributes|
		next if Admin.find_by(username: attributes['username'])
		Admin.create(attributes)
	end
end
