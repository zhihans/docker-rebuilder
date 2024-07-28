
#!/bin/bash

# 设置变量，GitHub仓库 以及 build后的镜像
repo_url="https://github.com/xqdoo00o/ChatGPT-to-API"
repo_branch="master"
IMAGE_NAME="asnil/c2api"

# hash 判断部分
remote_hash=$(git ls-remote $repo_url $repo_branch | awk {'print $1'})
local_hash=$(cat hash)
if [[ "$remote_hash" = "$local_hash" ]]; then
    echo "仓库已经是最新的。"
    exit 0
else
    echo $remote_hash > hash
    echo "仓库有更新可用，开始构建镜像！"
fi

# 镜像构建部分
git clone $repo_url -b $repo_branch repo && cd repo
CURRENT_DATE=$(TZ="Asia/Shanghai" date +"%Y%m%d")
docker buildx build --platform linux/amd64,linux/arm64 -t "$IMAGE_NAME:$CURRENT_DATE" -t "$IMAGE_NAME:latest" -f ../Dockerfile . --push
cd ..

# 输出构建信息
update_time=$(TZ='Asia/Shanghai' date +'%Y-%m-%d %H:%M')
echo "**镜像名称:** \`$IMAGE_NAME\`" >> readme.md
echo "**更新时间:** $update_time" >> readme.md
echo "" >> readme.md