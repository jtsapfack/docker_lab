# Use an official lightweight Python image
FROM python:3.9-slim

# Set an application directory
WORKDIR /usr/src/app

# Prevent python from writing .pyc files and enable stdout/stderr unbuffered
# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1

# Install build dependencies (if any) and pip dependencies
# Copy requirements first to leverage Docker cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 5000 (Flask default)
EXPOSE 5000

# Set FLASK_APP if your entrypoint is app.py; adjust if different
# ENV FLASK_APP=app.py
# Ensure Flask runs in production mode? For development, you can use 'development'
# ENV FLASK_ENV=production

# Command to run Flask built-in server binding to 0.0.0.0 on port 5000
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

