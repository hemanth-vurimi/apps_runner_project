# Use an official Python image.
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose the port App Runner expects
EXPOSE 8080

# Run the app using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
