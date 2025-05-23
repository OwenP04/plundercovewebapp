FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY treasure-hunt.html /usr/share/nginx/html/treasure-hunt.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
