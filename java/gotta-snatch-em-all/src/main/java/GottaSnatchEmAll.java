import java.util.List;
import java.util.Set;
import java.util.HashSet;

class GottaSnatchEmAll {

    static Set<String> newCollection(List<String> cards) { return new HashSet<>(cards); }

    static boolean addCard(String card, Set<String> collection) { return collection.add(card); }

    static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
        Set<String> common = commonCards(List.of(myCollection, theirCollection));
        myCollection.removeAll(common);
        theirCollection.removeAll(common);
        return !myCollection.isEmpty() && !theirCollection.isEmpty();
    }

    static Set<String> commonCards(List<Set<String>> collections) {
        Set<String> intersection = new HashSet<>(collections.get(0));
        for (Set<String> set: collections) {
            intersection.retainAll(set);
        }
        return intersection;
    }

    static Set<String> allCards(List<Set<String>> collections) {
        Set<String> union = new HashSet<String>();
        for (Set<String> set: collections) {
            union.addAll(set);
        }
        return union;
    }
}
