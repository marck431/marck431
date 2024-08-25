function fn() {
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    karate.configure('ssl', true);

     var baseUrl = karate.properties['baseUrl'] || 'https://reqres.in'
     var namespace = karate.properties['namespace'] || 'api'

    return {
        api:{
             urlBase: baseUrl + '/'+namespace,

        },
        path:{
            loginPetition: '/login',
        }
    };
}