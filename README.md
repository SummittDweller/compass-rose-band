# Compass Rose Band - Hugo Static Site

<!--
## Initializing

```
fin init
```

Will initialize new site, append a test content and compile the site.

Your new site will be instantly available at `http://static.$VIRTUAL_HOST`
-->

## Development

Clone the project to your local workstation using:
```
git clone --recurse-submodules https://github.com/SummittDweller/compass-rose-band.git
```

The use of `--recurse-submodules` ensures that you get all active themes and any other _Git_ submodules that are part of the project.


To develop a Hugo project you need Hugo running in a server mode ([Hugo Quickstart guide](https://gohugo.io/getting-started/quick-start/) for more details).

```
fin develop
```

Starts a Hugo server. The server will be available at `http://$VIRTUAL_HOST`.
Updates as you edit, reload the page to see your changes.

**NOTE:** once started, the Hugo server will run, blocking the console. Kill it with `Ctrl-C`, when you are done.

## Compiling static site

```
fin compile
```

Will re-compile static site into `public` folder. It is available at `http://static.$VIRTUAL_HOST`
