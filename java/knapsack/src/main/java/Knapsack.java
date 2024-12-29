import java.util.List;

class Knapsack {

    int maximumValue(int maximumWeight, List<Item> items) {
        return knapsack(items.size() - 1, maximumWeight, items);
    }

    int knapsack(int idx, int cap, List<Item> items) {
        if (idx == -1 || cap == 0) return 0;
        Item it = items.get(idx);
        if (it.weight > cap) return knapsack(idx - 1, cap, items);
        int x = knapsack(idx - 1, cap, items);
        int y = it.value + knapsack(idx - 1, cap - it.weight, items);
        return Math.max(x, y);
    }

}