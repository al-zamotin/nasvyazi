# NASVYAZI (НаСвязи)

Современная социальная сеть с микросервисной архитектурой (Laravel, React, Go, Python).

## Архитектура

Проект построен как монорепозиторий с разделением зон ответственности:

- **Core (Laravel 12):** Основная бизнес-логика и API;
- **Web (React + Vite):** Клиентское SPA-приложение;
- **Stream (Go):** Реалтайм-сервис (будет добавлено позже);
- **ML (FastAPI):** AI-модерация и рекомендации (будет добавлено позже).

## Технологический стек

- **Backend:** PHP 8.3, Laravel 12, PostgreSQL 16.
- **Frontend:** TypeScript, React, Axios, SCSS Modules.
- **Infra:** Docker Compose, Redis, Nginx, Makefile.

## Быстрый старт

### 1. Подготовка окружения

Клонируйте репозиторий и создайте файлы конфигурации из шаблонов:

```bash
git clone https://github.com/al-zamotin/nasvyazi
cd nasvyazi
cp .env.example .env
cp services/core/.env.example services/core/.env
```

### 2. Установка зависимостей

Для корректной работы IDE и синхронизации с Docker установите пакеты локально:

```bash
# Backend
composer install --project-directory=services/core

# Frontend
npm install --prefix clients/web
```

### 3. Запуск проекта

Соберите образы и инициализируйте базу данных:

```bash
make build # Сборка и запуск контейнеров
make setup-core # Генерация ключей и запуск миграций
```

Приложение будет доступно по адресам:

- **Frontend:** [http://localhost:5173](http://localhost:5173)
- **Backend API:** [http://localhost:8000](http://localhost:8000)

## Команды управления (Makefile)

- `make up` / `make down` — запуск и остановка проекта;
- `make shell-core` — терминал внутри контейнера Laravel;
- `make shell-web` — терминал внутри контейнера React;
- `make migrate` — запуск миграций БД.

---

**Разработчик:** Александр Замотин
**Лицензия:** MIT
