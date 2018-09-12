# thorhousebot

A personal bot for the Thorhouse bros.

Built using [flottbot](https://github.com/target/flottbot)!

## Getting Started

This setup is mainly for Mac users. 

If you have a Windows machine, glhf.

### Prerequisites

1. Install the following software on your machine:

    * [Git](https://git-scm.com/)
    * [Docker](https://docs.docker.com/docker-for-mac/install/)

2. Create a GitHub account

3. Create a [Docker Hub](https://hub.docker.com/) account

### Setup the project

1. Open your terminal and make a project directory by typing (don't include the '$' signs):

    ```sh
    $ mkdir -p github.com/pa3ng
    $ cd github.com/pa3ng
    ```

2. Clone the project down from this repo:

    ```sh
    $ git clone https://github.com/pa3ng/thorhousebot.git
    $ cd thorhousebot
    ```

2. Set environment variables first:

    ```sh
    $ export SLACK_TOKEN=abcdegf # not the real value
    # optional environment variables
    $ export GHE_API_BASE_URL=https://api.github.com
    $ export GHE_TOKEN=fgedcba # not the real value
    ```

    * See `#thorhousebot-dev` channel topic for the SLACK_TOKEN value
    * [Create your own GHE_TOKEN (a.k.a. personal access token) from your account](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

3. Buld the bot's Docker image

    ```sh
    $ docker build -t thorhousebot .
    ```

    * The heck is a [Docker image](https://docs.docker.com/get-started/#images-and-containers)?

### Run the bot locally

Run the bot via running its Docker image:

```sh
$ docker run -it -e SLACK_TOKEN thorhousebot
```

* `-e SLACK_TOKEN` utilizes the `SLACK_TOKEN` environment variable you set above

If you want to be able to use the zen command, then instead run:

```sh
$ docker run -it -e SLACK_TOKEN -e GHE_TOKEN -e GHE_API_BASE_URL thorhousebot
```

* `-e GHE_TOKEN -e GHE_API_BASE_URL` uses said environment variables to make calls to the GitHub API.
* The `zen` command, for example, makes calls to `https://api.github.com/zen` which returns technical proverbs.


### Adding functionality

The bot uses `rules` (see [`config/rules`](https://github.com/pa3ng/thorhousebot/tree/master/config/rules) directory) to determine its behavior.

If you want to add a new behavior, create and add your own rule YAML file, e.g. `myrule.yml`, in the `config/rules` directory.

Once you've added your rule, make sure to rebuild your the Docker image before running again, i.e.

 ```sh
$ docker build -t thorhousebot .
```
