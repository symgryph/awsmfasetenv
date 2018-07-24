#!/usr/bin/perl -w
open (MFAID, ">/<YOURHOMEDIR>/mfa/mfainfo.txt");
open (ENVIRONMENT, ">/<YOURHOMEDIR>/mfa/environment");
delete $ENV{'AWS_ACCESS_KEY'};
delete $ENV{'AWS_ACCESS_KEY_ID'};
delete $ENV{'AWS_SESSION_TOKEN'};
$mfaid="arn:aws:iam::111111111111:mfa/<USERID>";
print ("Please enter your token ID and press enter: ");
chomp ($tokencode=<>);
$mfaid=`aws sts get-session-token --serial-number $mfaid --token-code $tokencode`;
print MFAID "$mfaid";
close MFAID;
$AccessKeyId=`jq -r .Credentials.AccessKeyId /<YOURHOMEDIR>/mfa/mfainfo.txt`;
$SecretAccessKey=`jq -r .Credentials.SecretAccessKey /<YOURHOMEDIR>/mfa/mfainfo.txt`;
$SessionToken=`jq -r .Credentials.SessionToken /YOURHOMEDIR>/mfa/mfainfo.txt`;
print ENVIRONMENT "export AWS_ACCESS_KEY_ID=$AccessKeyId";
print ENVIRONMENT "export AWS_SECRET_ACCESS_KEY=$SecretAccessKey";
print ENVIRONMENT "export AWS_SESSION_TOKEN=$SessionToken";
close ENVIRONMENT;

