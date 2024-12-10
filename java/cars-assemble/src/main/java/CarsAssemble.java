public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        double modifier = 0;
        if (speed > 9) modifier = 0.77;
        else if (speed > 8) modifier = 0.80;
        else if (speed > 4) modifier = 0.90;
        else if (speed > 0) modifier = 1.0;
        return 221 * speed * modifier;
    }

    public int workingItemsPerMinute(int speed) {
        return (int) (this.productionRatePerHour(speed) / 60);
    }
}
