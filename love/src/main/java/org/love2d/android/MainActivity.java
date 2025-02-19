package org.love2d.android;

import android.text.TextUtils;
import android.media.AudioManager;
import android.app.AlertDialog;
import android.graphics.drawable.Drawable;
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
import android.media.MediaPlayer;  
//
/*
 * This class will respond to android.intent.action.CREATE_SHORTCUT intent from launcher homescreen.
 * Register this class in AndroidManifest.xml.
 */
public class MainActivity extends Activity {
	
        
	Toast toastMessage;//for showing message
        private String m_Text = "";//for saving username
	
	MediaPlayer mediaPlayer_menu;
	MediaPlayer mediaPlayer_click;
	MediaPlayer mediaPlayer_lock;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		mediaPlayer_menu = MediaPlayer.create(MainActivity.this, R.raw.menu);
		mediaPlayer_menu.setLooping(true);
	        mediaPlayer_click = MediaPlayer.create(MainActivity.this, R.raw.click);
	        mediaPlayer_lock = MediaPlayer.create(MainActivity.this, R.raw.lock);
		init_seasons_state();				
		show_wellcome_message_if_should_and_change_its_state();
	}
	
        @Override
        public void onResume(){
                super.onResume();
                init_seasons_state();
		if(!mediaPlayer_menu.isPlaying()) {
                mediaPlayer_menu.seekTo(0);
                mediaPlayer_menu.start();
                }

        }
	
	@Override
        protected void onStart(){
        super.onStart();
        init_seasons_state(); 	
        }
	
	
	protected void onPause(){//for pausing the song when app pause
        super.onPause();
	mediaPlayer_menu.pause();//   ^^^	   
	}
	
	
//all button codes base menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void start(View v) {	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
clearBaseMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.ss_menu);	
showSeasonsMenu();	               
}
    
public void trainSome(View v) {	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=train").execute(); 	
}		
	
public void goToPage(View v) {	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
/*bazar*/

Intent intent = new Intent(Intent.ACTION_VIEW); 
intent.setData(Uri.parse("bazaar://details?id=" + "com.undeniables.ShadowHero")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);    

/*myket*/
/*	
String url= "myket://details?id=com.undeniables.ShadowHero";
Intent intent = new Intent();
intent.setAction(Intent.ACTION_VIEW);
intent.setData(Uri.parse(url));
startActivity(intent);		
*/
}	
		
public void commenting(View v) {
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
/*bazar*/

Intent intent = new Intent(Intent.ACTION_EDIT); 
intent.setData(Uri.parse("bazaar://details?id=" + "com.undeniables.ShadowHero")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);

/*myket*/
/*	
String url= "myket://comment?id=com.undeniables.ShadowHero";
Intent intent = new Intent();
intent.setAction(Intent.ACTION_VIEW);
intent.setData(Uri.parse(url));
startActivity(intent);	
*/
}

public void sendingEmail(View v) {
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
/*bazar and myket*/
String url = "mailto: 00sohrabiranpak00@gmail.com";		
Intent intent = new Intent();
intent.setAction(Intent.ACTION_SENDTO);
intent.setData(Uri.parse(url));
intent.putExtra(Intent.EXTRA_SUBJECT, "نظر دهی");    
startActivity(intent);
}
	
public void goToGamesPage(View v) {	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
/*bazar*/
	
Intent intent = new Intent(Intent.ACTION_VIEW); 
intent.setData(Uri.parse("bazaar://collection?slug=by_author&aid=" + "515731926985")); 
intent.setPackage("com.farsitel.bazaar"); 
startActivity(intent);   

/*myket*/
/*
String url= "myket://developer/com.undeniables.ShadowHero";
Intent intent = new Intent();
intent.setAction(Intent.ACTION_VIEW);
intent.setData(Uri.parse(url));
startActivity(intent);			
*/
}
	
public void exit_game(View v) {
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
this.finishAffinity();	
}
//all button codes base menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//all button codes Seasons menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_base(View v) {	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
clearSeasonsMenu();	    
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.b_menu);	
showBaseMenu();	
}
    
