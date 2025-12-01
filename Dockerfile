FROM n8nio/n8n:latest

# ตำแหน่งเก็บข้อมูล (Render mount disk ที่นี่)
ENV N8N_USER_FOLDER=/data
ENV GENERIC_TIMEZONE=Asia/Bangkok

# ให้ root สร้าง /data และตั้ง permission
USER root
RUN mkdir -p /data && chown -R node:node /data

# กลับมาใช้ user node ตามปกติ
USER node

EXPOSE 5678

CMD ["n8n"]
