# Use official Python slim image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install pytest explicitly
RUN pip install pytest

# Copy all source code and tests
COPY . .

# Default command to run tests
CMD ["pytest", "tests/"]
