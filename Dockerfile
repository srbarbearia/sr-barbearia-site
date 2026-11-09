FROM alpine:3.20 AS imagens
RUN apk add --no-cache imagemagick
WORKDIR /img
COPY logo.png .
# favicon (192x192) e imagem de compartilhamento (1200x630) gerados a partir da logo
RUN magick logo.png -resize 172x172 -background "#050B15" -gravity center -extent 192x192 favicon.png \
 && magick logo.png -resize 760x520 -background "#050B15" -gravity center -extent 1200x630 -quality 85 og.jpg

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html logo.png /usr/share/nginx/html/
COPY --from=imagens /img/favicon.png /img/og.jpg /usr/share/nginx/html/
EXPOSE 80
