#if !defined(SECRET_HANDSHAKE_H)
#define SECRET_HANDSHAKE_H

#include <vector>
#include <string>
#include <cstdint>

namespace secret_handshake {
    std::vector<std::string> commands(uint8_t secret);
}

#endif // SECRET_HANDSHAKE_H
