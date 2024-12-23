#include "all_your_base.h"

#include <algorithm>
#include <cmath>
#include <stdexcept>

namespace all_your_base {
    std::vector<uint> convert(int base, std::vector<uint> digits, int target) {
        if (base <= 1 || target <= 1) {
            throw std::invalid_argument("Base and target must be greater than 1.");
        }
        
        uint value = 0;
        for (size_t i = 0; i < digits.size(); ++i) {
            if (digits[i] >= static_cast<uint>(base)) {
                throw std::invalid_argument("Invalid base.");
            }
            
            value += digits[i] * static_cast<int>(std::pow(base, digits.size() - 1 - i));
        }

        std::vector<uint> vec = {};
        while (value > 0) {
            vec.push_back(value % target);
            value = value / target;
        }

        std::reverse(vec.begin(), vec.end());
        return vec;
    }
}
