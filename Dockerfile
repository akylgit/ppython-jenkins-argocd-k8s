
# Use a specific, stable Python version
FROM python:3.9-slim-buster

# Set environment variables for Django (adjust as needed)
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE your_project_name.settings # IMPORTANT: Replace 'python-jenkins-argocd-k8s' with your actual Django project directory name

# Set the working directory in the container
WORKDIR /app

# Copy only requirements first to leverage Docker cache
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Copy the rest of your application code
COPY . /app/

# Collect static files (if applicable for production)
# RUN python manage.py collectstatic --noinput

# Expose the port your Django app will run on
EXPOSE 8000

# Run migrations and then start the server
# The `sh -c` ensures both commands run sequentially
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]