#!/bin/bash
USER="{{ cookiecutter.username }}"
EMAIL="{{ cookiecutter.email }}"
if [ `which virtualenv|grep virtualenv 2>/dev/null` ]
then
  virtualenv -p {{ cookiecutter.python_executable }} venv
else
  {{cookiecutter.python_executable}} -m venv venv
fi
source venv/bin/activate
cd back
echo "Installing backend dependencies"
pip install --upgrade pip setuptools
pip install -r requirements.txt
pip freeze --local > requirements.txt
cp environ.py.dist environ.py
python manage.py migrate --noinput
{% if cookiecutter.create_superuser == 'yes' %}
  echo "Creating superuper {{ cookiecutter.username }}"
  python manage.py createsuperuser --username {{ cookiecutter.username }} --email {{ cookiecutter.email }}
{% endif %}
deactivate
cd ..
echo "Initializing new Ember application"
ember new {{ cookiecutter.module_prefix }}
mv {{ cookiecutter.module_prefix }} front
cd front
echo "Installing frontend depencencies"
npm install && bower install
rm .jshintrc tests/.jshintrc
ember install ember-component-css ember-django-adapter ember-simple-auth ember-cli-js-cookie liquid-fire smoke-and-mirrors ember-cli-mirage ember-data-factory-guy sl-ember-test-helpers broccoli-serviceworker ember-href-to ember-cli-template-lint ember-network ember-cli-showdown ember-wormhole ember-cli-crudities ember-computed-decorators ember-cli-eslint ember-composable-helpers ember-concurrency
npm install --save-dev ember-load ember-cli-sass broccoli-manifest babel-eslint && npm install --save broccoli-merge-trees sw-toolbox
cd ..
echo "Downloading vendor libraries"
wget https://github.com/twbs/bootstrap-sass/archive/v{{ cookiecutter.bootstrap_version }}.tar.gz
tar -xzf v{{ cookiecutter.bootstrap_version }}.tar.gz
mkdir front/vendor/bootstrap
mv bootstrap-sass-{{ cookiecutter.bootstrap_version }}/assets/javascripts/* front/vendor/bootstrap/
mkdir front/public/assets
mv bootstrap-sass-{{ cookiecutter.bootstrap_version }}/assets/fonts front/public/assets/
mv bootstrap-sass-{{ cookiecutter.bootstrap_version }}/assets/stylesheets/* front/app/styles/
rm v{{ cookiecutter.bootstrap_version }}.tar.gz
rm -rf bootstrap-sass-{{ cookiecutter.bootstrap_version }}
wget https://github.com/FortAwesome/Font-Awesome/archive/v{{ cookiecutter.fontawesome_version }}.zip
unzip v{{ cookiecutter.fontawesome_version }}.zip
mkdir front/app/styles/fontawesome
mv Font-Awesome-{{ cookiecutter.fontawesome_version }}/scss/_* front/app/styles/fontawesome/
mv Font-Awesome-{{ cookiecutter.fontawesome_version }}/fonts front/public/assets/fonts/fontawesome
rm v{{ cookiecutter.fontawesome_version }}.zip
rm -rf Font-Awesome-{{ cookiecutter.fontawesome_version }}
echo "Binding frontend with backend"
if [ -f front/app/templates/application.hbs ]
then
  rm front/app/templates/application.hbs
fi
rm front/app/styles/app.css
rm -rf front/.git
cp -r front_tmp/* front/
cp front_tmp/.template-lintrc.js front/
rm -rf front_tmp
cd front
mv eslintrc.js .eslintrc.js
sed -i 's/  server\.shutdown();/  \/* eslint-disable no-undef *\/\n  server.shutdow();\n  \/* eslint-enable *\//' tests/helpers/destroy-app.js
ember build -prod
cd ..
source venv/bin/activate
cd back
mkdir {{ cookiecutter.repo_name }}/templates
cd {{ cookiecutter.repo_name }}/templates
ln -s ../../../front/dist/index.html .
cd ..
ln -s ../../front/dist/assets static
cd ..
python manage.py collectstatic --noinput
cd ..
mv gitignore.txt .gitignore
git init .
git add .
git commit -m "{{ cookiecutter.project_name }} initialized with cookiecutter from http://bitbucket.org/levit_scs/cc_django_ember_app"
