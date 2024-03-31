import gleam/option.{type Option, None, Some}
import gleam/int.{max}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(health: 0, level: lvl, ..) if lvl >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
    Player(health: 0, ..) -> Some(Player(..player, health: 100))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player {
    Player(mana: Some(m), ..) if m >= cost -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    Player(mana: None, health: h, ..) -> #(Player(..player, health: max(h - cost, 0)), 0) 
    _ -> #(player, 0)
  }
}
