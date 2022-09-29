#!/usr/bin/python

import sys

input_path = sys.argv[1]
file = open(input_path, 'r')
Lines = file.readlines()
TILEMAP_SIZE = 65536
MESH_INDEX = 1
cells = []

# is_tilemap = False
# for line in Lines:
#     if line.startswith("#TILEMAP"):
#         is_tilemap = True
#         continue

#     if is_tilemap:
#         line = line.strip()
#         a = line.split()
#         x = int(a[0])
#         y = int(a[1])
#         z = int(a[4])
#         cells.append(f"{x}, {y + z * TILEMAP_SIZE}, {MESH_INDEX}")

is_heightmap = False
for line in Lines:
    if line.startswith("#"):
      if line.startswith("#HEIGHTMAP"):
          is_heightmap = True
          continue
      else:
          is_heightmap = False

    if is_heightmap:
        line = line.strip()
        a = line.split()
        x = int(a[0])
        y = int(a[1])
        h = int(a[2], base=16)
        for z in range(0, h + 1):
            cells.append(f"{x + z * TILEMAP_SIZE}, {y}, {MESH_INDEX}")

print(", ".join(cells))
