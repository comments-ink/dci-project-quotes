# dci-project-quotes

It is a very simple Django project with only three dependencies:
 * django>=4,<5
 * django-contrib-comments>=2.2,<2.3
 * django-debug-toolbar>=3.2,<3.3
 * django-comments-ink==0.0.1

Features:
 * It is a fully backend driven project (no JavaScript needed).
 * Users and visitors can send comments and replies.
 * Comments can be nested one level.

## Setup virtual environment

Create a virtual environment:

    $ python3.10 -m venv venv
    $ source venv/bin/activate
    $ pip install -r requirements.txt

## Setup the Django project

Run Django's `migrate` command and load the fixture data:

    $ cd project_quotes
    $ python manage.py migrate
    $ python manage.py loaddata ../fixtures/sites.json
    $ python manage.py loaddata ../fixtures/users.json
    $ python manage.py loaddata ../fixtures/quotes.json
    $ python manage.py loaddata ../fixtures/comments.json

And finally launch the development server:

    $ python manage.py runserver

## About users

The project allows you to login using any of the users provided with the `users.json` fixture. There are 110 users. Here are the login email and password of the first 10. The rest follow the same pattern; they have as password the left side of the email address:

 * `admin@example.com`, password `admin`
 * `fulanito@example.com`, password `fulanito`
 * `mengo@example.com`, password `mengo`
 * `daniela.rushmore@example.com`, password `daniela.rushmore`
 * `lena.rosenthal@example.com`, password `lena.rosenthal`
 * `amalia.ocean@example.com`, password `amalia.ocean`
 * `isabel.azul@example.com`, password `isabel.azul`
 * `joe.bloggs@example.com`, password `joe.bloggs`
 * `eva.rizzi@example.com`, password `eva.rizzi`
 * `david.fields@example.com`, password `david.fields`
