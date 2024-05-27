pub struct Allergies(u32);

#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Allergen {
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128,
}

impl Allergen {
    pub fn into_iter() -> core::array::IntoIter<Allergen, 8> {
        [
            Allergen::Eggs,
            Allergen::Peanuts,
            Allergen::Shellfish,
            Allergen::Strawberries,
            Allergen::Tomatoes,
            Allergen::Chocolate,
            Allergen::Pollen,
            Allergen::Cats,
        ].into_iter()
    }
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Allergies(score)
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.0 & (*allergen as u32) != 0
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        Allergen::into_iter()
            .filter(|allergen| self.is_allergic_to(allergen))
            .collect()
    }
}
