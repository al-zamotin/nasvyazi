# NASVYAZI (НаСвязи)

Современная социальная сеть с микросервисной архитектурой, построенная на стеке React, Laravel, Go и Python.

## Архитектура системы

Проект реализован как монорепозиторий, разделенный на независимые сервисы, объединенные через Docker и Nginx:

- **Frontend (Web):** React (TypeScript) + Vite + SCSS Modules;
- **Core Service:** Laravel 12 (PHP 8.3) — основная бизнес-логика, API и работа с СУБД;
- **Stream Service:** Go — real-time уведомления, чаты и WebSockets;
- **ML Service:** Python (FastAPI) — система рекомендаций и AI-модерация контента.

## Технологический стек

Технологический стек проекта представляет собой следующее:

- **Инфраструктура:** Docker, Docker Compose, Nginx;
- **Базы данных:** PostgreSQL (основная), Redis (кэш/брокер), MinIO (S3 хранилище медиа);
- **Управление:** GNU Make (Makefile).

## Быстрый старт

### 1. Подготовка окружения

Клонируйте репозиторий и подготовьте файлы конфигурации:

```bash
git clone https://github.com/al-zamotin/nasvyazi
cd nasvyazi
cp .env.example .env
cp services/core/.env.example services/core/.env
```

### 2. Запуск и установка

Соберите контейнеры и установите все зависимости:

```bash
make build    # Сборка и запуск контейнеров
make install  # Установка composer и npm пакетов внутри контейнеров
```

### 3. Инициализация Laravel

Настройте ключи безопасности и базу данных:

```bash
make setup-core
```

После выполнения этих шагов приложение будет доступно:

- **Frontend:** [http://localhost:5173](http://localhost:5173)
- **Backend API:** [http://localhost:8000](http://localhost:8000)

## Структура репозитория

Структура репозитория представляет собой следующее:

- `/clients/web` — Клиентское SPA приложение;
- `/services/core` — Ядро системы (Laravel);
- `/services/stream` — Real-time сервис (Go);
- `/services/ml` — AI сервис (Python);
- `/gateway/nginx` — Конфигурация единой точки входа;
- `/data` — Локальные хранилища БД и медиа (игнорируются Git).

---

**Разработчик:** Александр Замотин
**Лицензия:** MIT