public void Season_ONE(View v) {	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
clearSeasonsMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.s_one);
showSeasonsOne();	 
}		
	
public void Season_TWO(View v) {	
if (!(episode_isNotLocked("season_one_e3.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();	
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا فصل 1 را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
clearSeasonsMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.s_two);
showSeasonsTwo();
}
}	
		
public void Season_THREE(View v) {
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();	
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "این قسمت در بروز رسانی بعدی قابل بازی هست",
Toast.LENGTH_SHORT);
toastMessage.show();			
/*	
if (!(episode_isNotLocked("season_two_e3.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();	
Toast.makeText(MainActivity.this, "لطفا ابتدا فصل 2 را تمام کنید!",
Toast.LENGTH_SHORT).show();
}
else{	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
clearSeasonsMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.s_three);
showSeasonsThree();
}
*/
}
	
public void Season_FOUR(View v) {
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();	
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "این قسمت در بروز رسانی بعدی قابل بازی هست",
Toast.LENGTH_SHORT);
toastMessage.show();		
/*	
if (!(episode_isNotLocked("season_three_e3.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();	
Toast.makeText(MainActivity.this, "لطفا ابتدا فصل 3 را تمام کنید!",
Toast.LENGTH_SHORT).show();
}
else{	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();
clearSeasonsMenu();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.s_four);
showSeasonsFour();
}
*/
}
	
//all button codes Seasons menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//all button codes Season one/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_seasons_From_one(View v) {	    
if (toastMessage!= null) {
    toastMessage.cancel();
}
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
clearSeasonsOne();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.ss_menu);
showSeasonsMenu();
}
    
public void Season_One_E1(View v) {	
if (toastMessage!= null) {
    toastMessage.cancel();
}
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s1e1").execute();  
}
	
