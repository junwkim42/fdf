# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: junwkim <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/23 18:34:20 by junwkim           #+#    #+#              #
#    Updated: 2019/04/24 06:50:13 by junwkim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

FLAGS = -Wextra -Wall -Werror -g

SRCS =	srcs/main.c \
		srcs/ft_checker.c \
		srcs/list.c \
		srcs/bresenham.c \
		srcs/dessin.c \
	    srcs/window.c

OBJ =	$(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	make -C libft
	gcc $(FLAGS) -L minilibx libft/libft.a -lmlx -framework OpenGL -framework AppKit -I minilibx $^ -o $(NAME)

%.o : srcs/%.c include/fdf.h
	gcc $(FLAGS) -I include/ -c $< -o $@

clean:
	@make clean -C libft
	@rm -f $(OBJ)

fclean: clean
	@make fclean -C libft
	@rm -f $(NAME)

re: fclean all

.PHONY: all fclean clean re lib
