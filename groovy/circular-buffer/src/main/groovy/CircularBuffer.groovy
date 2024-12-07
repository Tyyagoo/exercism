class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {
    Integer[] buf
    int read_idx, write_idx, size

    CircularBuffer(int capacity) {
        this.buf = new Integer[capacity]
        this.size = capacity
        this.clear()
    }

    def clear() {
        this.read_idx = 0
        this.write_idx = 0
        Arrays.fill(this.buf, null)
    }

    def read() {
        if (!this.buf[this.read_idx]) {
            throw new EmptyBufferException()
        }
        Integer item = this.buf[this.read_idx]
        this.buf[this.read_idx] = null
        this.read_idx = (this.read_idx + 1) % this.size
        return item
    }

    def write(int item) {
        if (this.buf[this.write_idx]) {
            throw new FullBufferException()
        }
        this.buf[this.write_idx] = item
        this.write_idx = (this.write_idx + 1) % this.size
    }

    def overwrite(int item) {
        this.buf[this.write_idx] = item
        this.write_idx = (this.write_idx + 1) % this.size
        this.read_idx = this.write_idx // why? only God knows :D
    }
}
