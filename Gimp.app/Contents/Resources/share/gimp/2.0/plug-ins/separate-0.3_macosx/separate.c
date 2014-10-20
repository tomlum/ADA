/* separate 0.3 - image processing plug-in for the Gimp
 *
 * Copyright (C) 2002-2004 Alastair Robinson (blackfive@fakenhamweb.co.uk)
 * Based on code by Andrew Kieschnick and Peter Kirchgessner
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <gtk/gtk.h>

#include <libgimp/gimp.h>
#include <libgimp/gimpui.h>

#include "separate.h"

#include "platform.h"
#include "util.h"
#include "tiff.h"

/* Declare local functions.
 */
static void	query (void);
static void	run (const gchar *name,
				gint nparams,
				const GimpParam *param,
				gint *nreturn_vals,
				GimpParam **return_vals);

static void      separate_full(GimpDrawable *drawable,GimpParam *values,struct SeparateContext *sc);
static void      separate_light(GimpDrawable *drawable,GimpParam *values,struct SeparateContext *sc);
static void      separate_proof(GimpDrawable *drawable,GimpParam *values,struct SeparateContext *sc);
static void      separate_duotone(GimpDrawable *drawable,GimpParam *values,struct SeparateContext *sc);

static gint      separate_dialog (struct SeparateContext *sc);
static gint      separate_save_dialog (struct SeparateContext *sc,gint32 imageid);

GimpPlugInInfo PLUG_IN_INFO =
{
  NULL,  /* init_proc  */
  NULL,  /* quit_proc  */
  query, /* query_proc */
  run,   /* run_proc   */
};

MAIN ()

static void
query (void)
{

  /* Arguments for CMYK Separation routines */

  static GimpParamDef args[] =
  {
    { GIMP_PDB_INT32, "run_mode", "Interactive, non-interactive" },
    { GIMP_PDB_IMAGE, "image", "Input image" },
    { GIMP_PDB_DRAWABLE, "drawable", "Input drawable" },
    { GIMP_PDB_STRING, "input_profile", "Input ICC profile" },
    { GIMP_PDB_STRING, "output_profile", "Output ICC profile" }
  };
  static gint nargs = sizeof (args) / sizeof (args[0]);
  static GimpParamDef rargs[] =
  {
    { GIMP_PDB_STATUS , "status", "Success or failure"},
    { GIMP_PDB_IMAGE, "new_image", "Separated image" }
	};
  static gint nrargs = sizeof (rargs) / sizeof (rargs[0]);

  /* Arguments for CMYK TIFF saver */

  static GimpParamDef saveargs[] =
  {
    { GIMP_PDB_INT32, "run_mode", "Interactive, non-interactive" },
    { GIMP_PDB_IMAGE, "image", "Input image" },
    { GIMP_PDB_DRAWABLE, "drawable", "Input drawable" },
    { GIMP_PDB_STRING, "filename", "Filename" },
  };
	static gint nsaveargs = sizeof(saveargs) / sizeof (saveargs[0]);
  static GimpParamDef saverargs[] =
  {
    { GIMP_PDB_STATUS , "status", "Success or failure"},
	};
  static gint nsaverargs = sizeof (saverargs) / sizeof (saverargs[0]);

  /* Arguments for DuoTone separation code */
  static GimpParamDef duotoneargs[] =
  {
    { GIMP_PDB_INT32, "run_mode", "Interactive, non-interactive" },
    { GIMP_PDB_IMAGE, "image", "Input image" },
    { GIMP_PDB_DRAWABLE, "drawable", "Input drawable" },
  };
  static gint nduotoneargs = sizeof (duotoneargs) / sizeof (duotoneargs[0]);

  gimp_install_procedure ("plug_in_separate_full",
			  "Separate_full",
			  "Separate performs CMYK colour separation of an RGB image, into "
				"the alpha-channels of four coloured layers.",
			  "Alastair Robinson",
			  "Alastair Robinson",
			  "2002",
			  "<Image>/Image/Separate/Separate (to Colour)",
			  "RGB*",
			  GIMP_PLUGIN,
			  nargs, nrargs,
			  args, rargs);

	gimp_install_procedure ("plug_in_separate_light",
			  "Separate_light",
			  "Separate performs CMYK colour separation of an RGB image, into "
				"four greyscale layers.",
			  "Alastair Robinson",
			  "Alastair Robinson",
			  "2002",
			  "<Image>/Image/Separate/Separate (normal)",
			  "RGB*",
			  GIMP_PLUGIN,
			  nargs, nrargs,
			  args, rargs);

	gimp_install_procedure ("plug_in_separate_proof",
			  "Separate_proof",
			  "Separate proofs a CMYK colour separation, by transforming back  "
				"into RGB, with absolute colorimetric rendering intent.",
			  "Alastair Robinson",
			  "Alastair Robinson",
			  "2002",
			  "<Image>/Image/Separate/Proof",
			  "RGB*,GRAY*",
			  GIMP_PLUGIN,
			  nargs, nrargs,
			  args, rargs);

	gimp_install_procedure ("plug_in_separate_duotone",
			  "Separate_duotone",
			  "Splits an image into Red and Black plates, mapped into a CMYK image.  "
			  "HACK Alert:  The Red plate occupies the Magenta channel of the CMYK image, "
			  "allowing extraction of spot colour with standard CMYK separation code...",
			  "Alastair Robinson",
			  "Alastair Robinson",
			  "2002",
			  "<Image>/Image/Separate/Duotone",
			  "RGB*",
			  GIMP_PLUGIN,
			  nduotoneargs, nrargs,
			  duotoneargs, rargs);

	gimp_install_procedure ("plug_in_separate_save",
			  "Separate_save",
			  "Save separated image in TIFF format.",
			  "Alastair Robinson",
			  "Alastair Robinson",
			  "2002",
			  "<Image>/Image/Separate/Save...",
			  "RGB*,GRAY*",
			  GIMP_PLUGIN,
			  nsaveargs, nsaverargs,
			  saveargs, saverargs);

}

