#include "callback.h"
#include <pspdisplay.h>
#include <pspkernel.h>

PSP_MODULE_INFO("Witam", 0, 1, 0);
PSP_MAIN_THREAD_ATTR(0);

int main(int argc, char **argv)
{
    setupExitCallback();
    pspDebugScreenInit();

    sceDisplayWaitVblankStart();
    pspDebugScreenSetXY(0, 0);
    pspDebugScreenPrintf("Witam!");

    while (isRunning())
        ;

    exitGame();
    return 0;
}