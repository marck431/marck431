function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl : 'https://api.realworld.io/api/'
  };
  if (env == 'dev') {
  config.userEmail = 'mar@gmail.com'
  config.userPassword = 'Marcos1205'

  } else if (env == 'qa') {
  config.userEmail = 'mar2@gmail.com'
  config.userPassword = 'Marcos0512'

  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  var accessToken = karate.callSingle('classpath:conduitApp/helpers/create_token.feature',config).authToken

  karate.configure ('headers',{Authorization: 'Token '+ accessToken})
  return config;
}