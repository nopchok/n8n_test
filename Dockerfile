FROM n8nio/n8n:latest

# ใช้ root ชั่วคราวเพื่อจัดการสิทธิ์ /data
USER root

# สร้างโฟลเดอร์ /data และให้สิทธิ์กับ user node
RUN mkdir -p /data && chown -R node:node /data

# ตั้งค่าตำแหน่งเก็บข้อมูล + timezone
ENV N8N_USER_FOLDER=/data
ENV GENERIC_TIMEZONE=Asia/Bangkok

# กลับมาใช้ user node (ตามที่ image n8n ใช้อยู่แล้ว)
USER node

# ไม่ต้องกำหนด CMD เอง ปล่อยให้ใช้ค่า default ของ n8n image
# (base image มี CMD ["n8n"] อยู่แล้ว)
