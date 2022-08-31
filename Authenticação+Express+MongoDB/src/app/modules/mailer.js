const nodemailer = require('nodemailer')
const path = require('path')
const hbs = require('nodemailer-express-handlebars')
const {host,port,user,pass} = require('../../config/mail.json')
var transport = nodemailer.createTransport({
  host: "smtp.mailtrap.io",
  port: 2525,
  auth: {
    user: "18262a24fbb82a",
    pass: "91b95143ca5fd5"
  }
});
transport.use('compile', hbs({
  viewEngine: {
    defaultLayout: undefined,
    partialsDir: path.resolve('./src/resources/mail/')
  },
  viewPath: path.resolve('./src/resources/mail/'),
  extName: '.html',
}));

  module.exports = transport