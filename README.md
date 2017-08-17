# Levit's Django CookieCutter template for "Djember experience app"

### Before getting started

This cookie cutter provides a Django project built according to the _project app_ architecture.

In short, with the _project app_ architecture, the almost empty directory named after your project becomes an *app* like any other app in your project. This has numerous advantages, the most noticeable of them being that you don't need to create a _core_ or _base_ app but can use your project app instead.

If you haven't seen [Anatomy of a Django Project by Mark Lavin](https://www.youtube.com/watch?v=ajEDo1semzs), I would emcourage you to do so to get a better grasp of what the _project app_ architecture is about.

### CookieCutter

For more info on CookieCutter, please visit [their documentation](http://cookiecutter.readthedocs.org/en/latest/)

### Djember experience

Djember experience is the nickname given to apps created with the libraries demo'ed at [https://djembersample.pythonanywhere.com](https://djembersample.pythonanywhere.com)

### Requirements

If you are not familiar with how you should install any of those or **if you are running windows** , please visit our [environment alternatives and Ubuntu TL;DR page](ALTERNATIVES.md) for more info

- Latest [Python & virtualenv](https://www.python.org/downloads/release) - on Debian/Ubuntu, make sure to install the system `python-virtualenv` as well
- Latest [CookieCutter](http://cookiecutter.readthedocs.org/en/latest/) - (`sudo pip install -U cookiecutter` to upgrade)
- Latest [NodeJS & npm](https://nodejs.org/en/download/)
- Latest [ember-cli](https://www.npmjs.com/package/ember-cli) (if you already have ember-cli installed, see release notes for upgrade instructions)
- wget
- unzip

### Usage

To use, simply run 
`cookiecutter https://bitbucket.org/levit_scs/cc_djember_experience.git`

### Included in this CoookieCutter

- [Django](https://www.djangoproject.com/)
- [Django Rest Framework](http://www.django-rest-framework.org/)
- [Django Filter](https://django-filter.readthedocs.org/en/latest/)
- [Django CORS headers](https://github.com/ottoyiu/django-cors-headers)
- [Celery](http://www.celeryproject.org/)
- [Django Debug Toolbar](http://django-debug-toolbar.readthedocs.org/en/1.4/) and [Django Debug Panel](https://github.com/recamshak/django-debug-panel)
- [Factory Boy](https://factoryboy.readthedocs.org/en/latest/)
- [DRF-Schema-Adapter](http://drf-schema-adapter.readthedocs.io/en/latest/)
- [DRF-Base64](https://bitbucket.org/levit_scs/drf_base64)
- [levit_report](https://pypi.python.org/pypi/levit-report)

- A base test to test most standard `ModelViewSet`'s

- [Ember](http://emberjs.com/)
- [ember-django-adapter](http://dustinfarris.com/ember-django-adapter/)
- [ember-simple-auth](https://ember-simple-auth.com/)
- [ember-data-factory-guy](https://github.com/danielspaniel/ember-data-factory-guy) and [ember-cli-mirage](http://www.ember-cli-mirage.com/)
- [ember-cli-eslint](https://github.com/ember-cli/ember-cli-eslint)
- [ember-cli-template-lint](https://github.com/rwjblue/ember-cli-template-lint)
- [smoke-and-mirrors](https://github.com/runspired/smoke-and-mirrors)
- [liquid-fire](http://ember-animation.github.io/liquid-fire/)
- [ember-load](https://github.com/mike-north/ember-load)
- [ember-cli-sass](https://github.com/aexmachina/ember-cli-sass)
- [ember-component-css](https://github.com/ebryn/ember-component-css)
- [broccoli-serviceworker](https://github.com/jkleinsc/broccoli-serviceworker)
- [broccoli-manifest](https://github.com/racido/broccoli-manifest)
- [ember-computed-decorators](https://github.com/rwjblue/ember-computed-decorators)
- [ember-composable-helpsers](https://github.com/DockYard/ember-composable-helpers)
- [ember-concurrency](http://ember-concurrency.com/#/docs)
- [ember-cli-crudities](https://ember-cli-crudities.readthedocs.io/en/latest/)

- [Bootstrap 3 (SaSS Source)](http://getbootstrap.com/)
- [FontAwesome 4](https://fortawesome.github.io/Font-Awesome/)

- Integration of Boostrap and FontAwesome with Ember
- Session Authentication between Ember and Django

### Notes

1. Make sure your system allows you to run scripts from /tmp (this isn't the case for all default Ubuntu installations)

2. **For several reasons, This template cannot be used natively on windows.** If you are running windows, please see the [environment alternatives page](ALTERNATIVES.md).

3. This template comes with a base test class to test most ModelViewSets, look at the `base.py` file in the `tests` folder for more info

4. This template comes with pre-configured session-based authentication.

### Deployment

Once the cookiecutter is installed, you'll find sample configuration files for Nginx and uWSGI in `conf_samples/nginx_uwsgi`.

---


This project is licensed under the [MIT License](http://opensource.org/licenses/MIT)

Before contributing, commenting or interacting with this project in any form, please, make sure you read and understand our [Code of Conduct](COC.md)
