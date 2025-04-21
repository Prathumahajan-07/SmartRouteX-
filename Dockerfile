# Use official Python image
FROM python:3.10

# Set the working directory inside the container
WORKDIR /app

# Copy all files into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (change this if needed)
EXPOSE 5000

# Run the app (adjust this based on your actual entry point)
CMD ["python", "app.py"]
