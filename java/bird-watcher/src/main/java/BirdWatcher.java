
class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public int[] getLastWeek() {
        int[] lastWeek = new int[] { 0, 2, 5, 3, 7, 8, 4 };
        return lastWeek;
    }

    public int getToday() {
        return this.birdsPerDay[this.birdsPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        this.birdsPerDay[this.birdsPerDay.length - 1] += 1;
    }

    public boolean hasDayWithoutBirds() {
        for (int count: this.birdsPerDay) {
            if (count == 0) return true;
        } 

        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        int count = 0;
        numberOfDays = numberOfDays > 7 ? 7 : numberOfDays;
        for (int i = 0; i < numberOfDays; i++) {
            count += this.birdsPerDay[i];
        }
        return count;
    }

    public int getBusyDays() {
        int busyDays = 0;
        for (int count: this.birdsPerDay) {
            if (count >= 5) busyDays++;
        }
        return busyDays;
    }
}
