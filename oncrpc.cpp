// oncrpc.cpp : Defines the entry point for the DLL application.
//

#include <windows.h>
#include <rpc/rpc.h>

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
    switch (ul_reason_for_call)
	{
		case DLL_PROCESS_ATTACH:
			rpc_nt_init();
			break;
		case DLL_THREAD_ATTACH:
		case DLL_THREAD_DETACH:
			break;
		case DLL_PROCESS_DETACH:
			rpc_nt_exit();
			break;
    }
    return TRUE;
}

