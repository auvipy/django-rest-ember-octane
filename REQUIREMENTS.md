# Requirements

- Git (already configured with username and e-mail)
- Python (preferably 3.5)
- NodeJS (preferably 4.x or 5.x)
- Ember-CLI (2.4.2)
- Wget
- Unzip

## Having troubles installing the cookiecutter or you simply don't want to clutter your environment with tools you will not be using elsewhere?

*Try [our docker container](https://hub.docker.com/r/levit/djember-c9/)* with everything pre-installed, including C9's web editor.

### Docker instructions

- Launch the container using `docker run -d -p 8181:8181 -p 4200:4200 -p 8000:8000 -p 49152:49152 -h djember-c9 -v /your/workspace/path/:/workspace/ levit/djember-c9`
- Go to teh web editor on `http://localhost:8181` or `http://ip_of_docker_vm:8181` depending on your docker setup
- Configure GIT
    - `git config --global user.email "<your email>"`
    - `git config --global user.name "<your name>"`
- install cookiecutter: `sudo pip install cookiecutter`
- install this cookiecutter: `cookiecutter https://bitbucket.org/levit_scs/cc_django_ember_app.git`
- If docker is running in a vm, replace `127.0.0.1` with the ip of the vm in `front/config/envionment.js` and `front/run.sh`

