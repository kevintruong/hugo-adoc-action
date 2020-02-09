FROM kevinelg/hugo-asciidoc

LABEL "com.github.actions.name"="git Actions"
LABEL "com.github.actions.description"="Run hugo commands"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="yellow"

LABEL "repository"="http://github.com/srt32/git-actions"
LABEL "homepage"="http://github.com/srt32/git-actions"

RUN apk add --no-cache git bash git-subtree

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh