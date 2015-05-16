admins_data   = YAML::load( File.open("#{Rails.root}/db/seed/admins_data.yml") )
stores_data   = YAML::load( File.open("#{Rails.root}/db/seed/stores_data.yml") )
products_data   = YAML::load( File.open("#{Rails.root}/db/seed/products_data.yml") )

if admins_data['admins']
	admins_data['admins'].each_pair do |key, attributes|
		next if Admin.find_by(username: attributes['username'])
		Admin.create(attributes)
	end
end

if stores_data['stores']
	stores_data['stores'].each_pair do |key, attributes|
		next if Store.find_by(name: attributes['name'])
		Store.create(attributes)
	end
end

if products_data['products']
	products_data['products'].each_pair do |key, attributes|
		next if Product.find_by(name: attributes['name'])
		Product.create(attributes)
	end
end
