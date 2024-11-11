# Use official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

COPY ./modules /app/modules

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files into the container
COPY . .

ENV PYTHONPATH=/app/modules:${PYTHONPATH}

# Set the default command to run Robot Framework tests
CMD ["robot", "--outputdir", "/app/results", "/app/tests"]
