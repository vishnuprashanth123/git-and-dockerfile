version=$BUILD_ID 
docker build -t ecrrepo:$version .
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 198095598917.dkr.ecr.ap-south-1.amazonaws.com
docker tag ecrrepo:$version 198095598917.dkr.ecr.ap-south-1.amazonaws.com/ecrrepo:$version
docker push 198095598917.dkr.ecr.ap-south-1.amazonaws.com/ecrrepo:$version

echo "build docker image to ECR"
#create new task definition with buildiD

sed -i s#198095598917.dkr.ecr.ap-south-1.amazonaws.com/ecrrepo:8#198095598917.dkr.ecr.ap-south-1.amazonaws.com/ecrrepo:$version#g taskdef.json
aws ecs register-task-definition --CLI-input-json file://taskdef.json --region ap-south-1

echo "new task created "
