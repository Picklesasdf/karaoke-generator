FROM python:3.11-slim

# Install system deps
RUN apt-get update && \
    apt-get install -y ffmpeg git && \
    rm -rf /var/lib/apt/lists/*

# Copy only lockfile first for layer caching
COPY pyproject.toml poetry.lock /app/
WORKDIR /app

# Install Poetry & deps
RUN pip install --no-cache-dir poetry==1.8.3
RUN poetry config virtualenvs.create false
RUN poetry install --only main --no-root --no-interaction --no-ansi

# Copy the rest
COPY . /app

# Default command
ENTRYPOINT ["karaoke-gen"]
