FROM tindy2013/subconverter:latest

ENV TZ=Asia/Shanghai
RUN apk add --no-cache tzdata

COPY replacements/snippets/emoji.toml /base/snippets/emoji.toml
COPY replacements/snippets/emoji.txt /base/snippets/emoji.txt

EXPOSE 25500
