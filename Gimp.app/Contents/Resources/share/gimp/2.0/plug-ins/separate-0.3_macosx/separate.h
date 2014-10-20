#ifndef SEPARATE_H
#define SEPARATE_H

#include "lcms.h"

struct SeparateContext
{
	/* Settings */
	gchar *rgbfilename;
	gchar *cmykfilename;
	gchar *filename;
	gboolean preserveblack;
	gboolean overprintblack;

	/* Dialog private */
	GtkWidget *dialog;
	GtkWidget *rgbfileselector;
	GtkWidget *cmykfileselector;
	GtkWidget *filenamefileselector;
	gboolean dialogresult;

	/* Core related */
	cmsHTRANSFORM hTransform;
	guchar *cmyktemp;
	guchar *destptr[4];
	int srcbpp;
	int bpp[4];
};

#endif
