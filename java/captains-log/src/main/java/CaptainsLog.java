import java.util.Random;

class CaptainsLog {

    private static final char[] PLANET_CLASSES = new char[]{'D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y'};

    private Random random;

    CaptainsLog(Random random) {
        this.random = random;
    }

    char randomPlanetClass() {
        return PLANET_CLASSES[this.random.nextInt(PLANET_CLASSES.length)];
    }

    String randomShipRegistryNumber() {
        int rnd = this.random.nextInt(9000) + 1000;
        return "NCC-" + rnd;
    }

    double randomStardate() {
        return this.random.nextDouble() * 1000 + 41000;
    }
}
