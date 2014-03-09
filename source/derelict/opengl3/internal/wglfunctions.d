/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license ( the "Software" ) to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl3.internal.wglfunctions;

private {
    import derelict.util.wintypes;
    import derelict.opengl3.internal.wglconstants;
}

version( Windows ) {

    private {
        import derelict.util.wintypes;
    }

    extern( Windows ) nothrow {
        alias da_wglCopyContext = BOOL function( void*,void* );
        alias da_wglCreateContext = void* function( void* );
        alias da_wglCreateLayerContext = void* function( void*,int );
        alias da_wglDeleteContext = BOOL function( void* );
        alias da_wglDescribeLayerPlane = BOOL function( void*,int,int,UINT,LAYERPLANEDESCRIPTOR* );
        alias da_wglGetCurrentContext = void* function();
        alias da_wglGetCurrentDC = void* function();
        alias da_wglGetLayerPaletteEntries = int function( void*,int,int,int,COLORREF* );
        alias da_wglGetProcAddress = FARPROC function( LPCSTR );
        alias da_wglMakeCurrent = BOOL function( void*,void* );
        alias da_wglRealizeLayerPalette = BOOL function( void*,int,BOOL );
        alias da_wglSetLayerPaletteEntries = int function( void*,int,int,int,COLORREF* );
        alias da_wglShareLists = BOOL function( void*,void* );
        alias da_wglSwapLayerBuffers = BOOL function( void*,UINT );
        alias da_wglUseFontBitmaps = BOOL function( void*,DWORD,DWORD,DWORD );
        alias da_wglUseFontOutlines = BOOL function( void*,DWORD,DWORD,DWORD,FLOAT,FLOAT,int,GLYPHMETRICSFLOAT* );


        alias da_wglGetExtensionsStringARB = const( char* ) function( HDC );

        // WGL_ARB_buffer_region
        alias da_wglCreateBufferRegionARB = HANDLE function( HDC, int, UINT );
        alias da_wglDeleteBufferRegionARB = void function( HANDLE );
        alias da_wglSaveBufferRegionARB = BOOL function( HANDLE, int, int, int, int );
        alias da_wglRestoreBufferRegionARB = BOOL function( HANDLE, int, int, int, int, int, int );

        // WGL_ARB_create_context
        alias da_wglCreateContextAttribsARB = HGLRC function( HDC, HGLRC, const( int )* );

        // WGL_ARB_make_current_read
        alias da_wglMakeContextCurrentARB = BOOL function( HDC, HDC, HGLRC );
        alias da_wglGetCurrentReadDCARB = HDC function();

        // WGL_ARB_pbuffer
        alias da_wglCreatePbufferARB = HPBUFFERARB function( HDC, int, int, int, const( int )* );
        alias da_wglGetPbufferDCARB = HDC function( HPBUFFERARB );
        alias da_wglReleasePbufferDCARB = int function( HPBUFFERARB, HDC );
        alias da_wglDestroyPbufferARB = BOOL function( HPBUFFERARB );
        alias da_wglQueryPbufferARB = BOOL function( HPBUFFERARB, int, int );

        // WGL_ARB_pixel_format
        alias da_wglGetPixelFormatAttribivARB = BOOL function( HDC, int, int, UINT, const( int )*, int* );
        alias da_wglGetPixelFormatAttribfvARB = BOOL function( HDC, int, int, UINT, const( int )*, FLOAT* );
        alias da_wglChoosePixelFormatARB = BOOL function( HDC, const( int )*, const( FLOAT )*, UINT, int*, UINT* );

        // WGL_ARB_render_texture
        alias da_wglBindTexImageARB = BOOL function( HPBUFFERARB, int );
        alias da_wglReleaseTexImageARB = BOOL function( HPBUFFERARB, int );
        alias da_wglSetPbufferAttribARB = BOOL function( HPBUFFERARB, const( int )* );

        // WGL_EXT_swap_control
        alias da_wglSwapIntervalEXT = BOOL function(  int  );
        alias da_wglGetSwapIntervalEXT = int function();
    }

    enum WGLFuncs =
    q{
        da_wglCopyContext wglCopyContext;
        da_wglCreateContext wglCreateContext;
        da_wglCreateLayerContext wglCreateLayerContext;
        da_wglDeleteContext wglDeleteContext;
        da_wglDescribeLayerPlane wglDescribeLayerPlane;
        da_wglGetCurrentContext wglGetCurrentContext;
        da_wglGetCurrentDC wglGetCurrentDC;
        da_wglGetLayerPaletteEntries wglGetLayerPaletteEntries;
        da_wglGetProcAddress wglGetProcAddress;
        da_wglMakeCurrent wglMakeCurrent;
        da_wglRealizeLayerPalette wglRealizeLayerPalette;
        da_wglSetLayerPaletteEntries wglSetLayerPaletteEntries;
        da_wglShareLists wglShareLists;
        da_wglSwapLayerBuffers wglSwapLayerBuffers;
        da_wglUseFontBitmaps wglUseFontBitmaps;
        da_wglUseFontOutlines wglUseFontOutlines;
    };

    enum WGLEXTFuncs =
    q{
        da_wglGetExtensionsStringARB wglGetExtensionsStringARB;
        da_wglCreateBufferRegionARB wglCreateBufferRegionARB;
        da_wglDeleteBufferRegionARB wglDeleteBufferRegionARB;
        da_wglSaveBufferRegionARB wglSaveBufferRegionARB;
        da_wglRestoreBufferRegionARB wglRestoreBufferRegionARB;
        da_wglCreateContextAttribsARB wglCreateContextAttribsARB;
        da_wglMakeContextCurrentARB wglMakeContextCurrentARB;
        da_wglGetCurrentReadDCARB wglGetCurrentReadDCARB;
        da_wglCreatePbufferARB wglCreatePbufferARB;
        da_wglGetPbufferDCARB wglGetPbufferDCARB;
        da_wglReleasePbufferDCARB wglReleasePbufferDCARB;
        da_wglDestroyPbufferARB wglDestroyPbufferARB;
        da_wglQueryPbufferARB wglQueryPbufferARB;
        da_wglGetPixelFormatAttribivARB wglGetPixelFormatAttribivARB;
        da_wglGetPixelFormatAttribfvARB wglGetPixelFormatAttribfvARB;
        da_wglChoosePixelFormatARB wglChoosePixelFormatARB;
        da_wglBindTexImageARB wglBindTexImageARB;
        da_wglReleaseTexImageARB wglReleaseTexImageARB;
        da_wglSetPbufferAttribARB wglSetPbufferAttribARB;

        da_wglSwapIntervalEXT wglSwapIntervalEXT;
        da_wglGetSwapIntervalEXT wglGetSwapIntervalEXT;
    };

    enum WGLEXTProps =
    q{
        bool WGL_ARB_extensions_string;
        bool WGL_ARB_buffer_region;
        bool WGL_ARB_create_context;
        bool WGL_ARB_make_current_read;
        bool WGL_ARB_pbuffer;
        bool WGL_ARB_pixel_format;
        bool WGL_ARB_render_texture;
        bool WGL_EXT_swap_control;
        bool WGL_ARB_create_context_profile;
        bool WGL_ARB_create_context_robustness;
        bool WGL_ARB_framebuffer_sRGB;
        bool WGL_ARB_multisample;
        bool WGL_ARB_pixel_format_float;
        bool WGL_ARB_robustness_application_isolation;
        bool WGL_ARB_robustness_share_group_isolation;
    };
}