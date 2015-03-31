
package 'docker.io'
package 'apache2'
package 'wget'

execute "apt-get-update-periodic" do
  command "apt-get update"
  ignore_failure false
end


execute "docker nodejs image" do
   #command "docker pull dockerfile/nodejs"
   #command "docker build -t dockerfile/nodejs"
   #command "docker run -it dockerfile/nodejs"
end

execute "docker mongodb image" do
   #command "docker pull dockerfile/mongodb"
   #command "docker build -t dockerfile/mongodb"
   #command "docker run -it dockerfile/mongodb"
end

execute "docker commit nodejs" do
    command "docker commit 639ccfa82e6f cmpe283team1/nodejs_docker"
end

execute "docker push nodejs" do
    command "docker push cmpe283team1/nodejs_docker"
end

#execute "docker commit mongodb" do
    #command "docker commit 2d3bfa34f77b cmpe283team1/mongodb_docker"
#end

#execute "docker push mongodb" do
   # command "docker push cmpe283team1/mongodb_docker"
#end


#execute "docker remove node image" do
 #command "docker rmi 1a93ee58ce44"
#end

#execute "docker remove node container" do
 # command "docker stop 639ccfa82e6f"
 #command "docker rm 639ccfa82e6f"
#end

#logging image list
file "docker_images.txt" do
  output = `docker images`
  content output
  mode 00600
end


#logging container list
file "docker_container.txt" do
  output = `docker ps -a`
  content output
  mode 00600
end
