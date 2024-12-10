public class Lasagna {
    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int already) {
        return this.expectedMinutesInOven() - already;
    }

    public int preparationTimeInMinutes(int layers) {
        return layers * 2;
    }

    public int totalTimeInMinutes(int layers, int already) {
        return this.preparationTimeInMinutes(layers) + already;
    }
}
