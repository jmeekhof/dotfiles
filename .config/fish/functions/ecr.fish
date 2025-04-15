function ecr -a AWS_ENV
    switch $AWS_ENV
        case development
            set PROFILE dev
            set AWS_ACCT 357509579774
        case stage
            set PROFILE stage
            set AWS_ACCT 458622101932
        case '*'
            set PROFILE prod
            set AWS_ACCT 505480154940
    end
    aws ecr get-login-password --region us-east-2 --profile=$PROFILE | docker login --username AWS --password-stdin $AWS_ACCT.dkr.ecr.us-east-2.amazonaws.com
end