enum separate_function {SEP_NONE,SEP_DUOTONE,SEP_FULL,SEP_LIGHT,SEP_PROOF,SEP_SAVE,SEP_LOAD};

static void run (const gchar *name, gint nparams, const GimpParam  *param,
        gint    *nreturn_vals, GimpParam **return_vals)
{
	static GimpParam values[3];
	GimpDrawable *drawable;
	GimpRunMode run_mode;
	GimpPDBStatusType status = GIMP_PDB_SUCCESS;
	struct SeparateContext mysc;
	enum separate_function func=SEP_NONE;
	run_mode = param[0].data.d_int32;

	if(strcmp(name,"plug_in_separate_full")==0)
		func=SEP_FULL;
	else if(strcmp(name,"plug_in_separate_light")==0)
		func=SEP_LIGHT;
	else if(strcmp(name,"plug_in_separate_proof")==0)
		func=SEP_PROOF;
	else if(strcmp(name,"plug_in_separate_save")==0)
		func=SEP_SAVE;
	else if(strcmp(name,"plug_in_separate_duotone")==0)
		func=SEP_DUOTONE;


	/*  Get the specified drawable  */
	drawable = gimp_drawable_get (param[2].data.d_drawable);

	switch(func)
	{
		case SEP_FULL:
		case SEP_LIGHT:
		case SEP_PROOF:
			mysc.rgbfilename=separate_retrieve_string_default("separate_rgbprofile",
				DEFAULT_RGB_PROFILE);
			mysc.cmykfilename=separate_retrieve_string_default("separate_cmykprofile",
				DEFAULT_CMYK_PROFILE);

			switch (run_mode)
			{
				case GIMP_RUN_NONINTERACTIVE:
					if (nparams != 5)
						status = GIMP_PDB_CALLING_ERROR;
					if (status == GIMP_PDB_SUCCESS)
					{
						/*	Collect the profile filenames */
						gchar *rgbprofile,*cmykprofile;
						rgbprofile=param[3].data.d_string;
						cmykprofile=param[4].data.d_string;
						separate_store_string("separate_rgbprofile",rgbprofile);
						separate_store_string("separate_cmykprofile",cmykprofile);

						g_free(mysc.rgbfilename);
						g_free(mysc.cmykfilename);
						mysc.rgbfilename=separate_retrieve_string_default("separate_rgbprofile",
							DEFAULT_RGB_PROFILE);
						mysc.cmykfilename=separate_retrieve_string_default("separate_cmykprofile",
							DEFAULT_CMYK_PROFILE);
					}
					break;

				case GIMP_RUN_INTERACTIVE:
  				if (! separate_dialog (&mysc))
						status = GIMP_PDB_EXECUTION_ERROR;
					break;

				case GIMP_RUN_WITH_LAST_VALS:
					break;

				default:
					break;
			}

			if (status == GIMP_PDB_SUCCESS)
			{
				/*  Make sure that the drawable is RGB color  */

				switch(func)
				{
					case SEP_FULL:
						separate_full(drawable,&values[1],&mysc);
						break;
					case SEP_LIGHT:
						separate_light(drawable,&values[1],&mysc);
						break;
					case SEP_PROOF:
						separate_proof(drawable,&values[1],&mysc);
						break;
					default:
						gimp_message("Separate: internal calling error!");
				}
				if (run_mode != GIMP_RUN_NONINTERACTIVE)
					gimp_displays_flush ();
			}
			separate_store_string("separate_rgbprofile",mysc.rgbfilename);
			separate_store_string("separate_cmykprofile",mysc.cmykfilename);
			g_free(mysc.rgbfilename);
			g_free(mysc.cmykfilename);
			break;
		case SEP_SAVE:
			if(!(separate_is_CMYK(gimp_drawable_get_image(drawable->drawable_id))))
			{
				gimp_message("This is not a CMYK separated image!");
				status = GIMP_PDB_EXECUTION_ERROR;
			}
			else
			{
				switch (run_mode)
				{
					case GIMP_RUN_NONINTERACTIVE:
						if (nparams != 4)
							status = GIMP_PDB_CALLING_ERROR;
						if (status == GIMP_PDB_SUCCESS)
						{
							/*	Collect the filenames */
							gchar *filename;
							filename=param[3].data.d_string;
							gimp_image_set_filename(gimp_drawable_get_image(drawable->drawable_id),filename);
						}
						break;

					case GIMP_RUN_INTERACTIVE:
	 	 				if (! separate_save_dialog(&mysc,gimp_drawable_get_image(drawable->drawable_id)))
							status = GIMP_PDB_EXECUTION_ERROR;
						break;

					case GIMP_RUN_WITH_LAST_VALS:
						break;

					default:
						break;
				}
			}
			if (status == GIMP_PDB_SUCCESS)
			{
				switch(func)
				{
					case SEP_SAVE:
						separate_save(drawable,&mysc);
						break;
					default:
						gimp_message("Separate: internal calling error!");
				}
			}
			break;
		case SEP_DUOTONE:
			separate_duotone(drawable,&values[1],&mysc);
			break;
		default:
			gimp_message("Separate: Internal calling error!");
			break;
	}
	*nreturn_vals = 1;
	*return_vals = values;

	values[0].type = GIMP_PDB_STATUS;
	values[0].data.d_status = status;
	values[1].type = GIMP_PDB_IMAGE;

	gimp_drawable_detach (drawable);
}


