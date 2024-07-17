# QualCoder in Docker

QualCoder installed in Docker. Because QualCoder uses Qt for its UI, the tool must be accessed via X11. This image allows you to connect to X11 using SSH X11 forwarding.

## Prerequisites

- These instructions are for macOS and Linux host systems
- Your host system needs Docker and an X11 windowing system (e.g., XQuartz on macOS)

The Docker configuration should work on Windows, but we don't provide detailed instructions (it's easy to install QualCoder directly on Windows, so that's what we recommend).

## Setup

Configure your host to allow X11 forwarding to localhost by adding the following to `~/.ssh/config`:

```
Host localhost
  ForwardX11Trusted yes
  ForwardX11 yes
  XAuthLocation /opt/X11/bin/xauth
```

Next, configure environment variables for the Docker containers:

1. Copy `dot_env_example` to `.env`
2. Run `chmod 600 .env` to prevent other users from reading your `.env` file
3. Edit `.env`, changing:
  - The text `RANDOM_PASSWORD` to a password which is actually random
  - Update `LISTEN_SSHD` to specify the interface and port to listen on

## Usage

If you want to pull the image from Docker Hub, first run:

```
docker-compose pull
```

Next, if you're on a Mac, just double-click on the `QualCoder.command` script. If
you're on Linux, just run the `QualCoder.command` script from the
command-line.

When prompted, enter the password that you chose earlier, then QualCoder should open in X11.

I recommend saving your projects project into `/root/QualCoder`, since that directory is volume mapped.

## Why does this exist?

Setting up QualCoder on macOS can be time consuming.
