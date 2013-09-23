directory "/var/www/Sylius" do
  action :create
end


git "/var/www/Sylius" do
  repository "https://github.com/Sylius/Sylius.git"
  reference "master"
  action :sync
end