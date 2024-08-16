# 使用官方的 Node.js 镜像作为基础镜像
FROM node:18-slim

# 安装系统依赖库
RUN apt-get update && apt-get install -y \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 复制当前目录的所有文件到工作目录
COPY . .

# 安装项目依赖
RUN npm install

# 暴露前端和后端端口
EXPOSE 3010 5050 54323

# 启动 Supabase 和 Quivr 应用
CMD ["sh", "-c", "cd backend && supabase start && cd ../ && docker compose up"]
