package org.love2d.android;

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
import androidx.documentfile.provider.DocumentFile;
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
//import org.ppsspp.ppsspp.Decompress;
//new
//tapsell
import ir.tapsell.plus.TapsellPlus;
import ir.tapsell.plus.AdRequestCallback;
import ir.tapsell.plus.AdShowListener;
import ir.tapsell.plus.model.TapsellPlusAdModel;
import ir.tapsell.plus.model.TapsellPlusErrorModel;
import ir.tapsell.plus.TapsellPlusInitListener;
import ir.tapsell.plus.model.AdNetworkError;
import ir.tapsell.plus.model.AdNetworks;
//tapsell
/**
 * This class will respond to android.intent.action.CREATE_SHORTCUT intent from launcher homescreen.
 * Register this class in AndroidManifest.xml.
 */
public class MainActivity extends Activity {
        private static final int BUFFER_SIZE = 4096;
	
    // Defining Permission codes.
    // We can give any value
    // but unique for each permission.
    private static final int STORAGE_PERMISSION_CODE = 1;
	private static final String[] permissionsForStorage = {
		Manifest.permission.WRITE_EXTERNAL_STORAGE,
	};
	
	
	
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	}
	
	
	
	
	
	
	
	
//all button codes/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public void start(View v) {
	    
        // Do something in response to button click
        Button start_the_game_button = (Button) findViewById(R.id.start_the_game_button);
        start_the_game_button.setVisibility(View.GONE);
        Button comments = (Button) findViewById(R.id.comments);
        comments.setVisibility(View.GONE);
        Button game_page = (Button) findViewById(R.id.game_page);
        game_page.setVisibility(View.GONE);
        Button exit_button = (Button) findViewById(R.id.exit_button); 
        exit_button.setVisibility(View.GONE);
        Button send_email = (Button) findViewById(R.id.send_email); 
        send_email.setVisibility(View.GONE);
	      Button group_games_page = (Button) findViewById(R.id.group_games_page); 
        group_games_page.setVisibility(View.GONE);
	      Button start_the_hub = (Button) findViewById(R.id.start_the_hub); 
        start_the_hub.setVisibility(View.GONE);
        RelativeLayout relative = (RelativeLayout) findViewById(R.id.relative);
        relative.setBackgroundResource(0);
        relative.setBackgroundColor(Color.parseColor("#000000"));
      
        Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
        startActivity(Myintent);           
      
        }
    

    public void sendMsg(View v) {
/*bazar*/
Intent intent = new Intent(Intent.ACTION_EDIT); 
intent.setData(Uri.parse("bazaar://details?id=" + "com.SandSprogrammingGroup.FIFA2022")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);
    }

public void sendingEmail(View v) {
/*bazar*/
String url = "mailto: 00sohrabiranpak00@gmail.com";		
Intent intent = new Intent();
intent.setAction(Intent.ACTION_SENDTO);
intent.setData(Uri.parse(url));
intent.putExtra(Intent.EXTRA_SUBJECT, "نظر دهی");    
startActivity(intent);
    }

public void goToPage(View v) {	
/*bazar*/
Intent intent = new Intent(Intent.ACTION_VIEW); 
intent.setData(Uri.parse("bazaar://details?id=" + "com.SandSprogrammingGroup.FIFA2022")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);    
    }
	
public void goToGamesPage(View v) {	
/*bazar*/
Intent intent = new Intent(Intent.ACTION_VIEW); 
intent.setData(Uri.parse("bazaar://collection?slug=by_author&aid=" + "230310009713")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);   
    }
	
public void ourHub(View v) {	
Uri uri = Uri.parse("http://sandsbros.ctcin.bio");
Intent intent = new Intent(Intent.ACTION_VIEW, uri);
startActivity(intent);
    }	
	
	
    public void exit_game(View v) {
	this.finishAffinity();	
    }
//all button codes/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		
	
//###################################################################	
	
}
