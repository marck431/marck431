package runners;

import com.intuit.karate.junit5.Karate;

public class KarateNewUserRunner {
    @Karate.Test
    Karate testRest(){
        return Karate.run("classpath:/features/create_new_user.feature");
    }
}
