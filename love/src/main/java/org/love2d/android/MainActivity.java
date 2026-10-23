package org.love2d.android;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.google.android.material.button.MaterialButton;
import com.google.android.material.color.DynamicColors;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.textfield.TextInputEditText;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * منوی اصلی بازی قهرمان سایه‌ای - بازنویسی شده با Material Design 3
 * منطق قفل‌گذاری اپیزودها، ستاره‌ها و زمان بازی از نسخه قبلی حفظ شده است.
 * سازگار با Android 8 (API 26) تا Android 15
 */
public class MainActivity extends AppCompatActivity {

    Toast toastMessage;
    private String m_Text = "";

    MediaPlayer mediaPlayer_menu;
    MediaPlayer mediaPlayer_click;
    MediaPlayer mediaPlayer_lock;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        DynamicColors.applyToActivityIfAvailable(this);
        setContentView(R.layout.activity_main);
        mediaPlayer_menu = MediaPlayer.create(MainActivity.this, R.raw.menu);
        mediaPlayer_menu.setLooping(true);
        mediaPlayer_click = MediaPlayer.create(MainActivity.this, R.raw.click);
        mediaPlayer_lock = MediaPlayer.create(MainActivity.this, R.raw.lock);
        init_seasons_state();
        show_wellcome_message_if_should_and_change_its_state();
    }

    @Override
    public void onResume() {
        super.onResume();
        init_seasons_state();
        if (!mediaPlayer_menu.isPlaying()) {
            mediaPlayer_menu.seekTo(0);
            mediaPlayer_menu.start();
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        init_seasons_state();
    }

    @Override
    protected void onPause() {
        super.onPause();
        mediaPlayer_menu.pause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (mediaPlayer_menu != null) mediaPlayer_menu.release();
        if (mediaPlayer_click != null) mediaPlayer_click.release();
        if (mediaPlayer_lock != null) mediaPlayer_lock.release();
    }

    // ==================================================================== ناوبری منوها
    /** فقط یک بخش منو را نمایش می‌دهد و بقیه را مخفی می‌کند */
    private void showMenu(int containerId) {
        int[] containers = {R.id.base_menu, R.id.seasons_menu, R.id.season_one_menu,
                R.id.season_two_menu, R.id.season_three_menu, R.id.season_four_menu};
        for (int id : containers) {
            View v = findViewById(id);
            v.setVisibility(id == containerId ? View.VISIBLE : View.GONE);
        }
    }

    private void changeBackground(int resId) {
        ImageView allback_images = findViewById(R.id.allback_images);
        ImageViewAnimatedChange(MainActivity.this, allback_images, resId);
    }

    private void playClick() {
        mediaPlayer_click.seekTo(0);
        mediaPlayer_click.start();
    }

    private void showLockToast(String message) {
        mediaPlayer_lock.seekTo(0);
        mediaPlayer_lock.start();
        if (toastMessage != null) toastMessage.cancel();
        toastMessage = Toast.makeText(MainActivity.this, message, Toast.LENGTH_SHORT);
        toastMessage.show();
    }

    // ==================================================================== کدهای دکمه‌های منوی اصلی

    public void start(View v) {
        playClick();
        showMenu(R.id.seasons_menu);
        changeBackground(R.drawable.ss_menu);
        applySeasonLockIcons();
    }

    public void trainSome(View v) {
        playClick();
        mediaPlayer_menu.pause();
        new gotoLevel(MainActivity.this, "1=train").execute();
    }

    public void goToPage(View v) {
        playClick();
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setData(Uri.parse("bazaar://details?id=" + "com.undeniables.ShadowHero"));
            intent.setPackage("com.farsitel.bazaar");
            startActivity(intent);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(this, "کافه بازار روی این دستگاه نصب نیست!", Toast.LENGTH_SHORT).show();
        }
    }

    public void commenting(View v) {
        playClick();
        try {
            Intent intent = new Intent(Intent.ACTION_EDIT);
            intent.setData(Uri.parse("bazaar://details?id=" + "com.undeniables.ShadowHero"));
            intent.setPackage("com.farsitel.bazaar");
            startActivity(intent);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(this, "کافه بازار روی این دستگاه نصب نیست!", Toast.LENGTH_SHORT).show();
        }
    }

    public void sendingEmail(View v) {
        playClick();
        try {
            Intent intent = new Intent(Intent.ACTION_SENDTO);
            intent.setData(Uri.parse("mailto: 00sohrabiranpak00@gmail.com"));
            intent.putExtra(Intent.EXTRA_SUBJECT, "نظر دهی");
            startActivity(intent);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(this, "هیچ برنامه ایمیلی پیدا نشد!", Toast.LENGTH_SHORT).show();
        }
    }

    public void goToGamesPage(View v) {
        playClick();
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setData(Uri.parse("bazaar://collection?slug=by_author&aid=" + "515731926985"));
            intent.setPackage("com.farsitel.bazaar");
            startActivity(intent);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(this, "کافه بازار روی این دستگاه نصب نیست!", Toast.LENGTH_SHORT).show();
        }
    }

    public void exit_game(View v) {
        playClick();
        this.finishAffinity();
    }

    // ==================================================================== کدهای دکمه‌های فصل‌ها

    public void back_to_base(View v) {
        if (toastMessage != null) toastMessage.cancel();
        playClick();
        showMenu(R.id.base_menu);
        changeBackground(R.drawable.b_menu);
    }

    public void Season_ONE(View v) {
        if (toastMessage != null) toastMessage.cancel();
        playClick();
        showMenu(R.id.season_one_menu);
        changeBackground(R.drawable.s_one);
        applySeasonLockIcons();
    }

    public void Season_TWO(View v) {
        if (!episode_isNotLocked("season_one_e3.txt")) {
            showLockToast("لطفا ابتدا فصل 1 را تمام کنید!");
        } else {
            if (toastMessage != null) toastMessage.cancel();
            playClick();
            showMenu(R.id.season_two_menu);
            changeBackground(R.drawable.s_two);
            applySeasonLockIcons();
        }
    }

    public void Season_THREE(View v) {
        showLockToast("این قسمت در بروز رسانی بعدی قابل بازی هست");
    }

    public void Season_FOUR(View v) {
        showLockToast("این قسمت در بروز رسانی بعدی قابل بازی هست");
    }

    // ==================================================================== کدهای دکمه‌های بازگشت و اپیزودها

    public void back_to_seasons_From_one(View v) {
        if (toastMessage != null) toastMessage.cancel();
        playClick();
        showMenu(R.id.seasons_menu);
        changeBackground(R.drawable.ss_menu);
    }

    public void back_to_seasons_From_two(View v) {
        if (toastMessage != null) toastMessage.cancel();
        playClick();
        showMenu(R.id.seasons_menu);
        changeBackground(R.drawable.ss_menu);
    }

    public void back_to_seasons_From_three(View v) {
        if (toastMessage != null) toastMessage.cancel();
        playClick();
        showMenu(R.id.seasons_menu);
        changeBackground(R.drawable.ss_menu);
    }

    public void back_to_seasons_From_four(View v) {
        if (toastMessage != null) toastMessage.cancel();
        playClick();
        showMenu(R.id.seasons_menu);
        changeBackground(R.drawable.ss_menu);
    }

    public void Season_One_E1(View v) { launchEpisode("1=s1e1"); }
    public void Season_One_E2(View v) {
        if (!episode_isNotLocked("season_one_e1.txt")) {
            showLockToast("لطفا ابتدا اپیزود قبلی را تمام کنید!");
        } else launchEpisode("1=s1e2");
    }
    public void Season_One_E3(View v) {
        if (!episode_isNotLocked("season_one_e2.txt")) {
            showLockToast("لطفا ابتدا اپیزود قبلی را تمام کنید!");
        } else launchEpisode("1=s1e3");
    }

    public void Season_Two_E1(View v) { launchEpisode("1=s2e1"); }
    public void Season_Two_E2(View v) {
        if (!episode_isNotLocked("season_two_e1.txt")) {
            showLockToast("لطفا ابتدا اپیزود قبلی را تمام کنید!");
        } else launchEpisode("1=s2e2");
    }
    public void Season_Two_E3(View v) {
        if (!episode_isNotLocked("season_two_e2.txt")) {
            showLockToast("لطفا ابتدا اپیزود قبلی را تمام کنید!");
        } else launchEpisode("1=s2e3");
    }

    public void Season_Three_E1(View v) { launchEpisode("1=s3e1"); }
    public void Season_Three_E2(View v) {
        if (!episode_isNotLocked("season_three_e1.txt")) {
            showLockToast("لطفا ابتدا اپیزود قبلی را تمام کنید!");
        } else launchEpisode("1=s3e2");
    }
    public void Season_Three_E3(View v) {
        if (!episode_isNotLocked("season_three_e2.txt")) {
            showLockToast("لطفا ابتدا اپیزود قبلی را تمام کنید!");
        } else launchEpisode("1=s3e3");
    }

    public void Season_Four_E1(View v) { launchEpisode("1=s4e1"); }
    public void Season_Four_E2(View v) {
        if (!episode_isNotLocked("season_four_e1.txt")) {
            showLockToast("لطفا ابتدا اپیزود قبلی را تمام کنید!");
        } else launchEpisode("1=s4e2");
    }
    public void Season_Four_E3(View v) {
        if (!episode_isNotLocked("season_four_e2.txt")) {
            showLockToast("لطفا ابتدا اپیزود قبلی را تمام کنید!");
        } else launchEpisode("1=s4e3");
    }

    private void launchEpisode(String level) {
        if (toastMessage != null) toastMessage.cancel();
        playClick();
        mediaPlayer_menu.pause();
        new gotoLevel(MainActivity.this, level).execute();
    }

    // ==================================================================== وضعیت قفل فصل‌ها و اپیزودها

    /** این تابع در onCreate/onResume/onStart برای بروزرسانی قفل‌ها و ستاره‌ها صدا زده می‌شود */
    public void init_seasons_state() {
        File directory = new File(baseDir(this), "save" + File.separator + "archive" + File.separator + "save");
        //noinspection ResultOfMethodCallIgnored
        directory.mkdirs();

        applySeasonLockIcons();

        // نمایش ستاره و زمان هر اپیزود
        setStarsAndScores("s1e1_save.txt", (TextView) findViewById(R.id.sOneEoneStars));
        setStarsAndScores("s1e2_save.txt", (TextView) findViewById(R.id.sOneEtwoStars));
        setStarsAndScores("s1e3_save.txt", (TextView) findViewById(R.id.sOneEthreeStars));
        setStarsAndScores("s2e1_save.txt", (TextView) findViewById(R.id.sTwoEoneStars));
        setStarsAndScores("s2e2_save.txt", (TextView) findViewById(R.id.sTwoEtwoStars));
        setStarsAndScores("s2e3_save.txt", (TextView) findViewById(R.id.sTwoEthreeStars));
        setStarsAndScores("s3e1_save.txt", (TextView) findViewById(R.id.sThreeEoneStars));
        setStarsAndScores("s3e2_save.txt", (TextView) findViewById(R.id.sThreeEtwoStars));
        setStarsAndScores("s3e3_save.txt", (TextView) findViewById(R.id.sThreeEthreeStars));
        setStarsAndScores("s4e1_save.txt", (TextView) findViewById(R.id.sFourEoneStars));
        setStarsAndScores("s4e2_save.txt", (TextView) findViewById(R.id.sFourEtwoStars));
        setStarsAndScores("s4e3_save.txt", (TextView) findViewById(R.id.sFourEthreeStars));
    }

    /** آیکون قفل روی اپیزودهای قفل‌شده (بر اساس منطق اصلی بازی) */
    private void applySeasonLockIcons() {
        // فصل اول: اپیزود ۱ همیشه باز است
        setLocked(R.id.sOneEtwo, !episode_isNotLocked("season_one_e1.txt"));
        setLocked(R.id.sOneEthree, !episode_isNotLocked("season_one_e2.txt"));

        boolean s1e3done = episode_isNotLocked("season_one_e3.txt");
        setLocked(R.id.sTwo, !s1e3done);
        setLocked(R.id.sTwoEone, !s1e3done);

        setLocked(R.id.sTwoEtwo, !episode_isNotLocked("season_two_e1.txt"));
        setLocked(R.id.sTwoEthree, !episode_isNotLocked("season_two_e2.txt"));

        boolean s2e3done = episode_isNotLocked("season_two_e3.txt");
        setLocked(R.id.sThree, !s2e3done);
        setLocked(R.id.sThreeEone, !s2e3done);

        setLocked(R.id.sThreeEtwo, !episode_isNotLocked("season_three_e1.txt"));
        setLocked(R.id.sThreeEthree, !episode_isNotLocked("season_three_e2.txt"));

        boolean s3e3done = episode_isNotLocked("season_three_e3.txt");
        setLocked(R.id.sFour, !s3e3done);
        setLocked(R.id.sFourEone, !s3e3done);

        setLocked(R.id.sFourEtwo, !episode_isNotLocked("season_four_e1.txt"));
        setLocked(R.id.sFourEthree, !episode_isNotLocked("season_four_e2.txt"));
        // s4e3 آخرین مرحله بازی است
    }

    private void setLocked(int buttonId, boolean locked) {
        MaterialButton b = findViewById(buttonId);
        if (locked) {
            b.setIconResource(R.drawable.ic_lock);
        } else {
            b.setIcon(null);
        }
    }

    /** بررسی قفل بودن اپیزود از روی فایل ذخیره (منطق اصلی حفظ شده) */
    public boolean episode_isNotLocked(String FileName) {
        File file = new File(baseDir(this), "save" + File.separator + "archive" + File.separator + FileName);
        if (file.exists()) {
            try {
                BufferedReader brTest = new BufferedReader(new FileReader(file));
                String text = brTest.readLine();
                brTest.close();
                if (text != null && text.equals("0")) return false; // قفل است
                return true; // باز است
            } catch (IOException e) {
                System.out.println("Can't read: " + e.getMessage());
            }
        } else {
            try {
                //noinspection ResultOfMethodCallIgnored
                file.getParentFile().mkdirs();
                FileOutputStream stream = new FileOutputStream(file);
                stream.write("0".getBytes());
                stream.close();
            } catch (IOException e) {
                System.out.println("Can't write: " + e.getMessage());
            }
            return false; // قفل است
        }
        return false;
    }

    // ==================================================================== انیمیشن پس‌زمینه
    public static void ImageViewAnimatedChange(final Context c, final ImageView v, final int resId) {
        final Animation anim_out = AnimationUtils.loadAnimation(c, android.R.anim.fade_out);
        final Animation anim_in = AnimationUtils.loadAnimation(c, android.R.anim.fade_in);
        anim_out.setAnimationListener(new AnimationListener() {
            @Override public void onAnimationStart(Animation animation) {}
            @Override public void onAnimationRepeat(Animation animation) {}
            @Override
            public void onAnimationEnd(Animation animation) {
                v.setImageBitmap(android.graphics.BitmapFactory.decodeResource(c.getResources(), resId));
                v.startAnimation(anim_in);
            }
        });
        v.startAnimation(anim_out);
    }

    // ==================================================================== نمایش ستاره و زمان هر اپیزود
    public void setStarsAndScores(String FileName, TextView b) {
        try {
            int stars = 0;
            long time = 0;
            File file = new File(baseDir(this), "save" + File.separator + "archive" + File.separator + FileName);
            if (file.exists()) {
                FileInputStream is = new FileInputStream(file);
                BufferedReader reader = new BufferedReader(new InputStreamReader(is));
                String line = reader.readLine(); // score
                line = reader.readLine();        // stars
                if (line != null) {
                    stars = Integer.parseInt(line.substring(2));
                }
                line = reader.readLine();        // time
                if (line != null) {
                    time = Long.parseLong(line.substring(2));
                }
                reader.close();
            }
            long h = time / 3600;
            long m = (time - (h * 3600)) / 60;
            long s = time - ((m * 60) + (h * 3600));
            b.setText(String.valueOf(h) + ":" + String.valueOf(m) + ":" + String.valueOf(s));

            int starRes = (stars == 1) ? R.drawable.star_one
                    : (stars == 2) ? R.drawable.star_two
                    : (stars == 3) ? R.drawable.star_three
                    : R.drawable.star_zero;
            Drawable image = ContextCompat.getDrawable(this, starRes);
            if (image != null) {
                image.setBounds(0, 0, image.getIntrinsicWidth(), image.getIntrinsicHeight());
                b.setCompoundDrawablesWithIntrinsicBounds(image, null, null, null);
            }
        } catch (IOException | NumberFormatException ioe) {
            ioe.printStackTrace();
        }
    }

    // ==================================================================== پیام خوش‌آمدگویی با نام کاربر
    public void take_username_and_show_wellcome_message_if_already_exist() {
        final String storagePath = baseDir(this);
        File file = new File(storagePath, "username.txt");
        if (file.exists()) {
            try {
                BufferedReader brTest = new BufferedReader(new FileReader(file));
                String text = brTest.readLine();
                brTest.close();
                if (toastMessage != null) toastMessage.cancel();
                toastMessage = Toast.makeText(MainActivity.this, " خوش آمدید " + text, Toast.LENGTH_SHORT);
                toastMessage.show();
            } catch (IOException e) {
                System.out.println("Can't read username: " + e.getMessage());
            }
        } else {
            View dialogView = getLayoutInflater().inflate(R.layout.dialog_username, null);
            TextInputEditText input = dialogView.findViewById(R.id.username_input);

            MaterialAlertDialogBuilder builder = new MaterialAlertDialogBuilder(this);
            builder.setTitle("نام نویسی");
            builder.setCancelable(false);
            builder.setView(dialogView);
            builder.setPositiveButton("تایید", (dialog, which) -> {
                m_Text = input.getText() != null ? input.getText().toString() : "";
                String test = m_Text.trim();
                if (TextUtils.isEmpty(test)) {
                    if (toastMessage != null) toastMessage.cancel();
                    toastMessage = Toast.makeText(MainActivity.this, "هیچ اسمی وارد نشده است!", Toast.LENGTH_SHORT);
                    toastMessage.show();
                    take_username_and_show_wellcome_message_if_already_exist();
                } else {
                    try {
                        FileOutputStream stream = new FileOutputStream(new File(storagePath, "username.txt"));
                        stream.write(m_Text.getBytes());
                        stream.close();
                    } catch (IOException e) {
                        System.out.println("Can't write username: " + e.getMessage());
                    }
                    if (toastMessage != null) toastMessage.cancel();
                    toastMessage = Toast.makeText(MainActivity.this, " خوش آمدید " + m_Text, Toast.LENGTH_SHORT);
                    toastMessage.show();
                }
            });
            builder.show();
        }
    }

    public void show_wellcome_message_if_should_and_change_its_state() {
        File file = new File(baseDir(this), "save" + File.separator + "archive" + File.separator + "wellcome_state.txt");
        if (file.exists()) {
            try {
                BufferedReader brTest = new BufferedReader(new FileReader(file));
                String text = brTest.readLine();
                brTest.close();
                if (text != null && text.equals("0")) {
                    take_username_and_show_wellcome_message_if_already_exist();
                    FileOutputStream stream = new FileOutputStream(file);
                    stream.write("1".getBytes());
                    stream.close();
                }
            } catch (IOException e) {
                System.out.println("Can't write wellcome_state: " + e.getMessage());
            }
        } else {
            try {
                //noinspection ResultOfMethodCallIgnored
                file.getParentFile().mkdirs();
                FileOutputStream stream = new FileOutputStream(file);
                stream.write("0".getBytes());
                stream.close();
            } catch (IOException e) {
                System.out.println("Can't write wellcome_state: " + e.getMessage());
            }
            show_wellcome_message_if_should_and_change_its_state();
        }
    }
}
