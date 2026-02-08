*This project has been created as part of the 42 curriculum by Shoaib Al-kawaldeh [sal-kawa].*

# push_swap

## Description

**push_swap** is a sorting algorithm project that challenges you to sort a stack of integers using a limited set of operations, with the goal of achieving the lowest possible number of moves. The program receives a list of integers as arguments, representing the initial state of **stack A**, and outputs a sequence of instructions to sort them in ascending order.

The project uses two stacks (**A** and **B**) and a constrained set of operations:

| Operation | Effect |
|-----------|--------|
| `sa` | Swap the first two elements of stack A |
| `sb` | Swap the first two elements of stack B |
| `pa` | Push the top element of stack B onto stack A |
| `pb` | Push the top element of stack A onto stack B |
| `ra` | Rotate stack A upward (first element becomes last) |
| `rb` | Rotate stack B upward (first element becomes last) |
| `rra` | Reverse rotate stack A (last element becomes first) |
| `rrb` | Reverse rotate stack B (last element becomes first) |

### Sorting Strategy

- **2 elements** — a single swap if needed.
- **3 elements** — optimized hard-coded comparisons.
- **4–5 elements** — push the smallest values to stack B, sort the remainder, then push back.
- **6+ elements** — **Radix Sort** on the binary representation of indexed values, processing bit by bit to efficiently sort large inputs.

## Instructions

### Prerequisites

- A Unix-like environment (Linux / macOS) with `make` and `cc` (or `gcc`) installed.

### Compilation

```bash
make
```

This compiles the bundled **libft** library and builds the `push_swap` executable.

Other Makefile targets:

| Target | Description |
|--------|-------------|
| `make clean` | Remove object files |
| `make fclean` | Remove object files and the executable |
| `make re` | Full recompile (`fclean` + `all`) |

### Usage

```bash
./push_swap <list of integers>
```

Arguments can be passed individually or as a single quoted string:

```bash
./push_swap 4 67 3 87 23
./push_swap "4 67 3 87 23"
```

The program prints the sequence of operations to **stdout**, one per line. If the input is already sorted, nothing is printed. Invalid input (duplicates, non-integer values, overflow) causes `Error` to be printed to **stderr**.

### Example

```bash
$ ./push_swap 2 1 3 6 5 8
sa
pb
pb
pb
ra
pa
pa
pa
```

### Verifying the Result

You can count the number of operations:

```bash
./push_swap 3 5 1 4 2 | wc -l
```

## Project Structure

```
.
├── Makefile
├── inc/
│   └── push_swap.h        # Header with struct and function prototypes
├── libft/                  # Custom C library (libft + ft_printf + get_next_line)
└── src/
    ├── main.c              # Argument parsing, entry point
    ├── move.c              # swap, push, rotate operations
    ├── sort.c              # Sorting algorithms (small sets + radix sort)
    └── utils.c             # Stack initialization, indexing, helpers
```
