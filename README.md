# Automation Journey — Day 4 (Docker Compose + Make + CI)

This repository demonstrates a reproducible local environment with:
- web (nginx static site)
- redis (cache)
- one-command automation via Makefile
- smoke tests via bash script
- CI via GitHub Actions

## Requirements
- Docker + Docker Compose v2
- GNU Make
- curl

## Quick start (1 command)
```bash
make up && make test && make down
```

## Commands
Start environment:
```bash
make up
```

Show status:
```bash
make ps
```

Run tests:
```bash
make test
```

View logs:
```bash
make logs
```

Stop and cleanup:
```bash
make down
```

## Acceptance Criteria
- make up starts both services
- make test prints [ALL OK]
- GitHub Actions CI passes on push
