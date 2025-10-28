# ===============================
# Dockerfile for Streamlit Ticket Booking App
# ===============================

# 1️⃣ Base image (lightweight Python)
FROM python:3.10-slim

# 2️⃣ Set working directory inside container
WORKDIR /app

# 3️⃣ Copy requirements first (for caching)
COPY app/requirements.txt .

# 4️⃣ Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5️⃣ Copy all source code
COPY app/ .

# 6️⃣ Expose Streamlit default port
EXPOSE 8501

# 7️⃣ Set environment variable to run in headless mode
ENV STREAMLIT_SERVER_HEADLESS=true

# 8️⃣ Start Streamlit app
CMD ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]
