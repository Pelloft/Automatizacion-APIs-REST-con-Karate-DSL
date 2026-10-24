package examples.idiomas;

import com.intuit.karate.junit5.Karate;

class IdiomasRunner {

    @Karate.Test
    Karate testPostIdiomas() {
        return Karate.run("post-idiomas").relativeTo(getClass());
    }

    @Karate.Test
    Karate testGetIdiomas() {
        return Karate.run("get-idiomas").relativeTo(getClass());
    }

}