static void separate_core(struct SeparateContext *sc,unsigned char *src,int size)
{
	int i,b1,b2,b3,b4;
	guchar *dp1,*dp2,*dp3,*dp4;
	int lc=0,lm=0,ly=0;
	
	b1=sc->bpp[0];
	b2=sc->bpp[1];
	b3=sc->bpp[2];
	b4=sc->bpp[3];

	dp1=sc->destptr[0];
	dp2=sc->destptr[1];
	dp3=sc->destptr[2];
	dp4=sc->destptr[3];

	cmsDoTransform(sc->hTransform,
		src,
		sc->cmyktemp,
		size);

	if(sc->preserveblack)
	{
		for(i=0;i<size;++i)
		{
			int r=*src++;
			int g=*src++;
			int b=*src++;
			if(sc->srcbpp==4)
				++src;
			if((r|g|b)!=0)
			{
				dp1[i*b1]=sc->cmyktemp[i*4+3];
				ly=dp2[i*b2]=sc->cmyktemp[i*4+2];
				lm=dp3[i*b3]=sc->cmyktemp[i*4+1];
				lc=dp4[i*b4]=sc->cmyktemp[i*4];
			}
			else if (sc->overprintblack)
			{
				dp1[i*b1]=255;
				dp2[i*b2]=ly;
				dp3[i*b3]=lm;
				dp4[i*b4]=lc;
			}
			else
			{
				dp1[i*b1]=255;
				dp2[i*b2]=0;
				dp3[i*b3]=0;
				dp4[i*b4]=0;
			}			
		}
	}
	else
	{
		for(i=0;i<size;++i)
		{
			dp1[i*b1]=sc->cmyktemp[i*4+3];
			dp2[i*b2]=sc->cmyktemp[i*4+2];
			dp3[i*b3]=sc->cmyktemp[i*4+1];
			dp4[i*b4]=sc->cmyktemp[i*4];
		}
	}	
}


