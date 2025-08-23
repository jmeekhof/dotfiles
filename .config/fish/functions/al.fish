function al --description 'Log into AWS using current dir or argv'
    set -f aws_account
    if test -n "$argv"
        # if test "$argv" = prod
        #     set aws_account prod-phi
        # else if test "$argv" = stage
        #     set aws_account prod-nophi
        # else if test "$argv" = stagephi
        #     set aws_account stage-phi
        # else
        #     set aws_account "$argv"
        # end
        set aws_account "$argv"
        echo Logging into "$aws_account" account >&2
        set -xg AWS_PROFILE "$aws_account"
    else
        set_aws_profile
    end
    # see if user session is valid
    aws sts get-caller-identity >/dev/null
    if test $status != 0
        aws sso login
    end
    set info (aws sts get-caller-identity 2>/dev/null)
    set account (echo $info | jq -r '.Account')
    set user (echo $info | jq -r '.UserId')
    echo "User: $user" >&2
    echo "Account: $account" >&2
    set -xg LOCAL_AWS_ACCOUNT "$account"
    set -xg LOCAL_AWS_USER "$user"
end
