NAME = push_swap

CC = cc
CFLAGS = -Wall -Wextra -Werror

LIBFT = ./libft/libft.a
LIBFT_DIR = libft

SRCS = src/utils.c src/move.c src/sort.c src/main.c
OBJ = $(SRCS:.c=.o)

RM = rm -rf

all: LIBFT $(NAME)

$(NAME): $(OBJ) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT) -o $(NAME)

LIBFT:
	@make -C $(LIBFT_DIR)

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@$(RM) $(OBJ)
	@make -C $(LIBFT_DIR) clean

fclean: clean
	@$(RM) $(NAME)
	@make -C $(LIBFT_DIR) fclean

re: fclean all

.PHONY: all clean fclean re 
