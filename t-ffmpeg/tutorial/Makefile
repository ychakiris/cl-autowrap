# use pkg-config for getting CFLAGS and LDLIBS
FFMPEG_LIBS=    libavdevice                        \
                libavformat                        \
                libavfilter                        \
                libavcodec                         \
                libswresample                      \
                libswscale                         \
                libavutil                          \

PKG_CONFIG_DIR= ../lib/pkgconfig 
CFLAGS += -Wall -O2 -g -ggdb -fPIC
CFLAGS := $(shell export PKG_CONFIG_PATH=$(PKG_CONFIG_DIR); pkg-config --cflags $(FFMPEG_LIBS)) $(CFLAGS)
CFLAGS := $(shell freetype-config --cflags) $(CFLAGS)
CFLAGS := $(shell sdl-config --cflags) $(CFLAGS)

LDLIBS := $(shell export PKG_CONFIG_PATH=$(PKG_CONFIG_DIR); pkg-config --libs $(FFMPEG_LIBS)) $(LDLIBS)
LDLIBS := $(shell freetype-config --libs) $(LDLIBS)
LDLIBS := $(shell sdl-config --libs) $(LDLIBS)

EXAMPLES=        tutorial01                         \
                 tutorial02                         \
                 tutorial03                         \
#                tutorial04                         \
#                tutorial05                         \
#                tutorial06                         \
#                tutorial07

EXAMPLES_LIB=       lib_tutorial01 \
                    lib_tutorial02
    
LIBRARIES=$(addsuffix .so,$(EXAMPLES_LIB))
OBJS=$(addsuffix .o,$(EXAMPLES))

# the following examples make explicit use of the math library
decoding_encoding: LDLIBS += -lm
muxing:            LDLIBS += -lm

.phony: all clean-test clean

all: $(OBJS) $(EXAMPLES)

lib: $(LIBRARIES)

clean-test:
	$(RM) frame*.ppm frame*.pgm test.h264 test.mp2 test.sw test.mpg

clean: clean-test
	$(RM) $(EXAMPLES) $(OBJS)
	$(RM) lib*

run-tut01-test01:
	export LD_LIBRARY_PATH=../lib:$(LD_LIBRARY_PATH); \
./tutorial01 test_data/centaur_1.mpg

run-tut01-test02:
	export LD_LIBRARY_PATH=../lib:$(LD_LIBRARY_PATH); \
./tutorial01 test_data/1.avi

run-tut02-test01:
	export LD_LIBRARY_PATH=../lib:$(LD_LIBRARY_PATH); \
./tutorial02 test_data/1.avi

run-tut03-test01:
	export LD_LIBRARY_PATH=../lib:$(LD_LIBRARY_PATH); \
./tutorial03 test_data/1.avi


lib_tutorial01.so : tutorial01.o
	gcc tutorial01.c $(CFLAGS) $(LDLIBS) -o lib_tutorial01.so -D __AS_SHARED_LIB -shared

lib_tutorial02.so : tutorial01.o
	gcc tutorial02.c $(CFLAGS) $(LDLIBS) -o lib_tutorial02.so -D __AS_SHARED_LIB -shared




