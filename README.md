This Docker image is **deprecated**.  Please use the [Heroku-16 image](https://hub.docker.com/r/heroku/heroku/).  
Learn more about [local development with Docker Compose](https://devcenter.heroku.com/articles/local-development-with-docker-compose) and [deploying your image to Heroku](https://devcenter.heroku.com/articles/container-registry-and-runtime). 

# Heroku Gradle Docker Image

This image is for use with Heroku Docker CLI.

## Usage

Your project must contain the following files:

* `gradlew` (see the [Gradle documentation for details](https://docs.gradle.org/current/userguide/wrapper_plugin.html)))
* `gradle/wrapper/gradle-wrapper.jar` (see the [Gradle documentation for details](https://maven.apache.org/guides/index.html))
* `build.gradle` (see the [Gradle documentation for details](https://docs.gradle.org/current/userguide/userguide))
* `Procfile` (see [the Heroku Dev Center for details](https://devcenter.heroku.com/articles/procfile))

Then create an `app.json` file in the root directory of your application with
at least these contents:

```json
{
  "name": "Your App's Name",
  "description": "An example app.json for heroku-docker",
  "image": "heroku/gradle"
}
```

Install the heroku-docker toolbelt plugin:

```sh-session
$ heroku plugins:install heroku-docker
```

Initialize your app:

```sh-session
$ heroku docker:init
Wrote Dockerfile
Wrote docker-compose.yml
```

And run it with Docker Compose:

```sh-session
$ docker-compose up web
```

The first time you run this command, `gradle` will download all dependencies into
the container, build your application, and then run it. Subsequent runs will
use cached dependencies (unless your `*.gradle` files have changed).

You'll be able to access your application at `http://<docker-ip>:8080`, where
`<docker-ip>` is either the value of running `docker-machine ip default` if you are on Mac.
