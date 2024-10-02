# Use an official Python runtime as a parent image
FROM python:3.9.19-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache
COPY app/requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY app/ /app

# Make port 5000 available to the world outside this container 
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=web_app.py

# Run the Flask app
CMD ["python", "web_app.py"]


