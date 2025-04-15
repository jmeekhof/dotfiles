function set_aws_profile --description 'Sets the AWS_PROFILE using current dir'
    set -f profile none
    for i in (pwd | string split /)
        if test $profile = found
            set profile $i
        else if test $i = terraform
            set profile found
        end
    end
    echo Running in $profile
    set -xg AWS_PROFILE $profile
end
