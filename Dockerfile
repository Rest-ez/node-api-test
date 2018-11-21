FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
RUN npm install -g sequelize-cli
RUN npm install --save express
RUN npm install --save express
RUN npm install --save body-parser
RUN npm install --save morgan

#install local sequelize package dependency 
RUN npm install --save sequelize pg pg-hstore


RUN sequelize init

# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 8000
CMD [ "npm", "run", "start:dev" ]


