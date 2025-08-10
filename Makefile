# Makefile for Open-WebUI
DATA_ROOT := \$(HOME)/Docker-Apps/docker-data/open-webui
BACKUP_DIR := backups
NOW := \$(shell date +"%Y%m%d-%H%M%S")

.PHONY: up down logs shell backup-data help

help:
	@grep -E '^[a-zA-Z_-]+:' Makefile | sed 's/:.*//'

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs --tail=50 -f

shell:
	docker compose exec ker-open-webui /bin/bash

backup-data:
	@mkdir -p \$(BACKUP_DIR)
	@echo "📦 Creating backup: \$(BACKUP_DIR)/open-webui-\$(NOW).tar.gz"
	tar czf \$(BACKUP_DIR)/open-webui-\$(NOW).tar.gz -C \$(HOME)/Docker-Apps/docker-data open-webui
	@echo "✅ Backup complete"
