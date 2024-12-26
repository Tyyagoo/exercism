object Color extends Enumeration {
  val Red, Green, Yellow, Blue, Ivory = Value
}

object Pet extends Enumeration {
  val Dog, Zebra, Fox, Horse, Snail = Value
}

object Drink extends Enumeration {
  val Water, OrangeJuice, Milk, Coffee, Tea = Value
}

object Hobby extends Enumeration {
  val Football, Chess, Painting, Reading, Dancing = Value
}

object ZebraPuzzle extends Enumeration {
  import Color._, Pet._, Drink._, Hobby._

  type Resident = Value
  val Englishman, Spaniard, Ukrainian, Norwegian, Japanese = Value

  case class Solution(waterDrinker: Resident, zebraOwner: Resident)

  lazy val solve: Solution = (for
      rs <- perms(ZebraPuzzle)
        // 10. The Norwegian lives in the first house.
        if rs.indexOf(Norwegian) == 0;
      cs <- perms(Color)
        // 2. The Englishman lives in the red house.
        if rs.indexOf(Englishman) == cs.indexOf(Red)
        // 6. The green house is immediately to the right of the ivory house.
        if cs.indexOf(Green) == cs.indexOf(Ivory) + 1
        // 15. The Norwegian lives next to the blue house.
        if next_to(rs.indexOf(Norwegian), cs.indexOf(Blue));
      ds <- perms(Drink)
        // 4. The person in the green house drinks coffee.
        if cs.indexOf(Green) == ds.indexOf(Coffee)
        // 5. The Ukrainian drinks tea.
        if rs.indexOf(Ukrainian) == ds.indexOf(Tea)
        // 9. The person in the middle house drinks milk.
        if ds.indexOf(Milk) == 2;
      ps <- perms(Pet)
        // 3. The Spaniard owns the dog.
        if rs.indexOf(Spaniard) == ps.indexOf(Dog);
      hs <- perms(Hobby)
        // 7. The snail owner likes to go dancing.
        if hs.indexOf(Dancing) == ps.indexOf(Snail)
        // 8. The person in the yellow house is a painter.
        if hs.indexOf(Painting) == cs.indexOf(Yellow)
        // 11. The person who enjoys reading lives in the house next to the person with the fox.
        if next_to(hs.indexOf(Reading), ps.indexOf(Fox))
        // 12. The painter's house is next to the house with the horse.
        if next_to(hs.indexOf(Painting), ps.indexOf(Horse))
        // 13. The person who plays football drinks orange juice.
        if hs.indexOf(Football) == ds.indexOf(OrangeJuice)
        // 14. The Japanese person plays chess.
        if hs.indexOf(Chess) == rs.indexOf(Japanese)
    yield Solution(
      waterDrinker = rs(ds.indexOf(Water)),
      zebraOwner = rs(ps.indexOf(Zebra))
    )).next
}

def next_to(x: Int, y: Int): Boolean = {
  (x - y).abs == 1
}

def perms(e: Enumeration): Iterator[List[e.Value]] = {
  e.values.toList.permutations
}
