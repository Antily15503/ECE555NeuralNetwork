import re

def percep(x0,x1,w0,w1,w2):
  return x0*w0+x1*w1+w2 if (x0*w0+x1*w1+w2) > 0 else 0

limits = [-1,0,1]

target = "Neuron"
testbench = f"{target}_tb"

testbench_write = ""

with open("base.txt", "r") as file:
  while line := file.readline():
    testbench_write += line

# Generate an exaustive list of all possible inputs
list = []
for x0 in limits:
    for x1 in limits:
        for w0 in limits:
            for w1 in limits:
                for w2 in limits:
                    list.append((x0, x1, w0, w1, w2, percep(x0,x1,w0,w1,w2)))

# Decimal to bit mapper (since 2 bit only)
def bits(x):
  if x == -1: return (0.9, 0.9)
  if x == 0: return (0, 0)
  if x == 1: return (0.9, 0)

# Generate initial start of PWLs
v = []
prev = []
x = 0
for _ in range(3):
  v.append("")
  prev.append([])
for i in range(3,7):
  v.append(f"v{i} X{int((i - 3) / 2)}<{x}> 0 pwl")
  prev.append([0, 0])
  x ^= 1
for i in range(7,13):
  v.append(f"v{i} W0{int((i - 7) / 2)}<{x}> 0 pwl")
  prev.append([0, 0])
  x ^= 1
v.append("")

tests = ""

# Generate PWLs based on list of inputs
# Rise/Fall time = 25ps
time = 0.0
for (index,a) in enumerate(list):
  for j in range(3,13,2):
    for i in range(2):
      if (bit := bits(a[int((j - 3) / 2)]))[i] != prev[j][i]:
        if (time == 0):
          v[j+i] += f" {time}n {bit[i]}v"
        else:
          v[j+i] += f" {time}n {prev[j][i]}v {time+0.025}n {bit[i]}v"
        prev[j][i] = bit[i]
  str_time = str(time).replace('.','_')
  # Generate tests for each input following:
  # 1. Measures output after 400ps (guaranteed stable value)
  # 2. If output >= 0.45, set to 1
  # 3. Convert output bits to signed decimal
  # 4. Compare to expected output
  # 4.1. 0 -> fail, 1.0000 -> pass
  for i in range(2):
    tests += f".MEAS Z{i}_at_{str_time}n FIND V(Z0<{i}>) AT={time + 0.9}n\n"
  tests += f".MEAS BLANK{str_time} PARAM 0\n"
  tests += f".MEAS TEST{index} PARAM 'abs(((Z0_at_{str_time}n >= 0.45) + (Z1_at_{str_time}n >= 0.45) * 2) - ({a[5]})) < 0.01'\n\n"
  time += 1

# Because W20 is 3 bits, tie bit 2 to bit 1.
v[13] = v[12].replace("v12", "v13").replace("<1>", "<2>")

# Build the test bench file
testbench_write = testbench_write.replace("[target]", f"{target}.sp")
testbench_write = testbench_write.replace("[testbench]", testbench)
testbench_write = testbench_write.replace("[inputs]", "\n".join(v[3:]))
testbench_write = testbench_write.replace("[test]", tests)
testbench_write = testbench_write.replace("[stop]", str(time+0.5))

with open(f"{testbench}.sp", "+w") as file:
  file.write(testbench_write)
