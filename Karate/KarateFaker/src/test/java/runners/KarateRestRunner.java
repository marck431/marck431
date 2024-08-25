package runners;

import com.intuit.karate.junit5.Karate;

public class KarateRestRunner {
    @Karate.Test
    Karate testRest(){
        return Karate.run("classpath:/features/api_rest.feature");
    }
}
