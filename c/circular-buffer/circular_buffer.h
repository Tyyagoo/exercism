#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

typedef int buffer_value_t;

typedef struct {
  int capacity;
  int reader;
  int writer;
  buffer_value_t *data;
} circular_buffer_t;

circular_buffer_t* new_circular_buffer(int capacity);
int read(circular_buffer_t *buffer, buffer_value_t *read_value);
int write(circular_buffer_t *buffer, buffer_value_t write_value);
int overwrite(circular_buffer_t *buffer, buffer_value_t write_value);
void clear_buffer(circular_buffer_t *buffer);
void delete_buffer(circular_buffer_t *buffer);

#endif
