# Use official nginx image
FROM nginx:alpine

# Copy your website files to nginx default folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx (already default, but explicit)
CMD ["nginx", "-g", "daemon off;"]