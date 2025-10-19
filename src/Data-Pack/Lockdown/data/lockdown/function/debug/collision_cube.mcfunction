# Draw a small cube centered at the current position
#
# ```python3
# L = 0.2
# N = 8
# s = 1/N
# c = '[0.0f, 0.0f, 0.0f]'
# vertices = [[0, 0, 0], [0, 0, 1], [0, 1, 0], [0, 1, 1], [1, 0, 0], [1, 0, 1], [1, 1, 0], [1, 1, 1]]
# vertices = [[-L/2 if j == 0 else L/2 for j in i] for i in vertices]
# edges = [[0, 1], [0, 2], [0, 4], [1, 3], [1, 5], [2, 3], [2, 6], [3, 7], [4, 5], [4, 6], [5, 7], [6, 7]]
# for i1, i2 in edges:
#     x1, y1, z1 = vertices[i1]
#     x2, y2, z2 = vertices[i2]
#     for i in range(N):
#         x = (x2-x1)*i/N - x2
#         y = (y2-y1)*i/N - y2
#         z = (z2-z1)*i/N - z2
#         print(f'particle minecraft:dust{{color: {c},scale: {s}f}} ~{x} ~{y} ~{z} 0.0 0.0 0.0 1.0 1')
# ```

particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.1 ~-0.07500000000000001 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.1 ~-0.05 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.1 ~-0.024999999999999994 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.1 ~0.0 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.1 ~0.024999999999999994 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.1 ~0.05000000000000002 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.1 ~0.07500000000000001 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.07500000000000001 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.05 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.024999999999999994 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.0 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.024999999999999994 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.05000000000000002 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.07500000000000001 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.07500000000000001 ~0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.05 ~0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.024999999999999994 ~0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.0 ~0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.024999999999999994 ~0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.05000000000000002 ~0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.07500000000000001 ~0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.07500000000000001 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.05 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.024999999999999994 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.0 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.024999999999999994 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.05000000000000002 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~0.07500000000000001 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.07500000000000001 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.05 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.024999999999999994 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.0 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.024999999999999994 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.05000000000000002 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.07500000000000001 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~-0.07500000000000001 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~-0.05 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~-0.024999999999999994 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~0.0 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~0.024999999999999994 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~0.05000000000000002 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.1 ~-0.1 ~0.07500000000000001 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.07500000000000001 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.05 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.024999999999999994 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.0 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.024999999999999994 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.05000000000000002 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.07500000000000001 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.07500000000000001 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.05 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.024999999999999994 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.0 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.024999999999999994 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.05000000000000002 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~0.07500000000000001 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~-0.07500000000000001 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~-0.05 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~-0.024999999999999994 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~0.0 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~0.024999999999999994 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~0.05000000000000002 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.1 ~0.07500000000000001 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.07500000000000001 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.05 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.024999999999999994 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.0 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.024999999999999994 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.05000000000000002 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.07500000000000001 ~0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.07500000000000001 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.05 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.024999999999999994 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.0 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.024999999999999994 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.05000000000000002 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~0.07500000000000001 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~-0.1 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~-0.07500000000000001 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~-0.05 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~-0.024999999999999994 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~0.0 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~0.024999999999999994 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~0.05000000000000002 0.0 0.0 0.0 1.0 1
particle minecraft:dust{color: [0.0f, 0.0f, 0.0f],scale: 0.1f} ~-0.1 ~-0.1 ~0.07500000000000001 0.0 0.0 0.0 1.0 1
