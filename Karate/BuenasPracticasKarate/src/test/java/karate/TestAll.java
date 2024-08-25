package karate;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class TestAll {
    private static final String CLASSPATH_KARATE = "classpath:karate";
    private static final String TAG_IGNORE = "~@ignore";

    @Test
    void testAll(){
        Results results = Runner.path(CLASSPATH_KARATE)
                .outputCucumberJson(true)
                .tags(TAG_IGNORE)
                .parallel(1);
    }
}
