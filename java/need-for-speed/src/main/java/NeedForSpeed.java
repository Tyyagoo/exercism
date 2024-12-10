class NeedForSpeed {
    public int speed;
    public int batteryDrain;
    private int battery = 100;
    private int distance = 0;
    
    NeedForSpeed(int speed, int batteryDrain) {
        this.speed = speed;
        this.batteryDrain = batteryDrain;
    }

    public boolean batteryDrained() {
        return battery < batteryDrain;
    }

    public int distanceDriven() {
        return this.distance;
    }

    public void drive() {
        if (this.batteryDrained()) return;
        this.distance += this.speed;
        this.battery -= this.batteryDrain;
    }

    public static NeedForSpeed nitro() {
        return new NeedForSpeed(50, 4);
    }
}

class RaceTrack {
    private int distance;
    
    RaceTrack(int distance) {
        this.distance = distance;
    }

    public boolean canFinishRace(NeedForSpeed car) {
        return ((double) this.distance / car.speed) * car.batteryDrain <= 100;
    }
}
