package demoblaze;

import com.intuit.karate.junit5.Karate;

class DemoblazeRunner {

    @Karate.Test
    Karate testDemoblazeApis() {
        return Karate.run("demoblaze-api").relativeTo(getClass());
    }
}