# chalupecky.dev

Personal website built with Hugo and hosted on Netlify at
<https://www.chalupecky.dev/>. The source is Markdown, Go templates, and static
assets. No Node.js, npm packages, Go installation, or database is needed to build
this site.

## Requirements

- Hugo **0.168.0**. The standard and extended editions both work with this site.
- Make and a POSIX shell (included with the usual macOS/Linux development tools).

The version is pinned in `netlify.toml`. The Makefile reads that same pin and
rejects a different local Hugo version, so local builds and Netlify use the same
generator. Check your installation with `hugo version` or `make check-version`.

On macOS, `brew install hugo` installs the current Homebrew version. If that no
longer matches the pin, install the matching binary for your OS and architecture
from the [Hugo 0.168.0 release](https://github.com/gohugoio/hugo/releases/tag/v0.168.0).
Verify the download against the checksums included with the release. You can use
an alternate binary without replacing your system installation:

```sh
make build HUGO=/absolute/path/to/hugo
```

## Local development

```sh
make serve
```

Open <http://localhost:1313/>. Hugo watches the source files and refreshes the
preview when they change. The preview is rendered in memory and does not overwrite
the production output in `public/`. Stop the server with Ctrl-C. To include drafts:

```sh
make serve HUGO_ARGS="--buildDrafts"
```

## Production build

```sh
make build
```

The output goes into `public/`. The build removes stale files from that output
directory; do not put hand-maintained files there. Generated output, Hugo's build
lock, generated resources, and Netlify CLI state are ignored by Git.

To make Hugo fail on warnings during an upgrade or configuration change:

```sh
make build HUGO_ARGS="--panicOnWarning"
```

## Project layout

| Path | Purpose |
| --- | --- |
| `hugo.toml` | Site configuration, primary URL, menus, and author settings |
| `content/` | Markdown pages and their front matter |
| `layouts/` | Site-specific homepage, section templates, social links, and RSS |
| `assets/css/site.css` | Shared styles for redesigned pages, processed and fingerprinted by Hugo |
| `static/` | Site-specific files copied directly into the output |
| `themes/whiteplain/` | Vendored Whiteplain theme, including its original license |
| `netlify.toml` | Hugo version and production/preview build settings |
| `Makefile` | Version check, local preview, and production build commands |

Whiteplain is committed directly to this repository, so there are no submodules
or theme downloads during a build. Its templates have local compatibility changes
for current Hugo: the new template directory structure, locale API, and embedded
partials. The main pages use project-owned templates and shared styles, without the theme’s
CSS, JavaScript, or CDN requests. Whiteplain still supplies the utility pages
(such as the 404 page and empty taxonomies).
The upstream README and example site under the theme are reference material,
not the configuration used to build this website.

### Redesigned pages

Edit the introduction in `content/_index.md`, including its title, subtitle, and
description. The layout is in `layouts/home.html`; its profile and contact links
use the author settings in `hugo.toml`. The supporting-page links and their short
descriptions are in the homepage template.

Engineering & open source retains the `/oss/` URL. Edit its content in
`content/oss/_index.md` and its layout in `layouts/oss/section.html`. The redesigned
pages share `layouts/_partials/modern/` and `assets/css/site.css`.

The Research overview is in `content/research/_index.md`. Publications and talks
retain their original `/publications/` and `/talks/` URLs and content files. Their
shared layout is `layouts/_partials/modern/article.html`; front matter supplies
the eyebrow, introduction, research navigation, and bibliography list styling.
Research pages have `research = true`; `archiveList = true` enables the more
spacious reference lists. Heading text generates the on-page navigation.

The redesigned pages use system fonts, the existing avatar, and plain CSS with automatic
light/dark colours. Hugo minifies and fingerprints `assets/css/site.css`; no
additional tooling is required. Preview with `make serve` and check both wide and
narrow windows. Publication and event records retain their original citations, dates, and links.

`layouts/_partials/copyright.html` renders the copyright for all page footers and
RSS feeds. The owner is `copyright` in `hugo.toml`, and `params.copyrightStartYear`
is the first year. The final year comes from the build date, so the range updates
on the next build in a new year.

`layouts/all.rss.xml` preserves the existing feed metadata and dates. The site
currently has section pages but no regular posts; the newer built-in RSS template
would otherwise emit an empty `lastBuildDate` for those feeds.

## Netlify

The repository's `netlify.toml` specifies the Hugo version, the `make build`
command, and the `public` publish directory. Production uses the primary URL in
`hugo.toml`. Deploy previews and branch deploys use Netlify's `DEPLOY_PRIME_URL`,
so their generated absolute URLs point to the preview itself.

Keep using the existing Netlify project and Legacy Free plan. No plan change is
required for these build settings. In that project's dashboard, verify:

- The connected repository is `vladimir-ch/chalupecky.dev` and the production
  branch is `master`.
- The base directory is the repository root.
- The primary domain is `www.chalupecky.dev`, with `chalupecky.dev` redirecting to
  it and HTTPS enabled.
- There are no context-specific environment overrides selecting a different
  Hugo version or changing the production URL.

The repository configuration does not configure the account plan, Git connection,
DNS, or domain redirects. Those remain Netlify/DNS settings. Once continuous
deployment is configured, pushing to `master` publishes production; use a pull
request and a Netlify Deploy Preview to review changes before merging.

## Updating Hugo

1. Install the intended Hugo release and update `HUGO_VERSION` in `netlify.toml`.
2. Update the documented version and release link above.
3. Read the Hugo release notes and run `make build HUGO_ARGS="--panicOnWarning"`.
4. Use `make serve` and a Deploy Preview to check the homepage, all three main
   sections, light/dark styles, mobile layout, the 404 page, and RSS/sitemap output.
5. Review template changes separately from content or design changes, then merge
   when the preview is correct.

The generated `public/` directory can also be served by any static web server;
the source and theme do not depend on Netlify-specific rendering or APIs.
