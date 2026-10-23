package org.love2d.android;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.color.DynamicColors;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * صفحه اسپلش Material Design 3
 * لوگوی LÖVE با فید به لوگوی بازی + عنوان و زیرنویس متحرک
 * سازگار با Android 8 (API 26) تا Android 15
 */
public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        DynamicColors.applyToActivityIfAvailable(this);
        setContentView(R.layout.activity_splash);

        init_wellcome_msg();
        animateTexts();
        showLogo();
        goToMain();
    }

    /** فید کردن عنوان و زیرنویس بعد از نمایش لوگو */
    private void animateTexts() {
        TextView title = findViewById(R.id.splash_title);
        TextView subtitle = findViewById(R.id.splash_subtitle);
        title.animate().alpha(1f).setDuration(700).setStartDelay(600).start();
        subtitle.animate().alpha(1f).setDuration(700).setStartDelay(1000).start();
    }

    public void showLogo() {
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                ImageView splash_image = findViewById(R.id.splash_image);
                ImageViewAnimatedChange(SplashActivity.this, splash_image, R.drawable.main_logo);
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
        }, 4200);
    }

    // ################################################################### فید بین دو تصویر
    public static void ImageViewAnimatedChange(final Context c, final ImageView v, final int resId) {
        final Animation anim_out = AnimationUtils.loadAnimation(c, android.R.anim.fade_out);
        final Animation anim_in = AnimationUtils.loadAnimation(c, android.R.anim.fade_in);
        anim_out.setAnimationListener(new AnimationListener() {
            @Override public void onAnimationStart(Animation animation) {}
            @Override public void onAnimationRepeat(Animation animation) {}
            @Override
            public void onAnimationEnd(Animation animation) {
                v.setImageBitmap(BitmapFactory.decodeResource(c.getResources(), resId));
                v.startAnimation(anim_in);
            }
        });
        v.startAnimation(anim_out);
    }
    // ###################################################################

    // ################################################################### ساخت فایل خوش‌آمدگویی
    public void init_wellcome_msg() {
        try {
            String storagePath = baseDir(this);
            File saveDir = new File(storagePath, "save" + File.separator + "archive");
            //noinspection ResultOfMethodCallIgnored
            saveDir.mkdirs();
            FileOutputStream stream = new FileOutputStream(new File(saveDir, "wellcome_state.txt"));
            stream.write("0".getBytes());
            stream.close();
        } catch (IOException e) {
            System.out.println("Can't write wellcome_state: " + e.getMessage());
        }
    }
    // ###################################################################

    /** مسیر پایه ذخیره‌سازی با بررسی صحیح null (رفع باگ نسخه قبلی) */
    public static String baseDir(Context ctx) {
        File ext = ctx.getExternalFilesDir(null);
        return ext != null ? ext.getAbsolutePath() : ctx.getFilesDir().getAbsolutePath();
    }
}
