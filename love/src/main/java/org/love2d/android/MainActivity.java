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
public class MainActivity extends Activity {

		
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		//clear all menues except base menu
		clearSeasonsMenu();
		clearSeasonsOne();
		clearSeasonsTwo();
		clearSeasonsThree();
		clearSeasonsFour();	
		//clear all menues except base menu
	}
	
	
//all button codes base menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void start(View v) {	    
clearBaseMenu();
//here between should be an animation that change base menu background to Seasons menu	
showSeasonsMenu();	               
}
    
public void trainSome(View v) {	
/*
1.write 0 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/  
}		
	
public void goToPage(View v) {	
/*bazar*/
/*	
Intent intent = new Intent(Intent.ACTION_VIEW); 
intent.setData(Uri.parse("bazaar://details?id=" + "com.SandSprogrammingGroup.FIFA2022")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);    
*/  
}	
		
public void commenting(View v) {
/*bazar*/
/*
Intent intent = new Intent(Intent.ACTION_EDIT); 
intent.setData(Uri.parse("bazaar://details?id=" + "com.SandSprogrammingGroup.FIFA2022")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);
*/  
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
	
public void goToGamesPage(View v) {	
/*bazar*/
/*	
Intent intent = new Intent(Intent.ACTION_VIEW); 
intent.setData(Uri.parse("bazaar://collection?slug=by_author&aid=" + "230310009713")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);   
*/
}
	
public void exit_game(View v) {
this.finishAffinity();	
}
//all button codes base menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//all button codes Seasons menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_base(View v) {	    
clearSeasonsMenu();	    
//here between should be an animation that change Seasons menu background to Base menu	
showBaseMenu();	
}
    
public void Season_ONE(View v) {	
clearSeasonsMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.s_one);
showSeasonsOne();	 
}		
	
public void Season_TWO(View v) {	
clearSeasonsMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.s_two);
showSeasonsTwo();
}	
		
public void Season_THREE(View v) {
clearSeasonsMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.s_three);
showSeasonsThree();
}

public void Season_FOUR(View v) {
clearSeasonsMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.s_four);
showSeasonsFour();
}
//all button codes Seasons menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//all button codes Season one/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_seasons_From_one(View v) {	    
clearSeasonsOne();
//here between should be an animation that change Season one background to Seasons menu	
showSeasonsMenu();
}
    
