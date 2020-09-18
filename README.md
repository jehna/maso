# Maso

> Masochist template for web development

This project includes a [sadistic CI workflow](/.github/main.workflow) craeted
with [Github Actions](https://developer.github.com/actions/) that runs against
every PR.

## Getting started

Fork this project or [use it as a
template](https://help.github.com/en/articles/creating-a-repository-from-a-template)
for your new project.

This template includes a simple web server that complies to all nags from the
_sadistic CI_ workflow. To start it up, install dependencies with `npm install`
and run:

```shell
npm start
```

This starts a simple node.js webserver that serves files from
[`/public`](/public) folder and listens for the port `8000` (no dependencies!).

After the server has started, you can navigate to http://localhost:8000 and see
the site in action.

## Features

This project aims to have all every strict policy to make modern website
development hard. The work is still in progress, but currently Github Actions
makes sure that on all pull requests:

- [Lighthouse](https://developers.google.com/web/tools/lighthouse/) test gives
  100/100 points on all tests
- Strict ESLint and Prettier rules are fully obliged to

There's also dependabot configuration which ensures that:

- NPM packages are always using latest versions of the packages
- No vulnerable NPM packages are installed in the project

### Motivation / Why would anyone use this?

Have you ever caught yourself making excuses when the client asks why the
website takes five seconds to load? When the website has been filled with tons
of images, trackers, lightbox plugins, slow APIs and other junk, it's much too
late to start asking why nobody brought this stuff up earlier.

It all starts with a bad foundations: Maybe we didnt't install any linters, do
any tests, or maybe using that bloated plugin was just a quick fix that we never
got to do better.

Using Masochist web development template right from the start of a project is
your guard against slowly drifting into code-rotten junkland with your project.
By using the most strict and sadistic CI workflow to always check your code
before merging forces you to be diciplined with your code.

You can use Maso as a leverage during initial implementation phase; it's much
harder for your boss/designer/client to argue with a machine than it is with a
developer.

#### Example 1

Lighthouse test says adding ten images to the front page carousel makes your
site slow (surprise).

Use this as a leverage: It's suddenly not just the developer's problem — you can
bounce back that information and include both business and design to work out
the best way to keep the site running fast and smooth. You just can't add all
those images. The computer says no.

#### Example 2

NPM reports a vulnerability in your web server's version, so Dependabot
automatically creates a new pull request to fix the issue. Leverage this and
treat Dependabot as a productive member of your team.

### To wrap up

The concept of Masochist web development relates familiarly to an older concept
of [Extreme Programming](https://en.wikipedia.org/wiki/Extreme_programming): How
do we make sure we do code reviews? Let's make it impossible _not_ to do them
(pair programming). How do we make sure we do automated tests for our code?
Let's make it impossible to _not_ do tests (test-driven development).

While hooking up a strict, sadistic CI workflow may sound like a big up-front
overhead, the concept is pretty similar to TDD or pair programming; we make it
very hard _not_ to do great code and fast websites.

Delaying problems to when client sees them and complains, now that's even more
masochistic.

## Configuration

Github Actions take some configurations that you can tweak if necessary.

#### PORT

Type: `Number`<br>
Default: `5000`

Your web server should always listen for port defined by environment vairable
`PORT`. This can be changed by probiding an alternative port as `PORT`
environment variable to `Lighthouse` action.

## Contributing

This is an evolving project, and new feature requests and coding help is greatly
appreciated. If you think you could make the saidstic CI workflow even more
sadistic, just open an issue and describe how! Pull requests are also warmly
welcome.

## Licensing

The code in this project is licensed under MIT license.