static void separate_full(GimpDrawable *drawable,GimpParam *values,struct SeparateContext *sc)
{
	GimpPixelRgn srcPR;
	gpointer tileiterator;
	gint width, height;
	guchar *src;
	cmsHPROFILE hInProfile, hOutProfile;
	guchar cmykprimaries[]=
	{
		0,0,0,255,
		0,0,255,0,
		0,255,0,0,
		255,0,0,0
	};
	guchar rgbprimaries[]=
	{
		0,0,0,
		237,220,33,
		236,38,99,
		46,138,222
	};

	hInProfile  = cmsOpenProfileFromFile(sc->rgbfilename,"r");
	hOutProfile = cmsOpenProfileFromFile(sc->cmykfilename,"r");

#if 0
	sc->hTransform = cmsCreateTransform(hOutProfile,
		TYPE_CMYK_8,
		hInProfile,
		TYPE_RGB_8,
		INTENT_ABSOLUTE_COLORIMETRIC,cmsFLAGS_NOTPRECALC);

	cmsDoTransform(sc->hTransform,
		cmykprimaries,
		rgbprimaries,
		4);

	cmsDeleteTransform(sc->hTransform);
#endif

	sc->srcbpp=drawable->bpp;

	sc->hTransform = cmsCreateTransform(hInProfile,
		(sc->srcbpp==3 ? TYPE_RGB_8 : TYPE_RGBA_8),
		hOutProfile,
		TYPE_CMYK_8,
		INTENT_PERCEPTUAL,0); /*, cmsFLAGS_WHITEBLACKCOMPENSATION); */

	width  = drawable->width;
	height = drawable->height;

	{
		gint32 new_image_id,counter;
		GimpDrawable *drawables[4];
		GimpPixelRgn pixrgn[4];
		gint32 layers[4];
		gint32 mask[4];
		gint32 ntiles=0,tilecounter=0;

		char *filename=separate_filename_add_suffix(gimp_image_get_filename(gimp_drawable_get_image(drawable->drawable_id)),"CMYK");
		values[0].data.d_image=new_image_id=
			separate_create_planes_CMYK(filename,drawable->width,drawable->height,layers,rgbprimaries);
		g_free(filename);

		for(counter=0;counter<4;++counter)
		{
			mask[counter]=gimp_layer_create_mask(layers[counter],GIMP_ADD_WHITE_MASK);
			gimp_layer_add_mask(layers[counter],mask[counter]);
			drawables[counter]=gimp_drawable_get(mask[counter]);
		}

		gimp_pixel_rgn_init (&srcPR, drawable, 0, 0, width, height, FALSE, FALSE);
		for(counter=0;counter<4;++counter)
		{
			gimp_pixel_rgn_init (&pixrgn[counter], drawables[counter], 0, 0, width, height, TRUE, FALSE);
		}

		sc->cmyktemp = g_new(guchar,64*64*4);

		gimp_progress_init ("Separating...");
		ntiles=drawable->ntile_rows*drawable->ntile_cols;
		tileiterator=gimp_pixel_rgns_register(5,&srcPR,&pixrgn[0],&pixrgn[1],&pixrgn[2],&pixrgn[3]);
		while(tileiterator)
		{
			src=srcPR.data;

			for(counter=0;counter<4;++counter)
			{
				sc->destptr[counter]=pixrgn[counter].data;
				sc->bpp[counter]=pixrgn[counter].bpp;
			}

			separate_core(sc,src,srcPR.w*srcPR.h);

			gimp_progress_update(((double) tilecounter) / ((double) ntiles));

			++tilecounter;
			tileiterator = gimp_pixel_rgns_process (tileiterator);
		}

		g_free(sc->cmyktemp);
		cmsDeleteTransform(sc->hTransform);
		cmsCloseProfile(hInProfile);
		cmsCloseProfile(hOutProfile);

		for(counter=0;counter<4;++counter)
		{
			gimp_drawable_flush (drawables[counter]);
			gimp_drawable_update (drawables[counter]->drawable_id, 0, 0, width, height);
			gimp_drawable_detach (drawables[counter]);
		}

		gimp_display_new (new_image_id);
		gimp_displays_flush();
	}

}


