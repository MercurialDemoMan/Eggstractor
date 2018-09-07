CC     = gcc
CFLAGS = -Wall
SRC    = src/*.c
OUT    = extract-titlekey


$(OUT):$(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(OUT)
