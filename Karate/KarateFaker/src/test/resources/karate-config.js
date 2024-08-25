function fn() {
   var config = {
   urlBase: 'https://reqres.in',
   urlBaseLogin: 'https://api.realworld.io/',
   api:{
   pathGet: '/api/users?page=2',
   pathPost: '/api/users'
   }
  };
  return config;
}