static void separate_light(GimpDrawable *drawable,GimpParam *values,struct SeparateContext *sc)
{
	GimpPixelRgn srcPR;
	gpointer tileiterator;
	gint width, height;
	gint bytes;
	guchar *src;
	gint ntiles=0,tilecounter=0;

	cmsHPROFILE hInProfile, hOutProfile;

	hInProfile  = cmsOpenProfileFromFile(sc->rgbfilename,"r");
	hOutProfile = cmsOpenProfileFromFile(sc->cmykfilename,"r");

	sc->srcbpp=drawable->bpp;
	
	sc->hTransform = cmsCreateTransform(hInProfile,
		(sc->srcbpp==3 ? TYPE_RGB_8 : TYPE_RGBA_8),
		hOutProfile,
		TYPE_CMYK_8,
		INTENT_PERCEPTUAL, 0);

	/* Get the size of the input image. (This will/must be the same
	   as the size of the output image.) */
	width  = drawable->width;
	height = drawable->height;
	bytes  = drawable->bpp;

	/*  initialize the pixel regions  */
	gimp_pixel_rgn_init (&srcPR, drawable, 0, 0, width, height, FALSE, FALSE);
	{
		gint32 new_image_id,counter;
		GimpDrawable *drawables[4];
		GimpPixelRgn pixrgn[4];
		gint32 layers[4];

		enum layerid {LAYER_K,LAYER_Y,LAYER_M,LAYER_C};

		char *filename=separate_filename_add_suffix(gimp_image_get_filename(gimp_drawable_get_image(drawable->drawable_id)),"CMYK");
		values[0].data.d_image=new_image_id=separate_create_planes_grey(filename,
                  drawable->width,drawable->height,
                  layers);
		g_free(filename);

		gimp_pixel_rgn_init (&srcPR, drawable, 0, 0, width, height, FALSE, FALSE);
		for(counter=0;counter<4;++counter)
		{
			drawables[counter]=gimp_drawable_get(layers[counter]);
			gimp_pixel_rgn_init (&pixrgn[counter], drawables[counter], 0, 0, width, height, TRUE, FALSE);
		}

		sc->cmyktemp = g_new(guchar,64*64*4);

		gimp_progress_init ("Separating...");
		ntiles=drawable->ntile_cols*drawable->ntile_rows;
		tileiterator=gimp_pixel_rgns_register(5,&srcPR,&pixrgn[0],&pixrgn[1],&pixrgn[2],&pixrgn[3]);
		while(tileiterator)
		{
			src=srcPR.data;

			for(counter=0;counter<4;++counter)
			{
				sc->destptr[counter]=pixrgn[counter].data;
				sc->bpp[counter]=pixrgn[counter].bpp;
			}
			
			separate_core(sc,src,srcPR.w*srcPR.h);
			
			gimp_progress_update (((double) tilecounter) / ((double) ntiles));
			++tilecounter;
			tileiterator = gimp_pixel_rgns_process (tileiterator);
		}

		g_free(sc->cmyktemp);
		cmsDeleteTransform(sc->hTransform);
		cmsCloseProfile(hInProfile);
		cmsCloseProfile(hOutProfile);

		for(counter=0;counter<4;++counter)
		{
			gimp_drawable_flush (drawables[counter]);
			gimp_drawable_update (drawables[counter]->drawable_id, 0, 0, width, height);
			gimp_drawable_detach (drawables[counter]);
		}

		gimp_display_new (new_image_id);
		gimp_displays_flush();
	}

}


