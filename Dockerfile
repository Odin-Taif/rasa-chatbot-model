# Use the official Rasa image
FROM rasa/rasa:latest-full

# Set the working directory
WORKDIR /app

# Copy the Rasa project files
COPY . /app

# Install dependencies (if needed)
RUN pip install --no-cache-dir -r requirements.txt

# Train the Rasa model
RUN rasa train

# Expose the Rasa server port
EXPOSE 5005

# Start the Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*"]
