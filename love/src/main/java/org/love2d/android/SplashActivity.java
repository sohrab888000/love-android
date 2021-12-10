package org.love2d.android;

import android.os.Handler;
import android.Manifest;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.UiModeManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
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
import android.text.InputType;
import android.util.Log;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.InputDevice;
import android.view.InputEvent;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.SurfaceView;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.Toast;
import java.io.File;
import java.lang.reflect.Field;
import java.util.List;
import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
//new
import android.content.res.AssetManager;
import java.io.*;
import java.util.zip.ZipFile;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import android.widget.RelativeLayout;
import android.widget.Button;
import android.graphics.Paint;
import android.os.AsyncTask;
import java.net.URL;
import java.net.URLConnection;
import android.graphics.Color;
import android.content.res.Resources;
import org.love2d.android.R;
//to image view and background changing animation!
import android.widget.ImageView;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Animation.AnimationListener;
//
/*
 * This class will respond to android.intent.action.CREATE_SHORTCUT intent from launcher homescreen.
 * Register this class in AndroidManifest.xml.
 */
public class SplashActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
	init_wellcome_msg();    
        showLogo();
        goToMain();
    }
  
    public void showLogo() {
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                ImageView splash_image = (ImageView) findViewById(R.id.splash_image); 	
                ImageViewAnimatedChange(SplashActivity.this,splash_image,R.drawable.main_logo);	
            }
        }, 2000);
    }
    
    public void goToMain() {
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent intent = new Intent(SplashActivity.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        }, 5000);
    }
  
  
  
  
  
  
  
  //###################################################################	functions need for Animations!
public static void ImageViewAnimatedChange(final Context c,final ImageView v ,final int resId) {
    final Animation anim_out = AnimationUtils.loadAnimation(c, android.R.anim.fade_out); 
    final Animation anim_in  = AnimationUtils.loadAnimation(c, android.R.anim.fade_in); 
    anim_out.setAnimationListener(new AnimationListener()
    {
        @Override public void onAnimationStart(Animation animation) {}
        @Override public void onAnimationRepeat(Animation animation) {}
        @Override public void onAnimationEnd(Animation animation)
        {
	    Bitmap bImage = BitmapFactory.decodeResource(c.getResources(), resId);
            v.setImageBitmap(bImage); 
            anim_in.setAnimationListener(new AnimationListener() {
                @Override public void onAnimationStart(Animation animation) {}
                @Override public void onAnimationRepeat(Animation animation) {}
                @Override public void onAnimationEnd(Animation animation) {}
            });
            v.startAnimation(anim_in);
        }
    });
    v.startAnimation(anim_out);
}		
//###################################################################	functions need for Animations!
//-------------------------------------------------------------------
//################################################################### function for init wellcome msg	
public void init_wellcome_msg(){
try {
FileOutputStream stream = new FileOutputStream(storagePath+File.separator+"save"+File.separator+"archive"+File.separator+"wellcome_state.txt");
try {
    stream.write("0".getBytes());
    stream.close();
}catch (IOException e) {
System.out.println("Can't write"); // Or something more intellegent
}		
} catch (FileNotFoundException e) {
System.out.println("Can't find"); // Or something more intellegent
}	
}	
//################################################################### function for init wellcome msg	
 
}