public void Season_One_E2(View v) {	
if (!(episode_isNotLocked("season_one_e1.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();	
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا جنگل اول را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();		
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s1e2").execute();  
}
}	
		
public void Season_One_E3(View v) {
if (!(episode_isNotLocked("season_one_e2.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();	
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا جنگل دوم را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();		
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s1e3").execute();
}
}

//all button codes Season one/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//all button codes Season two/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_seasons_From_two(View v) {	 
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
clearSeasonsTwo();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.ss_menu);
showSeasonsMenu();
}
    
public void Season_Two_E1(View v) {	
if (!(episode_isNotLocked("season_one_e3.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا جنگل سوم را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s2e1").execute(); 
} 
}		
	
public void Season_Two_E2(View v) {	
if (!(episode_isNotLocked("season_two_e1.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا یخبندان اول را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s2e2").execute();  
} 
}	
		
public void Season_Two_E3(View v) {
if (!(episode_isNotLocked("season_two_e2.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا یخبندان دوم را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s2e3").execute(); 
} 
}
//all button codes Season two/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//all button codes Season three/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_seasons_From_three(View v) {	 
if (toastMessage!= null) {
    toastMessage.cancel();
}
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();		
clearSeasonsThree();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.ss_menu);	
showSeasonsMenu();
}
    
public void Season_Three_E1(View v) {	
if (!(episode_isNotLocked("season_two_e3.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا یخبندان سوم را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s3e1").execute(); 
} 	 
}		
	
public void Season_Three_E2(View v) {	
if (!(episode_isNotLocked("season_three_e1.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا بیابان اول را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s3e2").execute();	
} 	
}	
		
public void Season_Three_E3(View v) {
if (!(episode_isNotLocked("season_three_e2.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا بیابان دوم را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s3e3").execute();  
} 
}
//all button codes Season three/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************		
//all button codes Season four/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public void back_to_seasons_From_four(View v) {	    
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
clearSeasonsFour();
ImageView allback_images = (ImageView) findViewById(R.id.allback_images); 	
ImageViewAnimatedChange(MainActivity.this,allback_images,R.drawable.ss_menu);	
showSeasonsMenu();
}
    
public void Season_Four_E1(View v) {	
if (!(episode_isNotLocked("season_three_e3.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا بیابان سوم را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s4e1").execute();
} 	 
}		
	
public void Season_Four_E2(View v) {	
if (!(episode_isNotLocked("season_four_e1.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا اقیانوس اول را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s4e2").execute(); 
} 
}	
		
public void Season_Four_E3(View v) {
if (!(episode_isNotLocked("season_four_e2.txt"))){
mediaPlayer_lock.seekTo(0);
mediaPlayer_lock.start();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "لطفا ابتدا اقیانوس دوم را تمام کنید!",
Toast.LENGTH_SHORT);
toastMessage.show();	
}
else{	
if (toastMessage!= null) {
    toastMessage.cancel();
}	
mediaPlayer_click.seekTo(0);	
mediaPlayer_click.start();	
mediaPlayer_menu.pause();	
new gotoLevel(MainActivity.this,"1=s4e3").execute(); 
} 
}
//all button codes Season three/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//***********************************^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^**********************************	
//###################################################################	functions need for better managment!
//base menu	
public  void showBaseMenu(){
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
public  void clearBaseMenu(){
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
public  void showSeasonsMenu(){
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
public  void clearSeasonsMenu(){
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
public  void showSeasonsOne(){
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
Button sOneEoneStars = (Button) findViewById(R.id.sOneEoneStars);
sOneEoneStars.setVisibility(View.VISIBLE);
sOneEoneStars.setEnabled(true);	
Button sOneEtwoStars = (Button) findViewById(R.id.sOneEtwoStars);
sOneEtwoStars.setVisibility(View.VISIBLE);
sOneEtwoStars.setEnabled(true);	
Button sOneEthreeStars = (Button) findViewById(R.id.sOneEthreeStars);
sOneEthreeStars.setVisibility(View.VISIBLE);
sOneEthreeStars.setEnabled(true);			
}		
public  void clearSeasonsOne(){
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
Button sOneEoneStars = (Button) findViewById(R.id.sOneEoneStars);
sOneEoneStars.setVisibility(View.GONE);
sOneEoneStars.setEnabled(false);	
Button sOneEtwoStars = (Button) findViewById(R.id.sOneEtwoStars);
sOneEtwoStars.setVisibility(View.GONE);
sOneEtwoStars.setEnabled(false);	
Button sOneEthreeStars = (Button) findViewById(R.id.sOneEthreeStars);
sOneEthreeStars.setVisibility(View.GONE);
sOneEthreeStars.setEnabled(false);				
}	
//Season one
//#############################
//Season two	
public  void showSeasonsTwo(){
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
Button sTwoEoneStars = (Button) findViewById(R.id.sTwoEoneStars);
sTwoEoneStars.setVisibility(View.VISIBLE);
sTwoEoneStars.setEnabled(true);	
Button sTwoEtwoStars = (Button) findViewById(R.id.sTwoEtwoStars);
sTwoEtwoStars.setVisibility(View.VISIBLE);
sTwoEtwoStars.setEnabled(true);	
Button sTwoEthreeStars = (Button) findViewById(R.id.sTwoEthreeStars);
sTwoEthreeStars.setVisibility(View.VISIBLE);
sTwoEthreeStars.setEnabled(true);				
}		
public  void clearSeasonsTwo(){
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
Button sTwoEoneStars = (Button) findViewById(R.id.sTwoEoneStars);
sTwoEoneStars.setVisibility(View.GONE);
sTwoEoneStars.setEnabled(false);	
Button sTwoEtwoStars = (Button) findViewById(R.id.sTwoEtwoStars);
sTwoEtwoStars.setVisibility(View.GONE);
sTwoEtwoStars.setEnabled(false);	
Button sTwoEthreeStars = (Button) findViewById(R.id.sTwoEthreeStars);
sTwoEthreeStars.setVisibility(View.GONE);
sTwoEthreeStars.setEnabled(false);				
}	
//Season two
//##########################
//Season three
public  void showSeasonsThree(){
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
Button sThreeEoneStars = (Button) findViewById(R.id.sThreeEoneStars);
sThreeEoneStars.setVisibility(View.VISIBLE);
sThreeEoneStars.setEnabled(true);	
Button sThreeEtwoStars = (Button) findViewById(R.id.sThreeEtwoStars);
sThreeEtwoStars.setVisibility(View.VISIBLE);
sThreeEtwoStars.setEnabled(true);	
Button sThreeEthreeStars = (Button) findViewById(R.id.sThreeEthreeStars);
sThreeEthreeStars.setVisibility(View.VISIBLE);
sThreeEthreeStars.setEnabled(true);				
}
public  void clearSeasonsThree(){
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
Button sThreeEoneStars = (Button) findViewById(R.id.sThreeEoneStars);
sThreeEoneStars.setVisibility(View.GONE);
sThreeEoneStars.setEnabled(false);	
Button sThreeEtwoStars = (Button) findViewById(R.id.sThreeEtwoStars);
sThreeEtwoStars.setVisibility(View.GONE);
sThreeEtwoStars.setEnabled(false);	
Button sThreeEthreeStars = (Button) findViewById(R.id.sThreeEthreeStars);
sThreeEthreeStars.setVisibility(View.GONE);
sThreeEthreeStars.setEnabled(false);				
}
//Season three 
//##################################
//Season four
public  void showSeasonsFour(){
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
Button sFourEoneStars = (Button) findViewById(R.id.sFourEoneStars);
sFourEoneStars.setVisibility(View.VISIBLE);
sFourEoneStars.setEnabled(true);	
Button sFourEtwoStars = (Button) findViewById(R.id.sFourEtwoStars);
sFourEtwoStars.setVisibility(View.VISIBLE);
sFourEtwoStars.setEnabled(true);	
Button sFourEthreeStars = (Button) findViewById(R.id.sFourEthreeStars);
sFourEthreeStars.setVisibility(View.VISIBLE);
sFourEthreeStars.setEnabled(true);				
}	
public  void clearSeasonsFour(){
Button BackToSeasonsFromFour = (Button) findViewById(R.id.BackToSeasonsFromFour);
BackToSeasonsFromFour.setVisibility(View.GONE);
BackToSeasonsFromFour.setEnabled(false);
Button sFourEone = (Button) findViewById(R.id.sFourEone);
sFourEone.setVisibility(View.GONE);
sFourEone.setEnabled(false);	
Button sFourEtwo = (Button) findViewById(R.id.sFourEtwo);
sFourEtwo.setVisibility(View.GONE);
sFourEtwo.setEnabled(false);	
Button sFourEthree = (Button) findViewById(R.id.sFourEthree);
sFourEthree.setVisibility(View.GONE);
sFourEthree.setEnabled(false);				
Button sFourEoneStars = (Button) findViewById(R.id.sFourEoneStars);
sFourEoneStars.setVisibility(View.GONE);
sFourEoneStars.setEnabled(false);	
Button sFourEtwoStars = (Button) findViewById(R.id.sFourEtwoStars);
sFourEtwoStars.setVisibility(View.GONE);
sFourEtwoStars.setEnabled(false);	
Button sFourEthreeStars = (Button) findViewById(R.id.sFourEthreeStars);
sFourEthreeStars.setVisibility(View.GONE);
sFourEthreeStars.setEnabled(false);				
}	
//Season four	
//###################################################################	functions need for better managment!
	
	
//**********************^^^^^^^^^^^^^^^^^^^^^^^^^^****************************^^^^^^^^^^^^^^^^^^^^^^******************
	
	
//###################################################################	functions for unlocking episodes and seasons	

//this function is called in onCreate and onResume for seasons and episodes lock update	
public void init_seasons_state(){	
String storagePath  = "";
if (this.getExternalFilesDir(null).getAbsolutePath() != null)
storagePath = this.getExternalFilesDir(null).getAbsolutePath();
else
storagePath = this.getFilesDir().getAbsolutePath();	
File directory = new File(storagePath+File.separator+"save"+File.separator+"archive"+File.separator+"save");	
directory.mkdirs();	
//----------------------------------------------------------------init seasons existance vars for better coding	
boolean season_one_e1 = episode_isNotLocked("season_one_e1.txt");
boolean season_one_e2 = episode_isNotLocked("season_one_e2.txt");
boolean season_one_e3 = episode_isNotLocked("season_one_e3.txt");
boolean season_two_e1 = episode_isNotLocked("season_two_e1.txt");
boolean season_two_e2 = episode_isNotLocked("season_two_e2.txt");
boolean season_two_e3 = episode_isNotLocked("season_two_e3.txt");
boolean season_three_e1 = episode_isNotLocked("season_three_e1.txt");
boolean season_three_e2 = episode_isNotLocked("season_three_e2.txt");
boolean season_three_e3 = episode_isNotLocked("season_three_e3.txt");
boolean season_four_e1 = episode_isNotLocked("season_four_e1.txt");
boolean season_four_e2 = episode_isNotLocked("season_four_e2.txt");
boolean season_four_e3 = episode_isNotLocked("season_four_e3.txt");	
//----------------------------------------------------------------init button vars for better coding
//Button sOne = (Button) findViewById(R.id.sOne);    never is locked
Button sTwo = (Button) findViewById(R.id.sTwo);	
Button sThree = (Button) findViewById(R.id.sThree);		
Button sFour = (Button) findViewById(R.id.sFour); 		
//Button sOneEone = (Button) findViewById(R.id.sOneEone);    never is locked 
Button sOneEtwo = (Button) findViewById(R.id.sOneEtwo);	
Button sOneEthree = (Button) findViewById(R.id.sOneEthree);		
Button sTwoEone = (Button) findViewById(R.id.sTwoEone);	
Button sTwoEtwo = (Button) findViewById(R.id.sTwoEtwo);	
Button sTwoEthree = (Button) findViewById(R.id.sTwoEthree);
Button sThreeEone = (Button) findViewById(R.id.sThreeEone);
Button sThreeEtwo = (Button) findViewById(R.id.sThreeEtwo);
Button sThreeEthree = (Button) findViewById(R.id.sThreeEthree);
Button sFourEone = (Button) findViewById(R.id.sFourEone);
Button sFourEtwo = (Button) findViewById(R.id.sFourEtwo);
Button sFourEthree = (Button) findViewById(R.id.sFourEthree);
//----------------------------------------------------------------set the button image for locked or not locked	
if(season_one_e1)
sOneEtwo.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
if(season_one_e2)
sOneEthree.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
if(season_one_e3){
sTwo.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
sTwoEone.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
}	
if(season_two_e1)
sTwoEtwo.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
if(season_two_e2)
sTwoEthree.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
if(season_two_e3){
sThree.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
sThreeEone.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
}
if(season_three_e1)
sThreeEtwo.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);
if(season_three_e2)
sThreeEthree.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
if(season_three_e3){
sFour.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
sFourEone.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
}
if(season_four_e1)
sFourEtwo.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
if(season_four_e2)
sFourEthree.setCompoundDrawablesWithIntrinsicBounds(null, null, null, null);	
//if(season_four_e3) for now season_four_e3 is the last level
	
//###init scoore and stars :
//-------season one
setStarsAndScores("s1e1_save.txt",(Button) findViewById(R.id.sOneEoneStars));				
setStarsAndScores("s1e2_save.txt",(Button) findViewById(R.id.sOneEtwoStars));	
setStarsAndScores("s1e3_save.txt",(Button) findViewById(R.id.sOneEthreeStars));	
//-------season two
setStarsAndScores("s2e1_save.txt",(Button) findViewById(R.id.sTwoEoneStars));	
setStarsAndScores("s2e2_save.txt",(Button) findViewById(R.id.sTwoEtwoStars));	
setStarsAndScores("s2e3_save.txt",(Button) findViewById(R.id.sTwoEthreeStars));	
//-------season three
setStarsAndScores("s3e1_save.txt",(Button) findViewById(R.id.sThreeEoneStars));	
setStarsAndScores("s3e2_save.txt",(Button) findViewById(R.id.sThreeEtwoStars));	
setStarsAndScores("s3e3_save.txt",(Button) findViewById(R.id.sThreeEthreeStars));	
//-------season four
setStarsAndScores("s4e1_save.txt",(Button) findViewById(R.id.sFourEoneStars));	
setStarsAndScores("s4e2_save.txt",(Button) findViewById(R.id.sFourEtwoStars));	
setStarsAndScores("s4e3_save.txt",(Button) findViewById(R.id.sFourEthreeStars));	
}
	
//helper function to detect seasons and episodes states 	
public boolean episode_isNotLocked(String FileName){
String storagePath  = "";
if (this.getExternalFilesDir(null).getAbsolutePath() != null)
storagePath = this.getExternalFilesDir(null).getAbsolutePath();
else
storagePath = this.getFilesDir().getAbsolutePath();	
File file = new File(storagePath+File.separator+"save"+File.separator+"archive"+File.separator+FileName);
if(file.exists()){//if file exists       
try {
BufferedReader brTest = new BufferedReader(new FileReader(file));
String text = brTest.readLine();
if(text.equals("0"))  
return false; //season is locked
else
return true; //season is not locked
}catch (IOException e) {//| FileNotFoundException
             System.out.println("Can't write"); // Or something more intellegent
}	
}else{//if file does'nt exists
try {
FileOutputStream stream = new FileOutputStream(storagePath+File.separator+"save"+File.separator+"archive"+File.separator+FileName);
try {
    stream.write("0".getBytes());
    stream.close();
}catch (IOException e) {
System.out.println("Can't write"); // Or something more intellegent
}		
} catch (FileNotFoundException e) {
System.out.println("Can't find"); // Or something more intellegent
}	
	return false; //season is locked
}		
	
return false;
	
}

//###################################################################	functions for unlocking episodes and seasons
	
	
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
	
//###################################################################functions for helping showing scoores 
public void setStarsAndScores(String FileName,Button b){	
try{		
String storagePath  = "";
int stars = 0;	
double time = 0;
double s = 0;
double m = 0;
double h = 0;	
FileInputStream is;
BufferedReader reader;	
if (this.getExternalFilesDir(null).getAbsolutePath() != null)
storagePath = this.getExternalFilesDir(null).getAbsolutePath();
else
storagePath = this.getFilesDir().getAbsolutePath();	
File file = new File(storagePath+File.separator+"save"+File.separator+"archive"+File.separator+FileName);	
if(file.exists()){	
is = new FileInputStream(file);
reader = new BufferedReader(new InputStreamReader(is));
String line = reader.readLine(); //score
line = reader.readLine(); //stars	
String substr = " ";	
if (line != null){
substr = line.substring(2);	
stars = Integer.parseInt(substr);	
}	
line = reader.readLine(); //time	
if (line != null){
substr = line.substring(2);	
time = Long.parseLong(substr);
h = Math.floor(time/3600);
m = Math.floor( (time - (h * 3600))/60 );
s = time - ( (m * 60) + (h * 3600) );	
}		
int i1 = (int) h;
int i2 = (int) m;
int i3 = (int) s;	
String	texttt = String.valueOf(i1) + ":" + String.valueOf(i2) + ":" + String.valueOf(i3); 
b.setText(texttt);
Drawable image = this.getResources().getDrawable( R.drawable.star_zero );
if (stars == 1)
image = this.getResources().getDrawable( R.drawable.star_one );
else if (stars == 2)
image = this.getResources().getDrawable( R.drawable.star_two );	
else if (stars == 3)
image = this.getResources().getDrawable( R.drawable.star_three );	
	
int hi = image.getIntrinsicHeight(); 
int wi = image.getIntrinsicWidth();   
image.setBounds( 0, 0, wi, hi );
b.setCompoundDrawables( image, null, null, null );	
}else{//file does'nt exist
String	texttt = "00" + ":" + "00" + ":" + "00"; 
b.setText(texttt);
Drawable image = this.getResources().getDrawable( R.drawable.star_zero );	
int hi = image.getIntrinsicHeight(); 
int wi = image.getIntrinsicWidth();   
image.setBounds( 0, 0, wi, hi );
b.setCompoundDrawables( image, null, null, null );		
}
}catch(IOException ioe){
    ioe.printStackTrace();
}	
}
//###################################################################functions for helping showing scoores 
//-----------------------------------------------
//###################################################################functions for showing wellcome message with username	
public void take_username_and_show_wellcome_message_if_already_exist(){

String Path  = "";
if (this.getExternalFilesDir(null).getAbsolutePath() != null)
Path = this.getExternalFilesDir(null).getAbsolutePath();
else
Path = this.getFilesDir().getAbsolutePath();	

final String storagePath = Path; 
File file = new File(storagePath+File.separator+"username.txt");
if(file.exists()){//if file exists       
try {
BufferedReader brTest = new BufferedReader(new FileReader(file));
String text = brTest.readLine();
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, " خوش آمدید " + text,
Toast.LENGTH_SHORT);
toastMessage.show();	
	
}catch (IOException e) {//| FileNotFoundException
             System.out.println("Can't write"); // Or something more intellegent
}	
}else{//if file does'nt exists

		//create username
		AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle("نام نویسی");
	        builder.setCancelable(false);
	        builder.setMessage("لطفا ابتدا نام خود را وارد کنید و سپس تایید را لمس کنید");
                // Set up the input
                final EditText input = new EditText(this);
                // Specify the type of input expected; this, for example, sets the input as a password, and will mask the text
                input.setInputType(InputType.TYPE_CLASS_TEXT);
                builder.setView(input);
                // Set up the buttons
                builder.setPositiveButton("تایید", new DialogInterface.OnClickListener() { 
                @Override
                public void onClick(DialogInterface dialog, int which) {
                m_Text = input.getText().toString();
		String test = input.getText().toString().trim();
		if(TextUtils.isEmpty(test)) {
                        if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, "هیچ اسمی وارد نشده است!",
Toast.LENGTH_SHORT);
toastMessage.show();	
take_username_and_show_wellcome_message_if_already_exist();			
                        }else{	
			
		try {
FileOutputStream stream = new FileOutputStream(storagePath+File.separator+"username.txt");
try {
    stream.write(m_Text.getBytes());
    stream.close();
}catch (IOException e) {
System.out.println("Can't write"); // Or something more intellegent
}		
} catch (FileNotFoundException e) {
System.out.println("Can't find"); // Or something more intellegent
}	
			
if (toastMessage!= null) {
    toastMessage.cancel();
}
toastMessage = Toast.makeText(MainActivity.this, " خوش آمدید " + m_Text,
Toast.LENGTH_SHORT);
toastMessage.show();	
		}
                }
                });
                builder.show();
			

}	
}//end of function	
//---------------------------------------------------------------------------------------------	
public void show_wellcome_message_if_should_and_change_its_state(){
String storagePath  = "";
if (this.getExternalFilesDir(null).getAbsolutePath() != null)
storagePath = this.getExternalFilesDir(null).getAbsolutePath();
else
storagePath = this.getFilesDir().getAbsolutePath();	
File file = new File(storagePath+File.separator+"save"+File.separator+"archive"+File.separator+"wellcome_state.txt");
if(file.exists()){//if file exists       
try {
BufferedReader brTest = new BufferedReader(new FileReader(file));
String text = brTest.readLine();		
if(text.equals("0")){	
take_username_and_show_wellcome_message_if_already_exist();
FileOutputStream stream = new FileOutputStream(storagePath+File.separator+"save"+File.separator+"archive"+File.separator+"wellcome_state.txt");
    stream.write("1".getBytes());
    stream.close();
	
}//if equals

}catch (IOException e) {
System.out.println("Can't write"); // Or something more intellegent
}		
	
}else{//if file does not exist
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

show_wellcome_message_if_should_and_change_its_state();	
	
}
	
}	
	
//###################################################################functions for showing wellcome message with username	
	
}
