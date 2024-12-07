class EmptyBufferException extends Exception("Buffer is empty")

class FullBufferException extends Exception("Buffer is full")

class CircularBuffer(size: Int) {
  private var buf = Array.fill(size)(Option.empty[Int])
  private var readIdx, writeIdx = 0

  def write(value: Int): Unit = buf(writeIdx) match {
    case Some(_) => throw new FullBufferException
    case None =>
      buf(writeIdx) = Some(value)
      writeIdx = (writeIdx + 1) % size
  }

  def read(): Int = buf(readIdx) match {
    case Some(value) =>
      buf(readIdx) = None
      readIdx = (readIdx + 1) % size
      value
    case None => throw new EmptyBufferException
  }

  def overwrite(value: Int): Unit = {
    buf(writeIdx) = Some(value)
    writeIdx = (writeIdx + 1) % size
    readIdx = writeIdx
  }

  def clear(): Unit = {
    buf = Array.fill(buf.length)(None)
    readIdx = 0
    writeIdx = 0
  }
}

