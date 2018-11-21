FROM redis:5

COPY create-cluster.sh create-cluster.sh

EXPOSE 6379-6381

ENTRYPOINT ["./create-cluster.sh"]
