# Gravity Xapp

Node middleware that fetches an xapp token, stores it in sharify data, and expires it.

Use is like so...

````coffeescript
app.use require('gravity-xapp')
  gravityUrl: 'http://artsy.net'
  clientId: '133fsa3'
  clientSecret: 'f32j13f'
  sharifyData: require('sharify').data
````