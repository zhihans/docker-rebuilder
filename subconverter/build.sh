
#!/bin/bash

# 设置变量，Docker源镜像 以及 rebuild后的镜像
source_docker_image="tindy2013/subconverter:latest"
IMAGE_NAME="asnil/subconverter"

# hash 判断部分
docker pull $source_docker_image >> /dev/null 2>&1
remote_hash=$(docker inspect --format='{{index .RepoDigests 0}}' $source_docker_image)
local_hash=$(cat hash)
if [[ "$remote_hash" = "$local_hash" ]]; then
    echo "仓库已经是最新的。"
    exit 0
else
    echo $remote_hash > hash
    echo "仓库有更新可用，开始构建镜像！"
fi

# 镜像构建部分
CURRENT_DATE=$(TZ="Asia/Shanghai" date +"%Y%m%d")
docker buildx build --platform linux/amd64,linux/arm64 -t "$IMAGE_NAME:$CURRENT_DATE" -t "$IMAGE_NAME:latest" -f Dockerfile . --push

# 输出构建信息
update_time=$(TZ='Asia/Shanghai' date +'%Y-%m-%d %H:%M')
echo "**镜像名称:** \`$IMAGE_NAME\`" >> readme.md
echo "**更新时间:** $update_time" >> readme.md
echo "" >> readme.md