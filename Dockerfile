FROM n8nio/n8n:latest

# ใช้ /data เป็นโฟลเดอร์เก็บข้อมูล (Render จะ mount disk มาที่นี่)
ENV N8N_USER_FOLDER=/data
ENV GENERIC_TIMEZONE=Asia/Bangkok

# n8n ใช้ user node อยู่แล้วใน image
USER node

# พอร์ตของ n8n
EXPOSE 5678

# คำสั่งรัน n8n
CMD ["n8n"]
