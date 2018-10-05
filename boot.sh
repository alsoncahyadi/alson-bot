#!/bin/sh
# source venv/bin/activate
# flask db upgrade
# flask translate compile
exec gunicorn -b :$PORT --access-logfile - --error-logfile - main:app