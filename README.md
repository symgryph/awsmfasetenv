# awsmfasetenv
Set the MFA environement for bash using aws utility
## Dependencies
1. jq
2. you need to set and create an mfa in your home directory
3. working version of aws utility
4. working secret etc. configured in aws config file
5. Your MFA arn (good luck)
## Invoking
Its a bit tricky. You run token.pl file and it asks you a bunch of questions about your mfa id, writes a file to your home directory/mfa/mfainfo.txt It then writes out a environment which contains the necessary environment variables to make aws happy.
Finally, you need to have a bash alias:
`alias setenv='source /home/yourhomedir/mfa/environment`
You can then happily run aws with mfa enabled. Ick.
