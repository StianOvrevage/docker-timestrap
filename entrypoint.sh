cd /timestrap
if [ ! -f database/db.sqlite3 ]; then
    echo "Starting database migrations"
    pipenv run python manage.py migrate --noinput

    echo "Moving database file into database/ subfolder"
    mkdir database/
    mv -n db.sqlite3 database/
fi

ln -s database/db.sqlite3 db.sqlite3

echo "Starting server"
pipenv run python manage.py runserver 0.0.0.0:8000