static void separate_proof(GimpDrawable *drawable,GimpParam *values,struct SeparateContext *sc)
{
	gpointer tileiterator;
  gint width, height;
  gint bytes;
	gint ntiles=0,tilecounter=0;
	gint32 cmykimage=gimp_drawable_get_image(drawable->drawable_id);

  cmsHPROFILE hInProfile, hOutProfile;
  cmsHTRANSFORM hTransform;

	if(!(separate_is_CMYK(cmykimage)))
	{
		gimp_message("Image is not separated...\n");
		values[0].data.d_image=-1;
		return;
	}

  hInProfile = cmsOpenProfileFromFile(sc->cmykfilename,"r");
  hOutProfile  = cmsOpenProfileFromFile(sc->rgbfilename,"r");

	hTransform = cmsCreateTransform(hInProfile,
                                  TYPE_CMYK_8,
                                  hOutProfile,
                                  TYPE_RGB_8,
                                  INTENT_ABSOLUTE_COLORIMETRIC, 0);

  /* Get the size of the input image. (This will/must be the same
   *  as the size of the output image.
   */
  width  = drawable->width;
  height = drawable->height;
  bytes  = 1;

  {
    gint32 new_image_id,counter;
		GimpDrawable *drawables[5];
		GimpPixelRgn pixrgn[5];
		gint32 layers[1];
		guchar *cmyktemp;

		char *filename=separate_filename_add_suffix(gimp_image_get_filename(cmykimage),"Proof"); 
		values[0].data.d_image=new_image_id=separate_create_RGB(filename,
                  drawable->width,drawable->height,
                  layers);
		g_free(filename);

		drawables[0]=separate_find_channel(cmykimage,sep_C);
		drawables[1]=separate_find_channel(cmykimage,sep_M);
		drawables[2]=separate_find_channel(cmykimage,sep_Y);
		drawables[3]=separate_find_channel(cmykimage,sep_K);
		drawables[4]=gimp_drawable_get(layers[0]);

		if(drawables[0]==0)
		{
			gimp_message("Couldn't get Cyan channel\n");
		}
		if(drawables[1]==0)
		{
			gimp_message("Couldn't get Magenta channel\n");
		}

		if(drawables[2]==0)
		{
			gimp_message("Couldn't get Yellow channel\n");
		}

		if(drawables[3]==0)
		{
			gimp_message("Couldn't get Black channel\n");
		}

		for(counter=0;counter<4;++counter)
			gimp_pixel_rgn_init (&pixrgn[counter], drawables[counter], 0, 0, width, height, FALSE, FALSE);
		gimp_pixel_rgn_init (&pixrgn[4], drawables[4], 0, 0, width, height, TRUE, FALSE);

		cmyktemp = g_new(guchar,pixrgn[4].w*pixrgn[4].h*4);

		gimp_progress_init ("Proofing...");
		ntiles=drawables[4]->ntile_cols*drawables[4]->ntile_rows;
		tileiterator=gimp_pixel_rgns_register(5,&pixrgn[4],&pixrgn[0],&pixrgn[1],&pixrgn[2],&pixrgn[3]);

		while(tileiterator)
		{
			long i;
			guchar *ptr[5];

			for(counter=0;counter<5;++counter)
				ptr[counter]=pixrgn[counter].data;

			for(i=0;i<(pixrgn[4].w*pixrgn[4].h);++i)
			{
				cmyktemp[i*4]=(ptr[0])[i*pixrgn[0].bpp];
				cmyktemp[i*4+1]=(ptr[1])[i*pixrgn[1].bpp];
				cmyktemp[i*4+2]=(ptr[2])[i*pixrgn[2].bpp];
				cmyktemp[i*4+3]=(ptr[3])[i*pixrgn[3].bpp];
			}

			cmsDoTransform(hTransform,
				cmyktemp,
				ptr[4],
				pixrgn[4].w*pixrgn[4].h);

			gimp_progress_update (((double) tilecounter) / ((double) ntiles));
			++tilecounter;
			tileiterator = gimp_pixel_rgns_process (tileiterator);
		}

		g_free(cmyktemp);
		cmsDeleteTransform(hTransform);
		cmsCloseProfile(hInProfile);
		cmsCloseProfile(hOutProfile);

		gimp_drawable_flush (drawables[4]);
		gimp_drawable_update (drawables[4]->drawable_id, 0, 0, width, height);
		gimp_drawable_detach (drawables[4]);

		gimp_display_new (new_image_id);
		gimp_displays_flush();
	}

}


