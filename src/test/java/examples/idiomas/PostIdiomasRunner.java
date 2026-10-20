package examples.idiomas;

import com.intuit.karate.junit5.Karate;

class PostIdiomasRunner {

    @Karate.Test
    Karate testPostIdiomas() {
        return Karate.run("post-idiamos").relativeTo(getClass());
    }
}

