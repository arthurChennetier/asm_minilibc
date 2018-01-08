LD		=       ld

ASM		=       nasm

RM		 =       rm -f

ASMFLAGS        =       -f elf64

SRCS            =	strlen.asm \
			rindex.asm \
			strchr.asm \
			strpbrk.asm \
			memcpy.asm \
                        memset.asm \
                        strcmp.asm \
                        strncmp.asm \
			strcasecmp.asm \
			strcspn.asm \
			strstr.asm


OBJS            =       $(SRCS:.asm=.o)

NAME            =       libasm.so

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) -o $(NAME) -shared $(OBJS)

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME)

re: fclean all

%.o : %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<
