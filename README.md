# Artsy Xapp Middleware

Node middleware that fetches an xapp token from Artsy and stores it in [sharify](https://github.com/artsy/sharify) data, and expires it.

Use like so...

````coffeescript
app.use require('artsy-xapp-middlware')
  artsyUrl: 'http://artsy.net'
  clientId: '133fsa3'
  clientSecret: 'f32j13f'
  sharifyData: require('sharify').data
````

then access the xapp token via `sd.GRAVITY_XAPP_TOKEN`
