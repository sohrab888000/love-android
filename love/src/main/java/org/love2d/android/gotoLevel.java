package org.love2d.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.view.View;
import android.view.Window;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.progressindicator.LinearProgressIndicator;
import com.google.android.material.textview.MaterialTextView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * نوشتن مرحله انتخاب‌شده در chooser.txt و اجرای GameActivity
 * دیالوگ پیشرفت با Material Design 3 جایگزین ProgressDialog منسوخ شده است.
 */
public class gotoLevel extends AsyncTask<Void, Integer, Void> {

    private final static String TAG = "gotoLevel";
    private final String level;
    private final Context ctx;
    private androidx.appcompat.app.AlertDialog progressDialog;

    public gotoLevel(Context ctx, String level) {
        super();
        this.level = level;
        this.ctx = ctx;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        if (!(ctx instanceof Activity) || ((Activity) ctx).isFinishing()) return;

        View view = View.inflate(ctx, R.layout.dialog_loading, null);
        LinearProgressIndicator bar = view.findViewById(R.id.loading_bar);
        bar.setIndeterminate(true);
        MaterialTextView text = view.findViewById(R.id.loading_text);
        text.setText("در حال انجام عملیات...لطفا شکیبا باشید");

        progressDialog = new MaterialAlertDialogBuilder(ctx)
                .setView(view)
                .setCancelable(false)
                .create();
        progressDialog.show();
        Window w = progressDialog.getWindow();
        if (w != null) w.setLayout(android.view.ViewGroup.LayoutParams.WRAP_CONTENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    @Override
    protected Void doInBackground(Void... params) {
        try {
            File dir = new File(SplashActivity.baseDir(ctx), "save" + File.separator + "archive");
            //noinspection ResultOfMethodCallIgnored
            dir.mkdirs();
            FileOutputStream stream = new FileOutputStream(new File(dir, "chooser.txt"));
            stream.write(level.getBytes());
            stream.close();
        } catch (IOException e) {
            System.out.println(TAG + " Can't write chooser.txt: " + e.getMessage());
        }
        return null;
    }

    @Override
    protected void onProgressUpdate(Integer... progress) {
        // برای سازگاری حفظ شده
    }

    @Override
    protected void onPostExecute(Void v) {
        if (progressDialog != null && progressDialog.isShowing()) {
            try {
                progressDialog.dismiss();
            } catch (Exception ignored) {}
        }
        Intent myintent = new Intent(ctx, GameActivity.class);
        ctx.startActivity(myintent);
        if (ctx instanceof Activity) {
            ((Activity) ctx).overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
        }
    }
}
