FROM python:3.12-slim

# Install system dependencies and tools
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    git \
    sudo \
    make \
    nano \
    vim \
    bash-completion \
    ca-certificates \
    fonts-powerline \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Install UV system-wide
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && mv /root/.local/bin/uv /usr/local/bin/uv \
    && mv /root/.local/bin/uvx /usr/local/bin/uvx \
    && rm -rf /root/.local

# Install Starship
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y -b /usr/local/bin

# Create non-root user with sudo access
RUN useradd -ms /bin/bash amiche \
    && echo "amiche ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configure user environment
RUN echo 'eval "$(starship init bash)"' >> /home/amiche/.bashrc \
    && echo 'export PATH="/usr/local/bin:$PATH"' >> /home/amiche/.bashrc \
    && echo 'alias ll="ls -la"' >> /home/amiche/.bashrc \
    && echo 'alias la="ls -la"' >> /home/amiche/.bashrc \
    && chown -R amiche:amiche /home/amiche

# Set workdir and switch to user
WORKDIR /app
USER amiche

# Default command
CMD ["tail", "-f", "/dev/null"]