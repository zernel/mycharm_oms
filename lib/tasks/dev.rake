namespace :dev do
  namespace :db do
    desc "reload everything..."
    task :reload => :environment do
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:seed'].invoke
      #Rake::Task['db:test:clone_structure'].invoke if Rails.env.development?
    end
  end
end

