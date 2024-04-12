#include <stdlib.h>
#include <errno.h>
#include "circular_buffer.h"

#define WRAPPED_INC(val) \
  *val = (*val + 1) % buffer->capacity

#define PANIC(x) \
  if (!x) { exit(1); }

circular_buffer_t* new_circular_buffer(int capacity) {
  circular_buffer_t *buffer = (circular_buffer_t*)calloc(capacity, sizeof(circular_buffer_t));
  PANIC(buffer);
  buffer->capacity = capacity;
  clear_buffer(buffer);
  return buffer;
}

int read(circular_buffer_t *buffer, buffer_value_t *read_value) {
  if (buffer->data[buffer->reader] == 0) {
    errno = ENODATA;
    return EXIT_FAILURE;
  }
  *read_value = buffer->data[buffer->reader];
  buffer->data[buffer->reader] = 0;
  WRAPPED_INC(&buffer->reader);
  return EXIT_SUCCESS;
}

int write(circular_buffer_t *buffer, buffer_value_t write_value) {
  if (buffer->data[buffer->writer] != 0) {
    errno = ENOBUFS;
    return EXIT_FAILURE;
  }
  buffer->data[buffer->writer] = write_value;
  WRAPPED_INC(&buffer->writer);
  return EXIT_SUCCESS;
}

int overwrite(circular_buffer_t *buffer, buffer_value_t write_value) {
  if (buffer->data[buffer->writer] == 0) return write(buffer, write_value);
  buffer->data[buffer->writer] = write_value;
  WRAPPED_INC(&buffer->reader);
  WRAPPED_INC(&buffer->writer);
  return 0;
}

void clear_buffer(circular_buffer_t *buffer) {
  if (!buffer->data) {
    buffer->data = (buffer_value_t*)malloc(buffer->capacity * sizeof(int));
    PANIC(buffer->data);
  }
  buffer->reader = buffer->writer = 0;
  for (int i = 0; i < buffer->capacity; i++) { buffer->data[i] = 0; }
}

void delete_buffer(circular_buffer_t *buffer) {
  free(buffer->data);
  free(buffer);
}

