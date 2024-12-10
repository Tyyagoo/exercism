public class ElonsToyCar {
    private int battery = 100;
    private int meters = 0;
    
    public static ElonsToyCar buy() {
        return new ElonsToyCar();
    }

    public String distanceDisplay() {
        return "Driven " + this.meters + " meters";
    }

    public String batteryDisplay() {
        if (this.battery == 0) return "Battery empty";
        else return "Battery at " + this.battery + "%";
    }

    public void drive() {
        if (this.battery == 0) return;
        this.battery -= 1;
        this.meters += 20;
    }
}
