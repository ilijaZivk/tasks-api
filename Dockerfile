
# ---------------------------------------------------------------
# Dockerfile À COMPLÉTER : TP3 (jour 3)
# ---------------------------------------------------------------

# TODO 1 : choisir une image de base Python légère
FROM python:3.12-slim

# TODO 2 : définir le dossier de travail
WORKDIR /app

# TODO 3 : copier requirements.txt et installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# TODO 4 : copier le code de l'application
COPY app/ ./app/

# TODO 5 : créer un utilisateur non-root et basculer dessus
RUN useradd --create-home appuser
USER appuser

# TODO 6 : version et lancement de l'application
ARG APP_VERSION=dev
ENV APP_VERSION=${APP_VERSION}

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app.main:app"]
