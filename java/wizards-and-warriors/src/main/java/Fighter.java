class Fighter {
    boolean isVulnerable() { return true; }

    int getDamagePoints(Fighter fighter) { return 1; }

    @Override
    public String toString() { return "Fighter is a " + this.getClass().getSimpleName(); }
}

class Warrior extends Fighter {
    @Override
    boolean isVulnerable() { return false; }

    @Override
    int getDamagePoints(Fighter fighter) { return fighter.isVulnerable() ? 10 : 6; }

    @Override
    public String toString() { return super.toString(); }
}

class Wizard extends Fighter {
    private boolean spellReady = false;

    void prepareSpell() { this.spellReady = true; }

    @Override
    boolean isVulnerable() { return !this.spellReady; }

    @Override
    int getDamagePoints(Fighter fighter) { return this.spellReady ? 12 : 3; }

    @Override
    public String toString() { return super.toString(); }
}
