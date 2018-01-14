# Wootton Linux Club website

[![license](https://img.shields.io/github/license/twlinux/twlinux.github.io.svg)](https://github.com/twlinux/twlinux.github.io/blob/master/LICENSE)

This site was built with the [Jekyll](https://jekyllrb.com/) theme *[Beautiful Jekyll](https://github.com/daattali/beautiful-jekyll#readme)*. *Beautiful Jekyll* is licensed under the MIT license.

## Local development with Docker

```bash
# 1. build image
docker build -t beautiful-jekyll $PWD
# 2. start container for the first time
docker run -d -p 4000:4000 --name twlinux -v $PWD:/srv/jekyll beautiful-jekyll
# 3. stop the server
docker stop twlinux
# 4. server can be started again
docker start twlinux
```

## Writing blog posts

[Markdown](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf) is much easier to understand than HTML, however it may lack more advanced features. [daattali/beautiful-jekyll](https://github.com/daattali/beautiful-jekyll/tree/master/_posts) features some other non-traditional widgets that can be used in kramdown.

Some ["safe" HTML tags](https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/sanitization_filter.rb#L40) are backwards compatable in a Markdown document.

Blog pages must be named "yyyy-mm-dd-FILENAME.md" (HTML is compatible but not recommended). To use site templates, files that represent web pages must include [YAML front matter](https://github.com/daattali/beautiful-jekyll#last-important-thing-yaml-front-matter-parameters-for-a-page).

## Licensing

[daattali/beautiful-jekyll](https://github.com/daattali/beautiful-jekyll) uses the [MIT license](https://github.com/daattali/beautiful-jekyll/blob/master/LICENSE). The [terminal](https://github.com/numixproject/numix-icon-theme-circle/blob/master/Numix-Circle/48/apps/terminal.svg) avatar image is from the [Numix Project](https://numixproject.org), licensed under [GPL-3.0+](https://github.com/numixproject/numix-icon-theme-circle/blob/master/LICENSE). Contributions made by me belong to the public domain.
