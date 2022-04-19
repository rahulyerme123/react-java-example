
FROM node:16.13

WORKDIR /Reactjava/react-java-example/src/main/ui

<<<<<<< HEAD
COPY /Reactjava/react-java-example/src/main/ui/package.json ./
=======
COPY package.json .
>>>>>>> e2e3bd0536ea63069dbaba9510608de7a3af5bc4

RUN npm install


COPY . .


EXPOSE 4200


CMD ["npm", "start"]
<<<<<<< HEAD

=======
>>>>>>> e2e3bd0536ea63069dbaba9510608de7a3af5bc4