public void Season_One_E1(View v) {	
/*
1.write 1 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 	 
}		
	
public void Season_One_E2(View v) {	
/*
1.write 2 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 
}	
		
public void Season_One_E3(View v) {
/*
1.write 3 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 
}

//all button codes Season one/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//all button codes Season two/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_seasons_From_two(View v) {	    	    
clearSeasonsTwo();
//here between should be an animation that change Season two background to Seasons menu	
showSeasonsMenu();
}
    
public void Season_Two_E1(View v) {	
/*
1.write 4 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 	 
}		
	
public void Season_Two_E2(View v) {	
/*
1.write 5 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 
}	
		
public void Season_Two_E3(View v) {
/*
1.write 6 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 
}
//all button codes Season two/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//all button codes Season three/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_seasons_From_three(View v) {	    	    
clearSeasonsThree();
//here between should be an animation that change Season three background to Seasons menu	
showSeasonsMenu();
}
    
public void Season_Three_E1(View v) {	
/*
1.write 7 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 	 
}		
	
public void Season_Three_E2(View v) {	
/*
1.write 8 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 
}	
		
public void Season_Three_E3(View v) {
/*
1.write 9 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 
}
//all button codes Season three/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************		
//all button codes Season four/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_seasons_From_four(View v) {	    	    
clearSeasonsFour();
//here between should be an animation that change Season four background to Seasons menu	
showSeasonsMenu();
}
    
public void Season_Four_E1(View v) {	
/*
1.write 10 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 	 
}		
	
public void Season_Four_E2(View v) {	
/*
1.write 11 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 
}	
		
public void Season_Four_E3(View v) {
/*
1.write 12 into files/save/chooser.txt
2.start gameActivity    
//Intent Myintent = new Intent(MainActivity.this, GameActivity.class);
//startActivity(Myintent);  
*/ 
}
//all button codes Season three/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//###################################################################	functions need for better managment!
//base menu	
public static void showBaseMenu(){
Button start_the_game_button = (Button) findViewById(R.id.start_the_game_button);
start_the_game_button.setVisibility(View.VISIBLE);
start_the_game_button.setEnabled(true);
Button training = (Button) findViewById(R.id.training);
training.setVisibility(View.VISIBLE);
training.setEnabled(true);	
Button game_page = (Button) findViewById(R.id.game_page);
game_page.setVisibility(View.VISIBLE);
game_page.setEnabled(true);	
Button comments = (Button) findViewById(R.id.comments);
comments.setVisibility(View.VISIBLE);
comments.setEnabled(true);		
Button send_email = (Button) findViewById(R.id.send_email); 
send_email.setVisibility(View.VISIBLE);
send_email.setEnabled(true);	
Button group_games_page = (Button) findViewById(R.id.group_games_page); 
group_games_page.setVisibility(View.VISIBLE);
group_games_page.setEnabled(true);		
Button exit_button = (Button) findViewById(R.id.exit_button); 
exit_button.setVisibility(View.VISIBLE);
exit_button.setEnabled(true);		
}	
public static void clearBaseMenu(){
Button start_the_game_button = (Button) findViewById(R.id.start_the_game_button);
start_the_game_button.setVisibility(View.GONE);
start_the_game_button.setEnabled(false);
Button training = (Button) findViewById(R.id.training);
training.setVisibility(View.GONE);
training.setEnabled(false);	
Button game_page = (Button) findViewById(R.id.game_page);
game_page.setVisibility(View.GONE);
game_page.setEnabled(false);	
Button comments = (Button) findViewById(R.id.comments);
comments.setVisibility(View.GONE);
comments.setEnabled(false);		
Button send_email = (Button) findViewById(R.id.send_email); 
send_email.setVisibility(View.GONE);
send_email.setEnabled(false);	
Button group_games_page = (Button) findViewById(R.id.group_games_page); 
group_games_page.setVisibility(View.GONE);
group_games_page.setEnabled(false);		
Button exit_button = (Button) findViewById(R.id.exit_button); 
exit_button.setVisibility(View.GONE);
exit_button.setEnabled(false);		
}		
//base menu
//##############################
//Seasons menu	
public static void showSeasonsMenu(){
Button BackToBase = (Button) findViewById(R.id.BackToBase);
BackToBase.setVisibility(View.VISIBLE);
BackToBase.setEnabled(true);
Button sOne = (Button) findViewById(R.id.sOne);
sOne.setVisibility(View.VISIBLE);
sOne.setEnabled(true);	
Button sTwo = (Button) findViewById(R.id.sTwo);
sTwo.setVisibility(View.VISIBLE);
sTwo.setEnabled(true);	
Button sThree = (Button) findViewById(R.id.sThree);
sThree.setVisibility(View.VISIBLE);
sThree.setEnabled(true);		
Button sFour = (Button) findViewById(R.id.sFour); 
sFour.setVisibility(View.VISIBLE);
sFour.setEnabled(true);		
}	
public static void clearSeasonsMenu(){
Button BackToBase = (Button) findViewById(R.id.BackToBase);
BackToBase.setVisibility(View.GONE);
BackToBase.setEnabled(false);
Button sOne = (Button) findViewById(R.id.sOne);
sOne.setVisibility(View.GONE);
sOne.setEnabled(false);	
Button sTwo = (Button) findViewById(R.id.sTwo);
sTwo.setVisibility(View.GONE);
sTwo.setEnabled(false);	
Button sThree = (Button) findViewById(R.id.sThree);
sThree.setVisibility(View.GONE);
sThree.setEnabled(false);		
Button sFour = (Button) findViewById(R.id.sFour); 
sFour.setVisibility(View.GONE);
sFour.setEnabled(false);			
}	
//Seasons menu
//############################
//Season one	
public static void showSeasonsOne(){
Button BackToSeasonsFromOne = (Button) findViewById(R.id.BackToSeasonsFromOne);
BackToSeasonsFromOne.setVisibility(View.VISIBLE);
BackToSeasonsFromOne.setEnabled(true);
Button sOneEone = (Button) findViewById(R.id.sOneEone);
sOneEone.setVisibility(View.VISIBLE);
sOneEone.setEnabled(true);	
Button sOneEtwo = (Button) findViewById(R.id.sOneEtwo);
sOneEtwo.setVisibility(View.VISIBLE);
sOneEtwo.setEnabled(true);	
Button sOneEthree = (Button) findViewById(R.id.sOneEthree);
sOneEthree.setVisibility(View.VISIBLE);
sOneEthree.setEnabled(true);				
}		
public static void clearSeasonsOne(){
Button BackToSeasonsFromOne = (Button) findViewById(R.id.BackToSeasonsFromOne);
BackToSeasonsFromOne.setVisibility(View.GONE);
BackToSeasonsFromOne.setEnabled(false);
Button sOneEone = (Button) findViewById(R.id.sOneEone);
sOneEone.setVisibility(View.GONE);
sOneEone.setEnabled(false);	
Button sOneEtwo = (Button) findViewById(R.id.sOneEtwo);
sOneEtwo.setVisibility(View.GONE);
sOneEtwo.setEnabled(false);	
Button sOneEthree = (Button) findViewById(R.id.sOneEthree);
sOneEthree.setVisibility(View.GONE);
sOneEthree.setEnabled(false);				
}	
//Season one
//#############################
//Season two	
public static void showSeasonsTwo(){
Button BackToSeasonsFromTwo = (Button) findViewById(R.id.BackToSeasonsFromTwo);
BackToSeasonsFromTwo.setVisibility(View.VISIBLE);
BackToSeasonsFromTwo.setEnabled(true);
Button sTwoEone = (Button) findViewById(R.id.sTwoEone);
sTwoEone.setVisibility(View.VISIBLE);
sTwoEone.setEnabled(true);	
Button sTwoEtwo = (Button) findViewById(R.id.sTwoEtwo);
sTwoEtwo.setVisibility(View.VISIBLE);
sTwoEtwo.setEnabled(true);	
Button sTwoEthree = (Button) findViewById(R.id.sTwoEthree);
sTwoEthree.setVisibility(View.VISIBLE);
sTwoEthree.setEnabled(true);				
}		
public static void clearSeasonsTwo(){
Button BackToSeasonsFromTwo = (Button) findViewById(R.id.BackToSeasonsFromTwo);
BackToSeasonsFromTwo.setVisibility(View.GONE);
BackToSeasonsFromTwo.setEnabled(false);
Button sTwoEone = (Button) findViewById(R.id.sTwoEone);
sTwoEone.setVisibility(View.GONE);
sTwoEone.setEnabled(false);	
Button sTwoEtwo = (Button) findViewById(R.id.sTwoEtwo);
sTwoEtwo.setVisibility(View.GONE);
sTwoEtwo.setEnabled(false);	
Button sTwoEthree = (Button) findViewById(R.id.sTwoEthree);
sTwoEthree.setVisibility(View.GONE);
sTwoEthree.setEnabled(false);				
}	
//Season two
//##########################
//Season three
public static void showSeasonsThree(){
Button BackToSeasonsFromThree = (Button) findViewById(R.id.BackToSeasonsFromThree);
BackToSeasonsFromThree.setVisibility(View.VISIBLE);
BackToSeasonsFromThree.setEnabled(true);
Button sThreeEone = (Button) findViewById(R.id.sThreeEone);
sThreeEone.setVisibility(View.VISIBLE);
sThreeEone.setEnabled(true);	
Button sThreeEtwo = (Button) findViewById(R.id.sThreeEtwo);
sThreeEtwo.setVisibility(View.VISIBLE);
sThreeEtwo.setEnabled(true);	
Button sThreeEthree = (Button) findViewById(R.id.sThreeEthree);
sThreeEthree.setVisibility(View.VISIBLE);
sThreeEthree.setEnabled(true);				
}
public static void clearSeasonsThree(){
Button BackToSeasonsFromThree = (Button) findViewById(R.id.BackToSeasonsFromThree);
BackToSeasonsFromThree.setVisibility(View.GONE);
BackToSeasonsFromThree.setEnabled(false);
Button sThreeEone = (Button) findViewById(R.id.sThreeEone);
sThreeEone.setVisibility(View.GONE);
sThreeEone.setEnabled(false);	
Button sThreeEtwo = (Button) findViewById(R.id.sThreeEtwo);
sThreeEtwo.setVisibility(View.GONE);
sThreeEtwo.setEnabled(false);	
Button sThreeEthree = (Button) findViewById(R.id.sThreeEthree);
sThreeEthree.setVisibility(View.GONE);
sThreeEthree.setEnabled(false);				
}
//Season three 
//##################################
//Season four
public static void showSeasonsFour(){
Button BackToSeasonsFromFour = (Button) findViewById(R.id.BackToSeasonsFromFour);
BackToSeasonsFromFour.setVisibility(View.VISIBLE);
BackToSeasonsFromFour.setEnabled(true);
Button sFourEone = (Button) findViewById(R.id.sFourEone);
sFourEone.setVisibility(View.VISIBLE);
sFourEone.setEnabled(true);	
Button sFourEtwo = (Button) findViewById(R.id.sFourEtwo);
sFourEtwo.setVisibility(View.VISIBLE);
sFourEtwo.setEnabled(true);	
Button sFourEthree = (Button) findViewById(R.id.sFourEthree);
sFourEthree.setVisibility(View.VISIBLE);
sFourEthree.setEnabled(true);				
}	
public static void clearSeasonsFour(){
Button BackToSeasonsFromFour = (Button) findViewById(R.id.BackToSeasonsFromFour);
BackToSeasonsFromFour.setVisibility(View.VISIBLE);
BackToSeasonsFromFour.setEnabled(true);
Button sFourEone = (Button) findViewById(R.id.sFourEone);
sFourEone.setVisibility(View.VISIBLE);
sFourEone.setEnabled(true);	
Button sFourEtwo = (Button) findViewById(R.id.sFourEtwo);
sFourEtwo.setVisibility(View.VISIBLE);
sFourEtwo.setEnabled(true);	
Button sFourEthree = (Button) findViewById(R.id.sFourEthree);
sFourEthree.setVisibility(View.VISIBLE);
sFourEthree.setEnabled(true);				
}	
//Season four	
//###################################################################	functions need for better managment!
	
	
//**********************^^^^^^^^^^^^^^^^^^^^^^^^^^****************************^^^^^^^^^^^^^^^^^^^^^^******************
	
	
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
	


}
