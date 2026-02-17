# Threat Model — Day 8

Architecture:
Internet → Web (nginx) → Redis

## STRIDE Analysis

### Spoofing
- Redis has no auth
Mitigation: enable password + network restriction

### Tampering
- Containers run as root
Mitigation: non-root user

### Repudiation
- No centralized logs
Mitigation: log aggregation

### Information Disclosure
- .env used locally
Mitigation: secret manager in prod

### Denial of Service
- No rate limiting
Mitigation: nginx limits

### Elevation of Privilege
- Default container capabilities
Mitigation: drop Linux capabilities
