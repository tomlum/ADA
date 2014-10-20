#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <gtk/gtk.h>

#include <libgimp/gimp.h>

#include "separate.h"
#include "platform.h"
#include "util.h"

#include <tiffio.h>

#define STRIPHEIGHT 64

static
int separate_writetiffdata(TIFF* out,gint32 imageid,gint32 width,gint32 height)
{
	int result=TRUE;
	int32 BufSizeOut = TIFFStripSize(out);
	unsigned char *BufferOut;
	int i;
	int StripCount = (height+(STRIPHEIGHT-1))/STRIPHEIGHT;
	int32 sw=width;
	int32 sl=STRIPHEIGHT;

	GimpDrawable *drw[4];
	GimpPixelRgn pixrgn[4];
  gchar *chanbuf[4];

	drw[0]=separate_find_channel(imageid,sep_C);
	drw[1]=separate_find_channel(imageid,sep_M);
	drw[2]=separate_find_channel(imageid,sep_Y);
	drw[3]=separate_find_channel(imageid,sep_K);

	for(i=0;i<4;++i)
	{
		if(!(chanbuf[i]=malloc(sw*sl)))
		  result=FALSE;
		if(drw[i])
			gimp_pixel_rgn_init(&pixrgn[i],drw[i],0,0,width,height,FALSE,FALSE);
	}
	if(!(result))
		return(FALSE);

	BufferOut = (unsigned char *) _TIFFmalloc(BufSizeOut);
	if (!BufferOut)
		return(FALSE);

	gimp_progress_init ("Saving...");

	for (i = 0; i < StripCount; i++)
	{
		int j;
		unsigned char *src[4]={NULL,NULL,NULL,NULL};
		unsigned char *dest=BufferOut;
		int x,y;
		gimp_progress_update(((double) i) / ((double) StripCount));

		for(j=0;j<4;++j)
		{
			if(drw[j])
			{
				int left,top,wd,ht;
				left=0;
				top=i*STRIPHEIGHT;
				wd=width;
				ht=(top+STRIPHEIGHT > height) ? height-top : STRIPHEIGHT;
				src[j]=chanbuf[j];
				gimp_pixel_rgn_get_rect(&pixrgn[j],src[j],left,top,wd,ht);
			}
		}
		for(y=0;y<sl;++y)
		{
			for(x=0;x<sw;++x)
			{
				if(src[0])
					*dest++=*src[0]++;
				else
					*dest++=0;
				if(src[1])
					*dest++=*src[1]++;
				else
					*dest++=0;
				if(src[2])
					*dest++=*src[2]++;
				else
					*dest++=0;
				if(src[3])
					*dest++=*src[3]++;
				else
					*dest++=0;
			}
		}
		TIFFWriteEncodedStrip(out, i, BufferOut, BufSizeOut);
	}

	_TIFFfree(BufferOut);
	return 1;
}


void separate_save(GimpDrawable *drawable,struct SeparateContext *sc)
{
	gchar *filename;
	gint32 imageid=gimp_drawable_get_image(drawable->drawable_id);
	gint32 width,height;
	gdouble xres,yres;
	TIFF *out;

	filename=gimp_image_get_filename(imageid);

	gimp_image_get_resolution(imageid,&xres,&yres);
	width=gimp_image_width(imageid);
	height=gimp_image_height(imageid);

	out = TIFFOpen(filename, "w");
	if (out)
	{
		TIFFSetField(out, TIFFTAG_PHOTOMETRIC, PHOTOMETRIC_SEPARATED);
		TIFFSetField(out, TIFFTAG_SAMPLESPERPIXEL, 4);
		TIFFSetField(out, TIFFTAG_PLANARCONFIG, PLANARCONFIG_CONTIG);
		TIFFSetField(out, TIFFTAG_INKSET, INKSET_CMYK);
		TIFFSetField(out, TIFFTAG_BITSPERSAMPLE, 8);
		TIFFSetField(out, TIFFTAG_IMAGEWIDTH, width);
		TIFFSetField(out, TIFFTAG_IMAGELENGTH, height);
		TIFFSetField(out, TIFFTAG_RESOLUTIONUNIT, RESUNIT_INCH);
		TIFFSetField(out, TIFFTAG_XRESOLUTION, xres);
		TIFFSetField(out, TIFFTAG_YRESOLUTION, yres);
		TIFFSetField(out, TIFFTAG_ROWSPERSTRIP, STRIPHEIGHT);

		separate_writetiffdata(out,imageid,width,height);

		TIFFWriteDirectory(out);
		TIFFClose(out);
	}
}
