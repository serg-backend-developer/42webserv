NAME = webserv

CC = c++ #-g

CFLAGS = -Wall -Werror -Wextra -std=c++98

SRCS = main.cpp Server.cpp ConfigParser.cpp ServerConfig.cpp SocketManager.cpp HttpRequest.cpp HttpResponse.cpp Connection.cpp CGIManager.cpp Logger.cpp

OBJ_DIR = obj
OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.cpp=.o))

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

$(OBJ_DIR)/%.o : %.cpp
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
