#include <stdint.h>
#include "libavcodec/avcodec.h"
#include "libavformat/avformat.h"
#include "libswscale/swscale.h"
#include "libavutil/imgutils.h"
#include "libavutil/frame.h"


void SaveFrame(AVFrame *pFrame,
               int width,
               int height, int iFrame);
int fake_avformat_open_input(AVFormatContext *pc,
                             char *filename);
void hexDump (char *desc, void *addr, int len);

int main(int argc, char *argv[]);
