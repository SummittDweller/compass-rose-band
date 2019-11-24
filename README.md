# Compass Rose Band - Hugo Static Site


## Development

### Clone
Clone the project to your local workstation using:
```
git clone --recurse-submodules https://github.com/SummittDweller/compass-rose-band.git
```

The use of `--recurse-submodules` ensures that you get all active themes and any other _Git_ submodules that are part of the project.

#### Using _GitHub Desktop_
If you `clone` in some other manner without the `--recurse-submodules` flag, as is the case when using _GitHub Desktop_, be sure you also run the following:

```
cd ~/Documents/GitHub/compass-rose-band
git submodule init
git submodule update
```

If you don't do this your submodule(s), and therefore your _Ananke_ theme, will be EMPTY!

### Create a New Branch
Use the following syntax to create a new local branch, and tracked upstream branch, on your workstation before you begin to make changes.
```
git checkout -b <new branch name>
```

## Running the Local Build
To develop a Hugo project you need Hugo running in a server mode ([Hugo Quickstart guide](https://gohugo.io/getting-started/quick-start/) for more details).

```
fin up
fin develop
```

`fin up` starts a minimal _Docksal_ stack.  `fin develop` builds and runs a Hugo server. The server will be available at `http://$VIRTUAL_HOST`.
The site updates as you edit, reload the page to see your changes.

**NOTE:** once started, the Hugo server will run, blocking the console. Kill it with `Ctrl-C`, when you are done.

## Compiling the Static Site

```
fin compile
```

Will re-compile static site into `public` folder. It is available at `http://static.$VIRTUAL_HOST`

## Initializing - Be Very Careful!

This section is at the bottom of the document for a reason...DO NOT REPEAT this, it will reset your site back to an almost empty, original state!
| --- |

```
fin init
```

Will initialize new site, append a test content and compile the site. Your new site will be instantly available at `http://static.$VIRTUAL_HOST`
