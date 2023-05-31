package examples.cydeo;

import com.intuit.karate.junit5.Karate;

class CydeoRunner {

    @Karate.Test
    Karate testFeatures() {
        return Karate.run("dataDrivenTests").tags("@dataDriven").relativeTo(getClass());
    }
}
