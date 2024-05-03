def number_generator(n):
  for i in range(n):
    yield i * 2  # Pause execution and return current value

# Calling the generator function creates a generator object
generator = number_generator(5)

# Iterate through the generator object to get the values
for num in generator:
  print(num)
