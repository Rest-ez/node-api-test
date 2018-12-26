FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN sudo npm install -g nodemon
RUN sudo npm install -g sequelize-cli
RUN npm install --save express
RUN npm install --save body-parser
RUN npm install --save morgan
RUN npm install --save cors


#install local sequelize package dependency 
RUN npm install --save sequelize pg pg-hstore
#requires postgres daabase to be installed on localhost with configuration file for dev environment updated for actual databse credentials
RUN sequelize init

#the following is optional for environment where db hasn't been created
#RUN createdb todos-dev

#the following is run to create user model and migration, forcing if User model is already in codebase
RUN sequelize model:create --name User --attributes fullname:string,ssn:string -f

#do the database migration - create User table
RUN sequelize db:migrate

# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 8000
CMD [ "npm", "run", "start:dev" ]


