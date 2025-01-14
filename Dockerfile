FROM python:3.10-slim-buster
WORKDIR /app

# Copy all project files first
COPY . /app

# Update system and install required packages
RUN apt update && \
    apt -y upgrade && \
    apt install -y ffmpeg && \
    pip3 install --upgrade pip && \
    pip3 install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-root   # Avoids installing the project itself

# Expose the application port
EXPOSE 8501

# Specify the entry point and command to run the app
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]
