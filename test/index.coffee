sinon = require 'sinon'
express = require 'express'
artsyXappMiddleware = require '../'
request = require 'superagent'
moment = require 'moment'

sharifyData = {}
app = express()
gravity = express()

app.use artsyXappMiddleware
    gravityUrl: 'http://localhost:5000'
    clientId: 'fooid'
    clientSecret: 'foosecret'
    sharifyData: sharifyData
app.get '/foo', (req, res) ->
  res.send 'foo'
gravity.get '/api/v1/xapp_token', (req, res, next) ->
  res.send { xapp_token: 'x-foo-token', expires_in: moment().add('seconds', 2).format() }

describe 'artsyXappMiddleware', ->

  gravity.listen 5000
  app.listen 4000


  it 'fetches an xapp token and stores it in sharify data', (done) ->
    request('http://localhost:4000/foo').end (res) ->
      sharifyData.GRAVITY_XAPP_TOKEN.should.equal 'x-foo-token'
      done()

  it 'expires the token after the expiration time', (done) ->
    sharifyData.GRAVITY_XAPP_TOKEN = null
    request('http://localhost:4000/foo').end (res) ->
      sharifyData.GRAVITY_XAPP_TOKEN.should.equal 'x-foo-token'
      setTimeout ->
        (sharifyData.GRAVITY_XAPP_TOKEN?).should.not.be.ok
        done()
      , 2000