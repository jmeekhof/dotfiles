# function tg-old --description 'alias tg=terragrunt'
#     set -f profile none
#     for i in (pwd | string split /)
#         if test $profile = found
#             set profile $i
#         else if test $i = terraform
#             set profile found
#         end
#     end
#     echo Running in $profile
#     set -x AWS_PROFILE $profile
#     # see if user session is valid
#     aws sts get-caller-identity 2>/dev/null
#     if test $status != 0
#         aws sso login
#     end
#     terragrunt $argv
# end
function tg --description 'alias tg=terragrunt'
    al
    terragrunt $argv
end
