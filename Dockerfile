FROM kevinelg/hugo-asciidoc

LABEL "com.github.actions.name"="git Actions"
LABEL "com.github.actions.description"="Run hugo commands"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="https://github.com/kevintruong/hugo-adoc-action.git"
LABEL "homepage"="https://github.com/kevintruong/hugo-adoc-action.git"

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh