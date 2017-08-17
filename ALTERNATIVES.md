# Environment Alternatives

## Ubuntu TL;DR

```
sudo apt-get update
sudo apt-get install -y python-pip python-virtualenv build-essential g++ curl libssl-dev apache2-utils software-properties-common unzip wget sudo git
git config --global user.email "you@example.com"
git config --global user.name "Your name"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g bower ember-cli phantomjs-prebuilt
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install -y python3.5 python3.5-dev
sudo pip install cookiecutter
cookiecutter https://bitbucket.org/levit_scs/cc_django_ember_app.git
```

## Nitrous.io free instance

- Go to [nitrous.io](http://nitrous.io)
- Register a free account
- Create a free instance
- Create a new *Ubuntu* project
- Remove everything locate in  `nitrous/code`
- Follow the Ubuntu TL;DR setup
- Edit `&lt;your-project&gt;/front/.ember-cli` and update it to look like this:

```
{
  "disableAnalytics": false,
  "port": 3000,
  "live-reload-port": 8089

}
```

## Vagrant (this is the only alternative that works for Windows)

:warning: First make sure you have [Vagrant](https://www.vagrantup.com/docs/installation/) and [VirtualBox](https://www.virtualbox.org/manual/ch01.html#intro-installing) and [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed.

Then simply run the following commands from the command-line (or GitBash if your are running Windows):

```
git clone https://bitbucket.org/emma_nuelle/c9-vagrant.git
cd c9-vagrant 
vagrant up
```

When the scripts are done running, you'll have a code-editor available on http://localhost:8181 . You can follow the rest of the installtion instructions in the [main README](README.md) and run everything in the terminal of that code-editor.

When you are done using the VirtualMachine, simply run `vagrant halt` to stop it. Whenever you need to use the VM again, got bac to the directory where it was cloned and run `vagrant up` again (don't worry, the whole downloading and installation process only happens the first time you start the machine).

### Note for Windows users

Ember uses the port 49152 by default for it's live-reload service. Unfortunately Windows already uses that port for other purposes. So when installing vagrant under windows, we are forwarding the port 8089 instead. After you are done installing this CookieCutter, amke sure to edit `front/.ember-cli` and update it to look like this:

```
{
  /**
    Ember CLI sends analytics information by default. The data is completely
    anonymous, but there are times when you might want to disable this behavior.

    Setting `disableAnalytics` to true will prevent any data from being sent.
  */
  "disableAnalytics": false,
  "live-reload-port": 8089

}
```

### Troubleshooting

If you are running Windows and get an error message saying `/bin/sh^M: bad interpreter: No such file or directory`, this means you configured git to change line-endings to windows line-endings.

**Don't panic**

Simply convert the files back to unix line-endings by running the following commnds:

```
dos2unix.exe deployment/*
dos2unix.exe scripts/*
dos2unix.exe conf/*
```

Then turn off vagrant and restart it by typing:

```
vagrant halt
vagrant up --provision
```

## Docker

:warning: First make sure you have [Docker](https://docs.docker.com/v1.8/installation/) installed.

Simply run

`docker run -d -p 8181:8181 -p 4200:4200 -p 8000:8000 -p 49152:49152 -h djember-c9 -v /your/workspace/path/:/workspace/ levit/djember-c9`

When the scripts are done running, you'll have a code-editor available on http://localhost:8181 . You can follow the rest of the installtion instructions in the [main README](README.md) and run everything in the terminal of that code-editor.

When you are done using the docker container, simply run `docker stop the_hash_docker_gave_you_upon_running_the_docker_run_command`