static void separate_duotone(GimpDrawable *drawable,GimpParam *values,struct SeparateContext *sc)
{
  GimpPixelRgn srcPR;
	gpointer tileiterator;
  gint width, height;
  guchar *src;

  width  = drawable->width;
  height = drawable->height;

  {
		gint32 new_image_id,counter;
		GimpDrawable *drawables[2];
		GimpPixelRgn pixrgn[2];
		gint32 layers[2];
		gint32 mask[2];
		gint32 ntiles=0,tilecounter=0;

		char *filename=separate_filename_add_suffix(gimp_image_get_filename(gimp_drawable_get_image(drawable->drawable_id)),"MK"); 
		values[0].data.d_image=new_image_id=separate_create_planes_Duotone(filename,
                  drawable->width,drawable->height,
                  layers);
		g_free(filename);

		for(counter=0;counter<2;++counter)
		{
			mask[counter]=gimp_layer_create_mask(layers[counter],GIMP_ADD_WHITE_MASK);
			gimp_layer_add_mask(layers[counter],mask[counter]);
			drawables[counter]=gimp_drawable_get(mask[counter]);
		}

		gimp_pixel_rgn_init (&srcPR, drawable, 0, 0, width, height, FALSE, FALSE);
		for(counter=0;counter<2;++counter)
		{
			gimp_pixel_rgn_init (&pixrgn[counter], drawables[counter], 0, 0, width, height, TRUE, FALSE);
		}

		gimp_progress_init ("Separating...");
		ntiles=drawable->ntile_rows*drawable->ntile_cols;
		tileiterator=gimp_pixel_rgns_register(3,&srcPR,&pixrgn[0],&pixrgn[1]);
		while(tileiterator)
		{
			long i;
			guchar *destptr[2];
			src=srcPR.data;

			for(counter=0;counter<2;++counter)
				destptr[counter]=pixrgn[counter].data;

			for(i=0;i<(srcPR.w*srcPR.h);++i)
			{
				int r,g,b,t;
				r=src[i*srcPR.bpp];
				g=src[i*srcPR.bpp+1];
				b=src[i*srcPR.bpp+2];
                        t=(g+b)/2;
                        if(r>t)
					g=b=t;
				else
					r=g=(r+g+b)/3;
				(destptr[0])[i*pixrgn[0].bpp]=255-r;
				(destptr[1])[i*pixrgn[1].bpp]=r-g;
			}

			gimp_progress_update(((double) tilecounter) / ((double) ntiles));

			++tilecounter;
			tileiterator = gimp_pixel_rgns_process (tileiterator);
		}

		for(counter=0;counter<2;++counter)
		{
			gimp_drawable_flush (drawables[counter]);
			gimp_drawable_update (drawables[counter]->drawable_id, 0, 0, width, height);
			gimp_drawable_detach (drawables[counter]);
		}

		gimp_display_new (new_image_id);
		gimp_displays_flush();
	}

}


