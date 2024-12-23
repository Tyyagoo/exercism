public class GameMaster {
    public String describe(Character c) {
        return "You're a level " + c.getLevel() + " " + c.getCharacterClass() + " with " + c.getHitPoints() + " hit points.";
    }

     public String describe(Destination d) {
        return "You've arrived at " + d.getName() + ", which has " + d.getInhabitants() + " inhabitants.";
    }

     public String describe(TravelMethod t) {
         if (t == TravelMethod.WALKING) {
             return "You're traveling to your destination by walking.";
         } else {
             return "You're traveling to your destination on horseback.";
         }
    }

     public String describe(Character c, Destination d, TravelMethod t) {
        return describe(c) + " " + describe(t) + " " + describe(d);
    }

     public String describe(Character c, Destination d) {
        return describe(c, d, TravelMethod.WALKING);
    }
}
