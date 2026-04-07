# python-email
The hoops I had to jump through to send an email via gmail from python

## Implementing this code
There's some extra steps you have to take and edits to make to the existing files before you're able to send emails from python: 
-  Prerequisite: you must have Python installed.  Any version beyond Python 3 should do
-  Update all instances of `___VARIABLES_THAT_LOOK_LIKE_THIS___` in `check_ip.sh` and `send_email.py`
-  The `client_secret___YOUR_CLIENT_ID___.apps.googleusercontent.com.json` file you will not create yourself.  You must generate it from the Gmail API config page.  Follow [this guide](https://developers.google.com/workspace/gmail/api/quickstart/python) to get your own client secret file
    - Note: you must have a valid gmail account to send emails from
-  Finally, to run this code simply navigate your terminal to this project's directory and run `./check_ip.sh`
    - If you are unable to run due to permission errors, `chmod 744` should allow your user account to execute this .sh file
    - If you run into this error: `Access blocked: <my project name> has not completed the Google verification process` then follow [this guide](https://stackoverflow.com/questions/75454425/access-blocked-project-has-not-completed-the-google-verification-process)



## Installing the app as a cron job
When you have successfully run the program (and received an email without having to open the browser), you will need to install the script as a [cron job](https://cronitor.io/guides/cron-jobs)
- In your terminal, run `crontab -e`
- Press `i` to enter insert mode, then add the following: `*/10 * * * * cd /PATH/TO/DIRECTORY/CONTAINING/SHELL/SCRIPT; sh check_ip.sh`
- Exit the crontab editor:
    - Press `Esc` to exit insert mode
    - Press `:` to begin entering a command into the `vi` editor
    - Enter `wq` then hit enter
- If you entered the crontab correctly, you should see `crontab: installing new crontab` in your terminal

You are done! Your shell script should be configured to run once every ten minutes.  Feel free to change the timing as you require, [this page](https://crontab.guru) is handy for easily setting cron job timings.  
