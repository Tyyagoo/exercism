#include "secret_handshake.h"

#include <algorithm>

namespace secret_handshake {
    std::vector<std::string> commands(uint8_t secret) {
        std::vector<std::string> vec;
        
        if (secret & 1) vec.push_back("wink");
        if (secret & 2) vec.push_back("double blink");
        if (secret & 4) vec.push_back("close your eyes");
        if (secret & 8) vec.push_back("jump");
        if (secret & 16) std::reverse(vec.begin(), vec.end());
        
        return vec;
    }
}
