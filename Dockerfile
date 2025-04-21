# Use an official Python image (or Node, etc.)
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose port (change based on app config)
EXPOSE 5000

# Start the app (change based on your framework)
CMD ["python", "app.py"]