static gint
separate_dialog (struct SeparateContext *sc)
{
	GtkWidget *dialog;
	GtkWidget *vbox;
	GtkTable *table;
	GtkWidget *temp;
	GtkWidget *pureblackselector;
	GtkWidget *overprintselector;
	gboolean   run;

	gimp_ui_init ("separate", FALSE);

	sc->dialogresult=FALSE;
	dialog = gimp_dialog_new ("Separate", "separate",
		NULL, 0,
		gimp_standard_help_func, "gimp-filter-separate",
		GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
		GTK_STOCK_OK, GTK_RESPONSE_OK,
		NULL);

	vbox = gtk_vbox_new (FALSE, 0);
	gtk_container_set_border_width (GTK_CONTAINER (vbox), 6);
	gtk_box_pack_start (GTK_BOX (GTK_DIALOG (dialog)->vbox), vbox, TRUE, TRUE, 0);
	gtk_widget_show (vbox);

	table = GTK_TABLE(gtk_table_new(2,4,FALSE));
	gtk_box_pack_start(GTK_BOX (vbox), GTK_WIDGET(table), TRUE, TRUE, 0);
	gtk_widget_show(GTK_WIDGET(table));

	/* Profile file selectors */

	temp=gtk_label_new("Source profile:");
	gtk_table_attach(table,temp,0,1,0,1,GTK_FILL,0,0,0);
	gtk_widget_show (temp);
	sc->rgbfileselector =
	    gimp_file_entry_new ("RGB ICC profile (RGB)...",sc->rgbfilename,FALSE,TRUE);

	gtk_table_attach(table,sc->rgbfileselector,1,2,0,1,GTK_FILL|GTK_EXPAND,0,0,0);
	gtk_widget_show (sc->rgbfileselector);

	temp=gtk_label_new("Destination profile:");
	gtk_table_attach(table,temp,0,1,1,2,GTK_FILL,0,0,0);
	gtk_widget_show (temp);

	sc->cmykfileselector =
	    gimp_file_entry_new ("CMYK ICC profile (CMYK)...",sc->cmykfilename,FALSE,TRUE);
	
	gtk_table_attach(table,sc->cmykfileselector,1,2,1,2,GTK_FILL|GTK_EXPAND,0,0,0);
	gtk_widget_show (sc->cmykfileselector);

	pureblackselector = gtk_check_button_new_with_label("Preserve pure black:");
	gtk_table_attach(table,pureblackselector,1,2,2,3,GTK_FILL,0,0,0);
	gtk_widget_show (pureblackselector);

	overprintselector = gtk_check_button_new_with_label("Overprint pure black:");
	gtk_table_attach(table,overprintselector,1,2,3,4,GTK_FILL,0,0,0);
	gtk_widget_show (overprintselector);

	/* Show the widgets */

	run = (gimp_dialog_run (GIMP_DIALOG (dialog)) == GTK_RESPONSE_OK);

	if (run)
	{
		/* Update the source and destination profile names... */
		if(sc->rgbfilename)
			g_free(sc->rgbfilename);
		if(sc->cmykfilename)
			g_free(sc->cmykfilename);
		sc->rgbfilename=gimp_file_entry_get_filename(GIMP_FILE_ENTRY(sc->rgbfileselector));
		sc->cmykfilename=gimp_file_entry_get_filename(GIMP_FILE_ENTRY(sc->cmykfileselector));
		sc->preserveblack=gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(pureblackselector));
		sc->overprintblack=gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(overprintselector));
	}
	return run;
}

static void
separate_save_ok_callback(GtkWidget *widget, gpointer data)
{
	struct SeparateContext *sc=(struct SeparateContext *)data;
	sc->dialogresult=TRUE;
	sc->filename=g_strdup(gtk_file_selection_get_filename(GTK_FILE_SELECTION(sc->filenamefileselector)));
	gtk_widget_destroy(sc->filenamefileselector);
}

static gint
separate_save_dialog (struct SeparateContext *sc,gint32 imageid)
{
	char *oldfname=g_strdup(gimp_image_get_filename(imageid));
/*char *filename=separate_filename_change_extension(oldfname,"tif");*/
	char *filename=g_strdup(oldfname);

	sc->filename=NULL;
	sc->dialogresult=FALSE;
	gimp_ui_init ("separate", FALSE);

	sc->filenamefileselector = gtk_file_selection_new("Save separated TIFF...");
	gtk_file_selection_set_filename(GTK_FILE_SELECTION(sc->filenamefileselector),
	                                filename);

	g_free(oldfname);
	g_free(filename);

	g_signal_connect (sc->filenamefileselector, "destroy",
		G_CALLBACK (gtk_main_quit),
		NULL);

	g_signal_connect (GTK_FILE_SELECTION(sc->filenamefileselector)->cancel_button, "clicked",
		G_CALLBACK (gtk_main_quit),
		NULL);
   
	g_signal_connect (GTK_FILE_SELECTION(sc->filenamefileselector)->ok_button, "clicked",
		G_CALLBACK (separate_save_ok_callback),
		sc);

	gtk_widget_show (sc->filenamefileselector);

	gtk_main ();
	gdk_flush ();

	if(sc->filename)
	{
		gimp_image_set_filename(imageid,sc->filename);
		g_free(sc->filename);
		sc->filename=NULL;
	}

	return sc->dialogresult;
}
