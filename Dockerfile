FROM node:16.13

WORKDIR /Reactjava/react-java-example/src/main/ui

COPY package.json .

RUN npm install


COPY . .


EXPOSE 4200


CMD ["npm", "start"]
