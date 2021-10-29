package org.love2d.android;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
//new
import android.content.res.AssetManager;
import java.io.IOException;
import java.io.FileNotFoundException;
import android.content.Intent;
import java.io.InputStream;
import java.io.OutputStream;
import android.app.Activity;
import android.net.Uri;
import android.content.res.Resources;
//new
//new2
import android.Manifest;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.UiModeManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.ConfigurationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.database.Cursor;
import android.graphics.PixelFormat;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.PowerManager;
import android.os.Vibrator;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
//new2

public class gotoLevel extends AsyncTask<Void, Integer, Void> {

	private final static String TAG = "Decompress";
	private String level;   
	ProgressDialog myProgressDialog;
  Context ctx;

	public gotoLevel(String level,Context ctx) {
		super();
		this.level = level;     
		this.ctx = ctx; 
	}
	
	@Override
	protected void onPreExecute() {
		super.onPreExecute();
		myProgressDialog = new ProgressDialog(ctx);
		myProgressDialog.setMessage("در حال انجام عملیات...لطفا شکیبا باشید");
		myProgressDialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
		myProgressDialog.setCancelable(false);
		myProgressDialog.setMax(100);
	}

	@Override
	protected Void doInBackground(Void... params){
    
String storagePath  = "";
if (ctx.getExternalFilesDir(null).getAbsolutePath() != null)
storagePath = ctx.getExternalFilesDir(null).getAbsolutePath();
else
storagePath = ctx.getFilesDir().getAbsolutePath();	
try {
FileOutputStream stream = new FileOutputStream(storagePath+File.separator+"save"+File.separator+"archive"+File.separator+"chooser.txt");
try {
    stream.write(level.getBytes());
    stream.close();
}catch (IOException e) {
System.out.println("Can't write"); // Or something more intellegent
}		
} catch (FileNotFoundException e) {
System.out.println("Can't find"); // Or something more intellegent
}

		return null;
	}

	protected void onProgressUpdate(Integer... progress) {
		myProgressDialog.setProgress(progress[0]); //Since it's an inner class, Bar should be able to be called directly
	}
        
	
	@Override
	protected void onPostExecute(Void v) {
		//Log.i(TAG, "Completed. Total size: "+result);
			myProgressDialog.dismiss();
       Intent Myintent = new Intent(ctx, GameActivity.class);
       ctx.startActivity(Myintent);
	
	}
	

}
